-- Add Notified status to negotiate_status and delete presented status
DELETE FROM application.negotiate_status WHERE code IN ('presented', 'notified', 'agreed'); 
DELETE FROM application.negotiate_type  WHERE code IN ('lease'); 
INSERT INTO application.negotiate_status (code, display_value, description, status)
VALUES ('notified', 'Notified', 'The purchaser has notified or presented an offer to the vendor for their consideration.', 'c'); 

UPDATE application.negotiate_type 
SET    display_value = 'Open Market'
WHERE  code = 'open'; 
INSERT INTO application.negotiate_type (code, display_value, description, status)
VALUES ('lease', 'Lease', 'The negotiation in relation to leasing rather purchasing the property.', 'c'); 

--- ***  Revise columns in the negotiate table using drop and re-create
DROP TABLE IF EXISTS application.negotiate_uses_source;
DROP TABLE IF EXISTS application.negotiate_uses_source_historic;;
DROP TABLE IF EXISTS application.negotiate;
DROP TABLE IF EXISTS application.negotiate_historic;

-- *** negotiate
CREATE TABLE application.negotiate
(  
  id character varying(40) NOT NULL,
  service_id character varying(40) NOT NULL, 
  ba_unit_id character varying(40) NOT NULL, 
  initial_amount numeric(29,2) DEFAULT 0,
  final_amount numeric(29,2) DEFAULT 0,
  notification_date timestamp without time zone, 
  type_code character varying(20),
  status_code character varying(20),
  description text,  
  classification_code character varying(20),
  redact_code character varying(20),
  rowidentifier character varying(40) NOT NULL DEFAULT uuid_generate_v1(), 
  rowversion integer NOT NULL DEFAULT 0,
  change_action character(1) NOT NULL DEFAULT 'i'::bpchar,
  change_user character varying(50),
  change_time timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT negotiate_pkey PRIMARY KEY (id),
  CONSTRAINT negotiate_service_id_fk FOREIGN KEY (service_id)
      REFERENCES application.service (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT negotiate_ba_unit_id_fk FOREIGN KEY (ba_unit_id)
      REFERENCES administrative.ba_unit (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT negotiate_type_code_fk FOREIGN KEY (type_code)
      REFERENCES application.negotiate_type (code) MATCH SIMPLE,
  CONSTRAINT negotiate_status_code_fk FOREIGN KEY (status_code)
      REFERENCES application.negotiate_status (code) MATCH SIMPLE
);

COMMENT ON TABLE application.negotiate
  IS 'Summarizes details of the negotiation between the state and the landholder in relation to a property being acquired or disposed by the state.
Tags: SOLA State Land Extension, Change History';
COMMENT ON COLUMN application.negotiate.id IS 'Identifier for the notification.';
COMMENT ON COLUMN application.negotiate.service_id IS 'Identifier for the service.';
COMMENT ON COLUMN application.negotiate.ba_unit_id IS 'Identifier for the ba_unit (a.k.a. property).';
COMMENT ON COLUMN application.negotiate.description IS 'General details related to the negotiation such as a summary of any specific conditions, etc.';
COMMENT ON COLUMN application.negotiate.type_code IS 'The type of negotiation. One of Open or Compulsory, etc.';
COMMENT ON COLUMN application.negotiate.status_code IS 'The status of the negotiation. Indicates the stage of the negotiation process. One of Pending, Presented, Negotiating, Rejected, Withdrawn, Agreed, Completed, etc.';
COMMENT ON COLUMN application.negotiate.notification_date IS 'The date the land holder is notified of the initial offer and negotiation begins. This date can be used to calculate when the offer expires or when responses are required, etc.';
COMMENT ON COLUMN application.negotiate.initial_amount IS 'The initial amount offered for the property to start the negotiation. Usually set based on valuations that have been undertaken.';
COMMENT ON COLUMN application.negotiate.final_amount IS 'The final amount resulting from the negotiation.';
COMMENT ON COLUMN application.negotiate.classification_code IS 'SOLA State Land Extension: The security classification for this Negotiation. Only users with the security classification (or a higher classification) will be able to view the record. If null, the record is considered unrestricted.';
COMMENT ON COLUMN application.negotiate.redact_code IS 'SOLA State Land Extension: The redact classification for this Negotiation. Only users with the redact classification (or a higher classification) will be able to view the record with un-redacted fields. If null, the record is considered unrestricted and no redaction to the record will occur unless bulk redaction classifications have been set for fields of the record.';
COMMENT ON COLUMN application.negotiate.rowidentifier IS 'Identifies the all change records for the row in the negotiate_historic table';
COMMENT ON COLUMN application.negotiate.rowversion IS 'Sequential value indicating the number of times this row has been modified.';
COMMENT ON COLUMN application.negotiate.change_action IS 'Indicates if the last data modification action that occurred to the row was insert (i), update (u) or delete (d).';
COMMENT ON COLUMN application.negotiate.change_user IS 'The user id of the last person to modify the row.';
COMMENT ON COLUMN application.negotiate.change_time IS 'The date and time the row was last modified.';

CREATE INDEX negotiate_index_on_rowidentifier
  ON application.negotiate
  USING btree
  (rowidentifier COLLATE pg_catalog."default");
  
CREATE INDEX negotiate_index_on_service_id
  ON application.negotiate
  USING btree
  (service_id COLLATE pg_catalog."default");
  
CREATE INDEX negotiate_index_on_ba_unit_id
  ON application.negotiate
  USING btree
  (ba_unit_id COLLATE pg_catalog."default");

CREATE TRIGGER __track_changes
  BEFORE INSERT OR UPDATE
  ON application.negotiate
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_changes();

CREATE TRIGGER __track_history
  AFTER UPDATE OR DELETE
  ON application.negotiate
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_history();


CREATE TABLE application.negotiate_historic
(  
  id character varying(40),
  service_id character varying(40), 
  ba_unit_id character varying(40), 
  initial_amount numeric(29,2) DEFAULT 0,
  final_amount numeric(29,2) DEFAULT 0,
  notification_date timestamp without time zone, 
  type_code character varying(20),
  status_code character varying(20),
  description text,  
  classification_code character varying(20),
  redact_code character varying(20),
  rowidentifier character varying(40), 
  rowversion integer NOT NULL DEFAULT 0,
  change_action character(1),
  change_user character varying(50),
  change_time timestamp without time zone,
  change_time_valid_until timestamp without time zone NOT NULL DEFAULT now());

COMMENT ON TABLE application.negotiate_historic
  IS 'History table for the application.negotiate table';

CREATE INDEX negotiate_historic_index_on_rowidentifier
  ON application.negotiate_historic
  USING btree
  (rowidentifier COLLATE pg_catalog."default");
  
 
-- *** negotiate_uses_source 
CREATE TABLE application.negotiate_uses_source
(
  negotiate_id character varying(40) NOT NULL,
  source_id character varying(40) NOT NULL, 
  rowidentifier character varying(40) NOT NULL DEFAULT uuid_generate_v1(), 
  rowversion integer NOT NULL DEFAULT 0, 
  change_action character(1) NOT NULL DEFAULT 'i'::bpchar, 
  change_user character varying(50),
  change_time timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT negotiate_uses_source_pkey PRIMARY KEY (negotiate_id, source_id),
  CONSTRAINT negotiate_uses_source_negotiate_id_fk FOREIGN KEY (negotiate_id)
      REFERENCES application.negotiate (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT negotiate_uses_source_source_id_fk FOREIGN KEY (source_id)
      REFERENCES source.source (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
);


COMMENT ON TABLE application.negotiate_uses_source
  IS 'Links sources (a.k.a. documents) to the applicable negotiation records. 
Tags: FLOSS SOLA Extension, Change History';
COMMENT ON COLUMN application.negotiate_uses_source.negotiate_id IS 'Identifier for the negotiation the record is associated to.';
COMMENT ON COLUMN application.negotiate_uses_source.source_id IS 'Identifier of the source associated to the negotiation.';
COMMENT ON COLUMN application.negotiate_uses_source.rowidentifier IS 'Identifies the all change records for the row in the negotiate_uses_source table';
COMMENT ON COLUMN application.negotiate_uses_source.rowversion IS 'Sequential value indicating the number of times this row has been modified.';
COMMENT ON COLUMN application.negotiate_uses_source.change_action IS 'Indicates if the last data modification action that occurred to the row was insert (i), update (u) or delete (d).';
COMMENT ON COLUMN application.negotiate_uses_source.change_user IS 'The user id of the last person to modify the row.';
COMMENT ON COLUMN application.negotiate_uses_source.change_time IS 'The date and time the row was last modified.';

CREATE INDEX negotiate_uses_source_negotiate_id_fk_ind
  ON application.negotiate_uses_source
  USING btree
  (negotiate_id COLLATE pg_catalog."default");

CREATE INDEX negotiate_uses_source_index_on_rowidentifier
  ON application.negotiate_uses_source
  USING btree
  (rowidentifier COLLATE pg_catalog."default");

CREATE INDEX negotiate_uses_source_source_id_fk_ind
  ON application.negotiate_uses_source
  USING btree
  (source_id COLLATE pg_catalog."default");

CREATE TRIGGER __track_changes
  BEFORE INSERT OR UPDATE
  ON application.negotiate_uses_source
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_changes();

CREATE TRIGGER __track_history
  AFTER UPDATE OR DELETE
  ON application.negotiate_uses_source
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_history();
  
 
CREATE TABLE application.negotiate_uses_source_historic
(
  negotiate_id character varying(40),
  source_id character varying(40),
  rowidentifier character varying(40),
  rowversion integer,
  change_action character(1),
  change_user character varying(50),
  change_time timestamp without time zone,
  change_time_valid_until timestamp without time zone NOT NULL DEFAULT now()
);

CREATE INDEX negotiate_uses_source_historic_index_on_rowidentifier
  ON application.negotiate_uses_source_historic
  USING btree
  (rowidentifier COLLATE pg_catalog."default");
