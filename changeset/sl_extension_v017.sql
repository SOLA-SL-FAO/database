DELETE FROM transaction.transaction WHERE from_service_id IN 
(SELECT id from application.service WHERE  request_type_code IN ('slValuation'));
DELETE FROM application.service where request_type_code IN ('slValuation');
DELETE FROM application.request_type WHERE code IN ('slValuation');
DELETE FROM system.config_panel_launcher WHERE code IN ('slValuation');
DELETE FROM system.approle WHERE code IN ('slValuation');
 
INSERT INTO system.config_panel_launcher(code, display_value, description, status, launch_group, panel_class, message_code, card_name)
SELECT 'slValuation', 'Valuations List Panel', null, 'c', 'generalServices', 'org.sola.clients.swing.desktop.administrative.ValuationListPanel',
null, 'slValuationListPanel'
WHERE NOT EXISTS (SELECT code FROM system.config_panel_launcher WHERE code = 'slValuation');
 
INSERT INTO application.request_type(code, request_category_code, display_value,
            status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee,
            nr_properties_required, notation_template, rrr_type_code, type_action_code,
            description, display_group_name, service_panel_code)
    SELECT 'slValuation','stateLandServices','Manage Valuations','c',5,0.00,0.00,0.00,0,
                null,null,null,'Records details of valuations raised by parties affected by State Land activities','General', 'slValuation'
                WHERE NOT EXISTS (SELECT code FROM application.request_type WHERE code = 'slValuation');
 
--When a user starts a task, SOLA checks to ensure they have a security role matching the name of the request_type before they can start (or view) the task,
--so its necessary to create an approle  matching the new task and link that role to the Super group  
INSERT INTO system.approle (code, display_value, status, description)
SELECT 'slValuation', 'Service - Manage Valuations','c', 'State Land Service. Allows the Manage Valuations service to be started.'
WHERE NOT EXISTS (SELECT code FROM system.approle WHERE code = 'slValuation');
 
INSERT INTO system.approle_appgroup (approle_code, appgroup_id)
    (SELECT 'slValuation', ag.id FROM system.appgroup ag WHERE ag."name" = 'Super group'
                AND NOT EXISTS (SELECT approle_code FROM system.approle_appgroup
                                 WHERE  approle_code = 'slValuation' AND appgroup_id = ag.id));



--- ***  Drop and create the public display tables
DROP TABLE IF EXISTS administrative.valuation CASCADE;
DROP TABLE IF EXISTS administrative.valuation_historic;
DROP TABLE IF EXISTS administrative.source_describes_valuation;
DROP TABLE IF EXISTS administrative.source_describes_valuation_historic;
DROP TABLE IF EXISTS administrative.valuation_type;
DROP TABLE IF EXISTS administrative.valuation_property;
DROP TABLE IF EXISTS administrative.valuation_property_historic;


 -------------- table starts ------------------
  
  
CREATE TABLE administrative.valuation_type
(
  code character varying(20) NOT NULL, 
  display_value character varying(500) NOT NULL, 
  description text, 
  status character(1) NOT NULL, 
  CONSTRAINT valuation_type_pkey PRIMARY KEY (code),
  CONSTRAINT valuation_type_display_value_unique UNIQUE (display_value)
);

COMMENT ON TABLE administrative.valuation_type
  IS 'Code list of valuation types
Tags: SOLA State Land Extension, Reference Table';
COMMENT ON COLUMN administrative.valuation_type.code IS 'The code for the valuation type.';
COMMENT ON COLUMN administrative.valuation_type.display_value IS 'Displayed value of the valuation type.';
COMMENT ON COLUMN administrative.valuation_type.description IS 'Description of the valuation type.';
COMMENT ON COLUMN administrative.valuation_type.status IS 'Status of the valuation type.';

