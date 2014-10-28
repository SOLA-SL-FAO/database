--- ***  Drop and create the public display tables
DROP TABLE IF EXISTS administrative.valuation;
DROP TABLE IF EXISTS administrative.valuation_historic;
DROP TABLE IF EXISTS administrative.source_describes_valuation;
DROP TABLE IF EXISTS administrative.source_describes_valuation_historic;
DROP TABLE IF EXISTS administrative.valuation_type;

-------------- table starts ------------------

CREATE TABLE administrative.valuation
(
  id character varying(40) NOT NULL,
  nr character varying(40) NOT NULL, 
  ba_unit_id character varying(40) NOT NULL, 
  amount numeric(29,2) DEFAULT 0,
  valuation_date timestamp without time zone,
  type_code character varying(20),
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
  IS 'Indicates if the checklist items applicable to a service are satisified as well as any comments from the user.
Tags: SOLA State Land Extension, Change History';
COMMENT ON COLUMN administrative.valuation.id IS 'Identifier for the valuation item.';
COMMENT ON COLUMN administrative.valuation.nr IS 'reference number for the valuation either supplied by the system or the user';
COMMENT ON COLUMN administrative.valuation.ba_unit_id IS 'Optional reference to administrative.ba_unit';
COMMENT ON COLUMN administrative.valuation.amount IS 'The dollar amount resulting from the valuation';
COMMENT ON COLUMN administrative.valuation.valuation_date IS 'The date the valuation was conducted, null is default';
COMMENT ON COLUMN administrative.valuation.type_code IS 'the type of valuation (mass, individual, owner supplied, etc)';
COMMENT ON COLUMN administrative.valuation.description IS 'The description for the public display item. Entered by the user.';
COMMENT ON COLUMN administrative.valuation.transaction_id IS 'Optional field linking to the transaction.transaction table';
COMMENT ON COLUMN administrative.valuation.classification_code IS 'SOLA State Land Extension: The security classification for this Application/Job. Only users with the security classification (or a higher classification) will be able to view the record. If null, the record is considered unrestricted.';
COMMENT ON COLUMN administrative.valuation.redact_code IS 'SOLA State Land Extension: The redact classification for this Application/Job. Only users with the redact classification (or a higher classification) will be able to view the record with un-redacted fields. If null, the record is considered unrestricted and no redaction to the record will occur unless bulk redaction classifications have been set for fields of the record.';
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
  );
  COMMENT ON TABLE administrative.valuation_historic
  IS 'History table for the administrative.valuation_historic';

CREATE INDEX valuation_historic_index_on_rowidentifier
  ON administrative.valuation_historic
  USING btree
  (rowidentifier COLLATE pg_catalog."default");
  
CREATE TABLE administrative.valuation_type
(
  code character varying(20) NOT NULL, 
  display_value character varying(500) NOT NULL, 
  description text, 
  status character(1) NOT NULL, 
  CONSTRAINT valuation_type_pkey PRIMARY KEY (code),
  CONSTRAINT valuation_type_display_value_unique UNIQUE (valuation_value)
);

COMMENT ON TABLE administrative.valuation_type
  IS 'Code list of valuation types
Tags: SOLA State Land Extension, Reference Table';
COMMENT ON COLUMN administrative.valuation_type.code IS 'The code for the valuation type.';
COMMENT ON COLUMN administrative.valuation_type.display_value IS 'Displayed value of the valuation type.';
COMMENT ON COLUMN administrative.valuation_type.description IS 'Description of the valuation type.';
COMMENT ON COLUMN administrative.valuation_type.status IS 'Status of the valuation type.';

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
  IS 'Links the public display items to the sources (a.k.a. documents) submitted with the application. 
Tags: FLOSS SOLA Extension, Change History';
COMMENT ON COLUMN application.source_describes_valuation.valuation_id IS 'Identifier for the valuation item the record is associated to.';
COMMENT ON COLUMN application.source_describes_valuation.source_id IS 'Identifier of the source associated to the application.';
COMMENT ON COLUMN application.source_describes_valuation.rowidentifier IS 'Identifies the all change records for the row in the source_describes_valuation_historic table';
COMMENT ON COLUMN application.source_describes_valuation.rowversion IS 'Sequential value indicating the number of times this row has been modified.';
COMMENT ON COLUMN application.source_describes_valuation.change_action IS 'Indicates if the last data modification action that occurred to the row was insert (i), update (u) or delete (d).';
COMMENT ON COLUMN application.source_describes_valuation.change_user IS 'The user id of the last person to modify the row.';
COMMENT ON COLUMN application.source_describes_valuation.change_time IS 'The date and time the row was last modified.';

CREATE INDEX source_describes_valuation_index_on_rowidentifier
  ON administrative.source_describes_valuation
  USING btree
  (rowidentifier COLLATE pg_catalog."default");

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

