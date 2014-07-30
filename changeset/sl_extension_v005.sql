-- 24 July 2014
-- Code list updates following sprint review. 
INSERT INTO administrative.ba_unit_rel_type(code, display_value, status, description)
SELECT 'island', 'Island', 'c', 'The property is within an island.'
WHERE NOT EXISTS (SELECT code FROM administrative.ba_unit_rel_type WHERE code = 'island');

INSERT INTO administrative.ba_unit_rel_type(code, display_value, status, description)
SELECT 'settlement', 'Settlement', 'c', 'The property is within a settlement or village.'
WHERE NOT EXISTS (SELECT code FROM administrative.ba_unit_rel_type WHERE code = 'settlement');

INSERT INTO administrative.ba_unit_rel_type(code, display_value, status, description)
SELECT 'claimed', 'Claimed Land', 'c', 'The property is on an area of reclaimed land.'
WHERE NOT EXISTS (SELECT code FROM administrative.ba_unit_rel_type WHERE code = 'claimed');

INSERT INTO administrative.rrr_sub_type(code, rrr_type_code, display_value, status, description)
SELECT 'structure', 'heritage', 'Structure', 'c', 'The land has a heritage building or structure site located on it.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_sub_type WHERE code = 'structure');

INSERT INTO administrative.rrr_sub_type(code, rrr_type_code, display_value, status, description)
SELECT 'recreation', 'license', 'Recreation', 'c', 'The license applies to use of the land for recreational purposes such as a ski field.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_sub_type WHERE code = 'recreation');

INSERT INTO administrative.condition_type(code, display_value, status, description)
SELECT 'c7', '7. Removal of Contaminants', 'c', 'Any contaminants idenitified by the planning authority are to be removed and the land restored to is original state within 12 months from the begining of the lease.'
WHERE NOT EXISTS (SELECT code FROM administrative.condition_type WHERE code = 'c7');

UPDATE system.config_map_layer SET visible_in_start = TRUE WHERE name = 'house_num';


-- Make description a text field on the source table
ALTER TABLE source.source 
   ALTER COLUMN description TYPE TEXT;

ALTER TABLE source.source_historic
   ALTER COLUMN description TYPE TEXT;	
   
 -- Add a new field to application that can be used to contain a summary of the job 
ALTER TABLE application.application
  DROP COLUMN IF EXISTS description;
  
ALTER TABLE application.application
    ADD COLUMN description TEXT;
	 
COMMENT ON COLUMN application.application.description IS 'SOLA State Land Extension: A summary description for the SL Job';

ALTER TABLE application.application_historic
  DROP COLUMN IF EXISTS description;
  
ALTER TABLE application.application_historic
    ADD COLUMN description TEXT;
	
ALTER TABLE application.application
   ALTER COLUMN contact_person_id DROP NOT NULL;
   
   
   
-- Add Property Manager configuration data
INSERT INTO party.party_role_type (code, display_value, status, description)
SELECT 'propManager', 'Property Manager', 'c', 'Extension to LADM for State Land. Identifies the party as being a property manager. ' 
WHERE NOT EXISTS (SELECT code FROM party.party_role_type WHERE code = 'propManager');

INSERT INTO party.party (id, type_code, name, last_name, gender_code )
SELECT 'sl_party_1', 'naturalPerson', 'Edward', 'Smith', 'male' 
WHERE NOT EXISTS (SELECT id FROM party.party WHERE id = 'sl_party_1'); 
INSERT INTO party.party_role (party_id, type_code) 
SELECT 'sl_party_1', 'propManager'
WHERE NOT EXISTS (SELECT party_id FROM party.party_role
                  WHERE party_id = 'sl_party_1'
				  AND   type_code = 'propManager'); 
				  
INSERT INTO party.party (id, type_code, name)
SELECT 'sl_party_2', 'nonNaturalPerson', 'Property Management Services Inc.' 
WHERE NOT EXISTS (SELECT id FROM party.party WHERE id = 'sl_party_2'); 
INSERT INTO party.party_role (party_id, type_code) 
SELECT 'sl_party_2', 'propManager'
WHERE NOT EXISTS (SELECT party_id FROM party.party_role
                  WHERE party_id = 'sl_party_2'
				  AND   type_code = 'propManager'); 
				  

ALTER TABLE administrative.ba_unit_as_party
  DROP COLUMN IF EXISTS rowidentifier,
  DROP COLUMN IF EXISTS rowversion,
  DROP COLUMN IF EXISTS change_action,
  DROP COLUMN IF EXISTS change_user,
  DROP COLUMN IF EXISTS change_time; 
  
ALTER TABLE administrative.ba_unit_as_party
    ADD COLUMN rowidentifier character varying(40) NOT NULL DEFAULT uuid_generate_v1(),
	ADD COLUMN rowversion integer NOT NULL DEFAULT 0, 
	ADD COLUMN change_action character(1) NOT NULL DEFAULT 'i'::bpchar,
	ADD COLUMN change_user character varying(50),
	ADD COLUMN change_time timestamp without time zone NOT NULL DEFAULT now(); 
	
COMMENT ON COLUMN administrative.ba_unit_as_party.rowidentifier IS 'SOLA SL Extension: Identifies the all change records for the row in the ba_unit_as_party_historic table';
COMMENT ON COLUMN administrative.ba_unit_as_party.rowversion IS 'Sequential value indicating the number of times this row has been modified.';
COMMENT ON COLUMN administrative.ba_unit_as_party.change_action IS 'Indicates if the last data modification action that occurred to the row was insert (i), update (u) or delete (d).';
COMMENT ON COLUMN administrative.ba_unit_as_party.change_user IS 'The user id of the last person to modify the row.';
COMMENT ON COLUMN administrative.ba_unit_as_party.change_time IS 'The date and time the row was last modified.';

DROP TABLE IF EXISTS administrative.ba_unit_as_party_historic;
CREATE TABLE administrative.ba_unit_as_party_historic
(
  ba_unit_id character varying(40),
  party_id character varying(40),
  rowidentifier character varying(40),
  rowversion integer,
  change_action character(1),
  change_user character varying(50),
  change_time timestamp without time zone,
  change_time_valid_until timestamp without time zone NOT NULL DEFAULT now()
);

CREATE INDEX ba_unit_as_party_historic_index_on_rowidentifier
  ON administrative.ba_unit_as_party_historic
  USING btree
  (rowidentifier COLLATE pg_catalog."default");
  
  
 -- Create triggers to track history changes 
CREATE TRIGGER __track_changes
  BEFORE INSERT OR UPDATE
  ON administrative.ba_unit_as_party
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_changes();

CREATE TRIGGER __track_history
  AFTER UPDATE OR DELETE
  ON administrative.ba_unit_as_party
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_history();