INSERT INTO administrative.valuation_type (code, display_value, description, status)
VALUES ('mass', 'Mass', 'Property value has been determined through a mass valuation process', 'c'); 
INSERT INTO administrative.valuation_type (code, display_value, description, status)
VALUES ('market', 'Market', 'The value the property will likely trade for between a willing buyer and willing seller as at the valuation date.', 'c'); 
INSERT INTO administrative.valuation_type (code, display_value, description, status)
VALUES ('valueInUse', 'Value In Use', 'Represents the cash flow generated for a specific owner under a specific use.', 'c'); 
INSERT INTO administrative.valuation_type (code, display_value, description, status)
VALUES ('investment', 'Investment Value', 'The value of the property to an owner or prospective owner for investment or operational objectives', 'c'); 
INSERT INTO administrative.valuation_type (code, display_value, description, status)
VALUES ('insurable', 'Insurable Value', 'Property value for insurance purposes. Excludes site value.', 'c'); 
INSERT INTO administrative.valuation_type (code, display_value, description, status)
VALUES ('liquidation', 'Liquidation Value', 'Property value where the owner is compelled to sell due to bankruptcy or forced sale.', 'c');

-------------- table ends ------------------


-------------- table starts ------------------

CREATE TABLE administrative.valuation
(
  id character varying(40) NOT NULL,
  nr character varying(40) NOT NULL, 
  ba_unit_id character varying(40) NOT NULL, 
  amount numeric(29,2) DEFAULT 0,
  valuation_date timestamp without time zone,
  type_code character varying(20),
  source character varying(250),
  description text,
  transaction_id character varying(40),
  classification_code character varying(20),
  redact_code character varying(20), 
  rowidentifier character varying(40) NOT NULL DEFAULT uuid_generate_v1(),
  rowversion integer NOT NULL DEFAULT 0,
  change_action character(1) NOT NULL DEFAULT 'i'::bpchar,
  change_user character varying(50),
  change_time timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT valuation_pkey PRIMARY KEY (id),
  CONSTRAINT valuation_type_code_fk FOREIGN KEY (type_code)
      REFERENCES administrative.valuation_type (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT valuation_ba_unit_id_fk FOREIGN KEY (ba_unit_id)
      REFERENCES administrative.ba_unit (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT valuation_transaction_id_fk FOREIGN KEY (transaction_id)
      REFERENCES transaction.transaction (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE	  
);

COMMENT ON TABLE administrative.valuation
  IS 'Captures summary valuation details for a property.
Tags: SOLA State Land Extension, Change History';
COMMENT ON COLUMN administrative.valuation.id IS 'Identifier for the valuation item.';
COMMENT ON COLUMN administrative.valuation.nr IS 'Reference number for the valuation either supplied by the system or the user';
COMMENT ON COLUMN administrative.valuation.ba_unit_id IS 'Mandatory reference to administrative.ba_unit';
COMMENT ON COLUMN administrative.valuation.amount IS 'The dollar amount resulting from the valuation';
COMMENT ON COLUMN administrative.valuation.valuation_date IS 'The date the valuation applies from';
COMMENT ON COLUMN administrative.valuation.type_code IS 'The type of valuation (mass, market, investment, insurable, etc)';
COMMENT ON COLUMN administrative.valuation.source IS 'The source of valuation and/or name of the valuer. Usually will be one of the state, the owner or a third party';
COMMENT ON COLUMN administrative.valuation.description IS 'The description for the public display item. Entered by the user.';
COMMENT ON COLUMN administrative.valuation.transaction_id IS 'Links the valuation to a transaction. Optional.';
COMMENT ON COLUMN administrative.valuation.classification_code IS 'SOLA State Land Extension: The security classification for this valuation. Only users with the security classification (or a higher classification) will be able to view the record. If null, the record is considered unrestricted.';
COMMENT ON COLUMN administrative.valuation.redact_code IS 'SOLA State Land Extension: The redact classification for this valuation. Only users with the redact classification (or a higher classification) will be able to view the record with un-redacted fields. If null, the record is considered unrestricted and no redaction to the record will occur unless bulk redaction classifications have been set for fields of the record.';
COMMENT ON COLUMN administrative.valuation.rowidentifier IS 'Identifies all the change records for the row in the valuation_historic table';
COMMENT ON COLUMN administrative.valuation.rowversion IS 'Sequential value indicating the number of times this row has been modified.';
COMMENT ON COLUMN administrative.valuation.change_action IS 'Indicates if the last data modification action that occurred to the row was insert (i), update (u) or delete (d).';
COMMENT ON COLUMN administrative.valuation.change_user IS 'The user id of the last person to modify the row.';
COMMENT ON COLUMN administrative.valuation.change_time IS 'The date and time the row was last modified.';

CREATE INDEX valuation_index_on_rowidentifier
  ON administrative.valuation
  USING btree
  (rowidentifier COLLATE pg_catalog."default");
  
CREATE INDEX valuation_index_on_ba_unit_id
  ON administrative.valuation
  USING btree
  (ba_unit_id COLLATE pg_catalog."default");
  
CREATE INDEX valuation_index_on_transaction_id
  ON administrative.valuation
  USING btree
  (transaction_id COLLATE pg_catalog."default");

CREATE TRIGGER __track_changes
  BEFORE INSERT OR UPDATE
  ON administrative.valuation
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_changes();

CREATE TRIGGER __track_history
  AFTER UPDATE OR DELETE
  ON administrative.valuation
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_history();
  
  -------------- table ends ------------------
  
  -------------- table starts ------------------
  
  CREATE TABLE administrative.valuation_historic
 (
  id character varying(40) ,
  nr character varying(40) , 
  ba_unit_id character varying(40) , 
  amount numeric(29,2) ,
  valuation_date timestamp without time zone,
  type_code character varying(20),
  source character varying(250),
  description text,
  transaction_id character varying(40),
  classification_code character varying(20),
  redact_code character varying(20), 
  rowidentifier character varying(40) ,
  rowversion integer NOT NULL DEFAULT 0,
  change_action character(1) ,
  change_user character varying(50),
  change_time timestamp without time zone ,
  change_time_valid_until timestamp without time zone NOT NULL DEFAULT now());

COMMENT ON TABLE administrative.valuation_historic
  IS 'History table for the administrative.valuation_historic';

CREATE INDEX valuation_historic_index_on_rowidentifier
  ON administrative.valuation_historic
  USING btree
  (rowidentifier COLLATE pg_catalog."default");

 -------------- table ends ------------------
  
 -------------- table starts ------------------

CREATE TABLE administrative.source_describes_valuation
(
  valuation_id character varying(40) NOT NULL,
  source_id character varying(40) NOT NULL, 
  rowidentifier character varying(40) NOT NULL DEFAULT uuid_generate_v1(), 
  rowversion integer NOT NULL DEFAULT 0, 
  change_action character(1) NOT NULL DEFAULT 'i'::bpchar, 
  change_user character varying(50),
  change_time timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT source_describes_valuation_pkey PRIMARY KEY (valuation_id, source_id),
  CONSTRAINT source_describes_valuation_valuation_id_fk FOREIGN KEY (valuation_id)
      REFERENCES administrative.valuation (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT source_describes_valuation_source_id_fk FOREIGN KEY (source_id)
      REFERENCES source.source (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
);

COMMENT ON TABLE administrative.source_describes_valuation
  IS 'Links the valuation records to the sources (a.k.a. documents) submitted with the job. 
Tags: FLOSS SOLA Extension, Change History';
COMMENT ON COLUMN administrative.source_describes_valuation.valuation_id IS 'Identifier for the valuation item the record is associated to.';
COMMENT ON COLUMN administrative.source_describes_valuation.source_id IS 'Identifier of the source associated to the application.';
COMMENT ON COLUMN administrative.source_describes_valuation.rowidentifier IS 'Identifies the all change records for the row in the source_describes_valuation_historic table';
COMMENT ON COLUMN administrative.source_describes_valuation.rowversion IS 'Sequential value indicating the number of times this row has been modified.';
COMMENT ON COLUMN administrative.source_describes_valuation.change_action IS 'Indicates if the last data modification action that occurred to the row was insert (i), update (u) or delete (d).';
COMMENT ON COLUMN administrative.source_describes_valuation.change_user IS 'The user id of the last person to modify the row.';
COMMENT ON COLUMN administrative.source_describes_valuation.change_time IS 'The date and time the row was last modified.';

CREATE INDEX source_describes_valuation_index_on_rowidentifier
  ON administrative.source_describes_valuation
  USING btree
  (rowidentifier COLLATE pg_catalog."default");
  
CREATE INDEX source_describes_valuation_index_on_source_id
  ON administrative.source_describes_valuation
  USING btree
  (source_id COLLATE pg_catalog."default");
  
CREATE INDEX source_describes_valuation_index_on_valuation_id
  ON administrative.source_describes_valuation
  USING btree
  (valuation_id COLLATE pg_catalog."default");

CREATE TRIGGER __track_changes
  BEFORE INSERT OR UPDATE
  ON administrative.source_describes_valuation
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_changes();

CREATE TRIGGER __track_history
  AFTER UPDATE OR DELETE
  ON administrative.source_describes_valuation
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_history();
  
-------------- table ends ------------------
  
-------------- table starts ------------------
  
CREATE TABLE administrative.source_describes_valuation_historic
(
  valuation_id character varying(40),
  source_id character varying(40),
  rowidentifier character varying(40),
  rowversion integer,
  change_action character(1),
  change_user character varying(50),
  change_time timestamp without time zone,
  change_time_valid_until timestamp without time zone NOT NULL DEFAULT now()
);

COMMENT ON TABLE administrative.source_describes_valuation_historic
  IS 'History table for the administrative.source_describes_valuation_historic';
  
CREATE INDEX source_describes_valuation_historic_index_on_rowidentifier
  ON administrative.source_describes_valuation_historic
  USING btree
  (rowidentifier COLLATE pg_catalog."default");
  
  -------------- table ends ------------------
  
 -----------------  valuation_property starts ---------------------
CREATE TABLE administrative.valuation_property
(
  valuation_id character varying(40) NOT NULL,
  ba_unit_id character varying(40) NOT NULL, 
  rowidentifier character varying(40) NOT NULL DEFAULT uuid_generate_v1(), 
  rowversion integer NOT NULL DEFAULT 0, 
  change_action character(1) NOT NULL DEFAULT 'i'::bpchar, 
  change_user character varying(50),
  change_time timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT valuation_property_pkey PRIMARY KEY (valuation_id, ba_unit_id),
  CONSTRAINT valuation_property_valuation_id_fk FOREIGN KEY (valuation_id)
      REFERENCES administrative.valuation (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT valuation_property_ba_unit_id_fk FOREIGN KEY (ba_unit_id)
      REFERENCES administrative.ba_unit (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
);


COMMENT ON TABLE administrative.valuation_property
  IS 'Identifies the properties (a.k.a. Ba Units) this valuation table is related to. 
Tags: FLOSS SOLA Extension, Change History';
COMMENT ON COLUMN administrative.valuation_property.valuation_id IS 'Identifier for the valuation record is associated to.';
COMMENT ON COLUMN administrative.valuation_property.ba_unit_id IS 'Identifier of the property associated to the valuation.';
COMMENT ON COLUMN administrative.valuation_property.rowidentifier IS 'Identifies the all change records for the row in the valuation_property_historic table';
COMMENT ON COLUMN administrative.valuation_property.rowversion IS 'Sequential value indicating the number of times this row has been modified.';
COMMENT ON COLUMN administrative.valuation_property.change_action IS 'Indicates if the last data modification action that occurred to the row was insert (i), update (u) or delete (d).';
COMMENT ON COLUMN administrative.valuation_property.change_user IS 'The user id of the last person to modify the row.';
COMMENT ON COLUMN administrative.valuation_property.change_time IS 'The date and time the row was last modified.';

CREATE INDEX valuation_property_valuation_id_fk_ind
  ON administrative.valuation_property
  USING btree
  (valuation_id COLLATE pg_catalog."default");

CREATE INDEX valuation_property_index_on_rowidentifier
  ON administrative.valuation_property
  USING btree
  (rowidentifier COLLATE pg_catalog."default");

CREATE INDEX valuation_property_ba_unit_id_fk_ind
  ON administrative.valuation_property
  USING btree
  (ba_unit_id COLLATE pg_catalog."default");

CREATE TRIGGER __track_changes
  BEFORE INSERT OR UPDATE
  ON administrative.valuation_property
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_changes();

-----------------  valuation_property end ---------------------
   
-----------------  valuation_property_historic Starts ---------------------
 
CREATE TABLE administrative.valuation_property_historic
(
  valuation_id character varying(40),
  ba_unit_id character varying(40),
  rowidentifier character varying(40),
  rowversion integer,
  change_action character(1),
  change_user character varying(50),
  change_time timestamp without time zone,
  change_time_valid_until timestamp without time zone NOT NULL DEFAULT now()
);

CREATE INDEX valuation_property_historic_index_on_rowidentifier
  ON administrative.valuation_property_historic
  USING btree
  (rowidentifier COLLATE pg_catalog."default");
  
  -------------- table ends ------------------
  
  
  
-- Add task to support capturing price negotiation details between the state agency and the landholder 
DELETE FROM application.service where request_type_code IN ('slNegotiate');
DELETE FROM application.request_type WHERE code IN ('slNegotiate');
DELETE FROM system.config_panel_launcher WHERE code IN ('slNegotiate');
DELETE FROM system.approle WHERE code IN ('slNegotiate');

INSERT INTO system.config_panel_launcher(code, display_value, description, status, launch_group, panel_class, message_code, card_name)
SELECT 'slNegotiate', 'Negotiate List Panel', null, 'c', 'generalServices', 'org.sola.clients.swing.desktop.workflow.NegotiationListPanel', 
null, 'slNegotiationListPanel'
WHERE NOT EXISTS (SELECT code FROM system.config_panel_launcher WHERE code = 'slNegotiate'); 

INSERT INTO application.request_type(code, request_category_code, display_value, 
            status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, 
            nr_properties_required, notation_template, rrr_type_code, type_action_code, 
            description, display_group_name, service_panel_code)
    SELECT 'slNegotiate','stateLandServices','Manage Negotiations','c',5,0.00,0.00,0.00,0,
	null,null,null,'Used for managing negotiations for property acquisition or disposal','General', 'slNegotiate'
	WHERE NOT EXISTS (SELECT code FROM application.request_type WHERE code = 'slNegotiate');
	
INSERT INTO system.approle (code, display_value, status, description)
SELECT 'slNegotiate', 'Service - Manage Negotiations','c', 'State Land Service. Allows the Manage Negotiations service to be started.'
WHERE NOT EXISTS (SELECT code FROM system.approle WHERE code = 'slNegotiate');

INSERT INTO system.approle_appgroup (approle_code, appgroup_id) 
    (SELECT 'slNegotiate', ag.id FROM system.appgroup ag WHERE ag."name" = 'Super group'
	 AND NOT EXISTS (SELECT approle_code FROM system.approle_appgroup 
	                 WHERE  approle_code = 'slNegotiate'
					 AND    appgroup_id = ag.id));
					 
--- ***  Drop and create the negotiate tables
DROP TABLE IF EXISTS application.negotiate_uses_source;
DROP TABLE IF EXISTS application.negotiate_uses_source_historic;;
DROP TABLE IF EXISTS application.negotiate;
DROP TABLE IF EXISTS application.negotiate_historic;
DROP TABLE IF EXISTS application.negotiate_status;
DROP TABLE IF EXISTS application.negotiate_type;

-- *** negotiate_type
CREATE TABLE application.negotiate_type
(
  code character varying(20) NOT NULL, 
  display_value character varying(250) NOT NULL, 
  description text, 
  status character(1) NOT NULL, 
  CONSTRAINT negotiate_type_pkey PRIMARY KEY (code),
  CONSTRAINT negotiate_type_display_value_unique UNIQUE (display_value)
);

COMMENT ON TABLE application.negotiate_type
  IS 'Code list identifying the possible types of negotiation that may occur between landholders and the state. e.g. Compulsory, Open
Tags: SOLA State Land Extension, Reference Table';
COMMENT ON COLUMN application.negotiate_type.code IS 'The code for the negotiation type.';
COMMENT ON COLUMN application.negotiate_type.display_value IS 'Displayed value of the negotiation type.';
COMMENT ON COLUMN application.negotiate_type.description IS 'Description of the negotiation type.';
COMMENT ON COLUMN application.negotiate_type.status IS 'Status of the negotiation type (c - current, x - no longer valid).';

INSERT INTO application.negotiate_type (code, display_value, description, status)
VALUES ('compulsory', 'Compulsory', 'The parties are compelled to negotiation by statute or other legal requirement.', 'c'); 
INSERT INTO application.negotiate_type (code, display_value, description, status)
VALUES ('open', 'Open', 'The negotiation is free and open and neither party is required to participate.', 'c'); 


-- *** negotiate_status
CREATE TABLE application.negotiate_status
(
  code character varying(20) NOT NULL, 
  display_value character varying(250) NOT NULL, 
  description text, 
  status character(1) NOT NULL, 
  CONSTRAINT negotiate_status_pkey PRIMARY KEY (code),
  CONSTRAINT negotiate_status_display_value_unique UNIQUE (display_value)
);

COMMENT ON TABLE application.negotiate_status
  IS 'Code list identifying the status of the negotiation between the parties involved. e.g. Pending, Presented, Negotiating, Rejected, Withdrawn, Agreed, Completed
Tags: SOLA State Land Extension, Reference Table';
COMMENT ON COLUMN application.negotiate_status.code IS 'The code for the negotiation status.';
COMMENT ON COLUMN application.negotiate_status.display_value IS 'Displayed value of the negotiation status.';
COMMENT ON COLUMN application.negotiate_status.description IS 'Description of the negotiation status.';
COMMENT ON COLUMN application.negotiate_status.status IS 'Status of the negotiation status (c - current, x - no longer valid).';

INSERT INTO application.negotiate_status (code, display_value, description, status)
VALUES ('pending', 'Pending', 'The offer is being prepared and has not been presented to the other party yet.', 'c'); 
INSERT INTO application.negotiate_status (code, display_value, description, status)
VALUES ('presented', 'Presented', 'An offer has been presented by the initiating party and is being considered.', 'c'); 
INSERT INTO application.negotiate_status (code, display_value, description, status)
VALUES ('negotiating', 'Negotiating', 'The parties are negotiating the price and/or conditions.', 'c'); 
INSERT INTO application.negotiate_status (code, display_value, description, status)
VALUES ('rejected', 'Rejected', 'The party that received the original offer has rejected it and stopped further negotiation.', 'c');
INSERT INTO application.negotiate_status (code, display_value, description, status)
VALUES ('withdrawn', 'Withdrawn', 'The initiating party has withdrawn their offer and stopped further negotiation.', 'c');
INSERT INTO application.negotiate_status (code, display_value, description, status)
VALUES ('agreed', 'Agreed', 'The parties have agreed the terms of sale.', 'c');
INSERT INTO application.negotiate_status (code, display_value, description, status)
VALUES ('completed', 'Completed', 'The negotiation is complete and all necessary paperwork has been finalized.', 'c');

-- *** negotiate
CREATE TABLE application.negotiate
(  
  id character varying(40) NOT NULL,
  service_id character varying(40) NOT NULL, 
  ba_unit_id character varying(40) NOT NULL, 
  valuation_amount numeric(29,2) DEFAULT 0,
  offer_amount numeric(29,2) DEFAULT 0,
  agreed_amount numeric(29,2) DEFAULT 0,
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
COMMENT ON COLUMN application.negotiate.valuation_amount IS 'The amount indicated by the property valuation or the averaged or selected valuation amount if more than one valuation is available.';
COMMENT ON COLUMN application.negotiate.offer_amount IS 'The amount of the initial offer.';
COMMENT ON COLUMN application.negotiate.agreed_amount IS 'The amount agreed by all parties in the negotiation.';
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
  valuation_amount numeric(29,2),
  offer_amount numeric(29,2),
  agreed_amount numeric(29,2),
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
  