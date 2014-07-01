
--# Schema and configuration for Notations on State Land Property

-- Add new role for adding/editing notations
INSERT INTO system.approle (code, display_value, status, description)
SELECT 'BaUnitNotes', 'Property - Add & Edit Notes','c', 'Allows property notes to be added or edited.'
WHERE NOT EXISTS (SELECT code FROM system.approle WHERE code = 'BaUnitNotes');

INSERT INTO system.approle_appgroup (approle_code, appgroup_id) 
    (SELECT 'BaUnitNotes', ag.id FROM system.appgroup ag WHERE ag."name" = 'Super group'
	 AND NOT EXISTS (SELECT approle_code FROM system.approle_appgroup 
	                 WHERE  approle_code = 'BaUnitNotes'
					 AND    appgroup_id = ag.id));
					 

DROP TABLE IF EXISTS administrative.source_describes_notation; 
CREATE TABLE administrative.source_describes_notation
(
  source_id character varying(40) NOT NULL, 
  notation_id character varying(40) NOT NULL, 
  rowidentifier character varying(40) NOT NULL DEFAULT uuid_generate_v1(), 
  rowversion integer NOT NULL DEFAULT 0, 
  change_action character(1) NOT NULL DEFAULT 'i'::bpchar, 
  change_user character varying(50),
  change_time timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT source_describes_notation_pkey PRIMARY KEY (source_id, notation_id),
  CONSTRAINT source_describes_notation_notation_id_fkey FOREIGN KEY (notation_id)
      REFERENCES administrative.notation (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT source_describes_notation_source_id_fkey FOREIGN KEY (source_id)
      REFERENCES source.source (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
);

ALTER TABLE administrative.source_describes_notation
  OWNER TO postgres;
COMMENT ON TABLE administrative.source_describes_notation
  IS 'Associates a Notation with one or more source (a.k.a. document) records.
Tags: FLOSS SOLA State Land Extension, Change History';
COMMENT ON COLUMN administrative.source_describes_notation.source_id IS 'Identifier for the source associated with the Notation.';
COMMENT ON COLUMN administrative.source_describes_notation.notation_id IS 'Identifier for the Notation.';
COMMENT ON COLUMN administrative.source_describes_notation.rowidentifier IS 'Identifies the all change records for the row in the source_describes_ba_unit_historic table';
COMMENT ON COLUMN administrative.source_describes_notation.rowversion IS 'Sequential value indicating the number of times this row has been modified.';
COMMENT ON COLUMN administrative.source_describes_notation.change_action IS 'Indicates if the last data modification action that occurred to the row was insert (i), update (u) or delete (d).';
COMMENT ON COLUMN administrative.source_describes_notation.change_user IS 'The user id of the last person to modify the row.';
COMMENT ON COLUMN administrative.source_describes_notation.change_time IS 'The date and time the row was last modified.';

DROP TABLE IF EXISTS administrative.source_describes_notation_historic;
CREATE TABLE administrative.source_describes_notation_historic
(
  source_id character varying(40) NOT NULL, 
  notation_id character varying(40) NOT NULL, 
  rowidentifier character varying(40) NOT NULL DEFAULT uuid_generate_v1(), 
  rowversion integer NOT NULL DEFAULT 0, 
  change_action character(1) NOT NULL DEFAULT 'i'::bpchar, 
  change_user character varying(50), 
  change_time timestamp without time zone NOT NULL DEFAULT now(), 
   change_time_valid_until timestamp without time zone NOT NULL DEFAULT now()
);

CREATE INDEX source_describes_notation_historic_rowidentifier_idx
  ON administrative.source_describes_notation_historic
  USING btree
  (rowidentifier COLLATE pg_catalog."default");
  
 
-- Notation Status Type table.  
CREATE TABLE administrative.notation_status_type
(
  code character varying(20) NOT NULL, 
  display_value character varying(500) NOT NULL, 
  description character varying(1000), 
  status character(1) NOT NULL,
  CONSTRAINT notation_status_type_pkey PRIMARY KEY (code),
  CONSTRAINT notation_status_type_display_value_unique UNIQUE (display_value)
);

ALTER TABLE administrative.notation_status_type
  OWNER TO postgres;
COMMENT ON TABLE administrative.notation_status_type
  IS 'Code list of notation status types. e.g. Action Required, Completed, On Hold, etc.
Tags: FLOSS SOLA State Land Extension, Reference Table';
COMMENT ON COLUMN administrative.notation_status_type.code IS 'The code for the notation status type.';
COMMENT ON COLUMN administrative.notation_status_type.display_value IS 'Displayed value of the notation status type.';
COMMENT ON COLUMN administrative.notation_status_type.description IS 'Description of the notation status type.';
COMMENT ON COLUMN administrative.notation_status_type.status IS 'Status of the notation status type.';

INSERT INTO administrative.notation_status_type(code, display_value, status, description)
SELECT 'completed', 'Action Completed', 'c', 'All activities or actions for the notation have been completed.'
WHERE NOT EXISTS (SELECT code FROM administrative.notation_status_type WHERE code = 'completed'); 

INSERT INTO administrative.notation_status_type(code, display_value, status, description)
SELECT 'actionReqd', 'Action Required', 'c', 'Some activity or action is required in relation to the property.'
WHERE NOT EXISTS (SELECT code FROM administrative.notation_status_type WHERE code = 'actionReqd'); 

INSERT INTO administrative.notation_status_type(code, display_value, status, description)
SELECT 'onHold', 'On Hold', 'c', 'No action or activity is required in relation to the notation for the timebeing.'
WHERE NOT EXISTS (SELECT code FROM administrative.notation_status_type WHERE code = 'onHold');

INSERT INTO administrative.notation_status_type(code, display_value, status, description)
SELECT 'actionReqdUrgent', 'Urgent Action Required', 'c', 'Urgent activities or actions are required in relation to the property.'
WHERE NOT EXISTS (SELECT code FROM administrative.notation_status_type WHERE code = 'actionReqdUrgent');

INSERT INTO administrative.notation_status_type(code, display_value, status, description)
SELECT 'general', 'General', 'c', 'The notation is a general note and no activity or action is necessary.'
WHERE NOT EXISTS (SELECT code FROM administrative.notation_status_type WHERE code = 'general');			

ALTER TABLE administrative.notation 
   DROP CONSTRAINT IF EXISTS notation_status_code_fk74; 

-- Notation does not require a transaction for State Land
ALTER TABLE administrative.notation 
   ALTER COLUMN transaction_id DROP NOT NULL;

ALTER TABLE administrative.notation 
   ADD CONSTRAINT notation_status_code_fkey FOREIGN KEY (status_code)
      REFERENCES administrative.notation_status_type (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE RESTRICT; 	  
					 



					 
-- Add new role for the Measure tool
INSERT INTO system.approle (code, display_value, status, description)
SELECT 'MeasureMap', 'Map - Measure','c', 'Allows the user to measure distances on the map using the Measure tool.'
WHERE NOT EXISTS (SELECT code FROM system.approle WHERE code = 'MeasureMap');

INSERT INTO system.approle_appgroup (approle_code, appgroup_id) 
    (SELECT 'MeasureMap', ag.id FROM system.appgroup ag WHERE ag."name" = 'Super group'
	 AND NOT EXISTS (SELECT approle_code FROM system.approle_appgroup 
	                 WHERE  approle_code = 'MeasureMap'
					 AND    appgroup_id = ag.id));
