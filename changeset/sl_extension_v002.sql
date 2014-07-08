-- 8 July 2014
-- SOLA Database extensions for v001 and v002 of the State Land application

-- Configure the BA Unit Generate NR rule for State Land
DROP SEQUENCE IF EXISTS administrative.state_land_num_seq;
CREATE SEQUENCE administrative.state_land_num_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 999999
  START 1000
  CACHE 1
  CYCLE;
ALTER TABLE administrative.state_land_num_seq
  OWNER TO postgres;
COMMENT ON SEQUENCE administrative.state_land_num_seq
  IS 'Sequence number used as the basis for the State Land BA Units. This sequence is used by the generate-baunit-nr business rule.';
  
UPDATE system.br_definition SET body = 
'SELECT CASE WHEN #{typeCode} = ''stateLand'' THEN ''SL/'' || trim(to_char(nextval(''administrative.state_land_num_seq''), ''000000''))
        ELSE coalesce(system.get_setting(''system-id''), '''') || to_char(now(), ''yymm'') 
        || trim(to_char(nextval(''administrative.ba_unit_first_name_part_seq''), ''0000''))
        || ''/'' || trim(to_char(nextval(''administrative.ba_unit_last_name_part_seq''), ''0000'')) END AS vl'
WHERE br_id = 'generate-baunit-nr'; 


INSERT INTO administrative.ba_unit_type (code, display_value, status, description)
SELECT 'stateLand', 'State Land','c', 'State land property type'
WHERE NOT EXISTS (SELECT code FROM administrative.ba_unit_type WHERE code = 'stateLand');


-- Add a new field to ba_unit that can be used to contain a summary of the
-- State Land property record. 
ALTER TABLE administrative.ba_unit
  DROP COLUMN IF EXISTS description;
  
ALTER TABLE administrative.ba_unit
    ADD COLUMN description TEXT;
	
COMMENT ON COLUMN administrative.ba_unit.description IS 'SOLA State Land Extension: A summary description for the SL property';

ALTER TABLE administrative.ba_unit_historic
  DROP COLUMN IF EXISTS description;
  
ALTER TABLE administrative.ba_unit_historic
    ADD COLUMN description TEXT;

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
ALTER TABLE administrative.notation 
   DROP CONSTRAINT IF EXISTS notation_status_code_fk74,
   DROP CONSTRAINT IF EXISTS notation_status_code_fkey; 
DROP TABLE IF EXISTS administrative.notation_status_type; 

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

INSERT INTO administrative.notation_status_type(code, display_value, status, description)
SELECT 'pending', 'Pending', 'x', 'Included to support generic SOLA functionality. Status set to x so this value is not displayed to the user for selection.'
WHERE NOT EXISTS (SELECT code FROM administrative.notation_status_type WHERE code = 'pending');			

-- Notation does not require a transaction for State Land
ALTER TABLE administrative.notation 
   ALTER COLUMN transaction_id DROP NOT NULL;

ALTER TABLE administrative.notation 
   ADD CONSTRAINT notation_status_code_fkey FOREIGN KEY (status_code)
      REFERENCES administrative.notation_status_type (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE RESTRICT; 

-- Make notation_text a text field
ALTER TABLE administrative.notation 
   ALTER COLUMN notation_text TYPE TEXT;

ALTER TABLE administrative.notation_historic
   ALTER COLUMN notation_text TYPE TEXT;	     
					 

-- *** State Land application services ***
INSERT INTO system.panel_launcher_group(code, display_value, description, status)
SELECT 'slPropertyServices', 'State Land Property Services', 'Panels used for State Land property services', 'c'
WHERE NOT EXISTS (SELECT code FROM system.panel_launcher_group WHERE code = 'slPropertyServices');

INSERT INTO system.config_panel_launcher(code, display_value, description, status, launch_group, panel_class, message_code, card_name)
SELECT 'slProperty', 'State Land Property Panel', null, 'c', 'newPropServices', 'org.sola.clients.swing.desktop.administrative.SLPropertyPanel', 'cliprgs009', 'slPropertyPanel'
WHERE NOT EXISTS (SELECT code FROM system.config_panel_launcher WHERE code = 'slProperty');

INSERT INTO application.request_category_type (code, display_value, description, status)
SELECT 'stateLandServices', 'State Land Services', 'Services used to support state land', 'c' WHERE 'stateLandServices' NOT IN 
(SELECT code FROM application.request_category_type);

-- Default existing request types (a.k.a. service types) to disabled
UPDATE application.request_type SET status = 'x';

INSERT INTO application.request_type(code, request_category_code, display_value, 
            status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, 
            nr_properties_required, notation_template, rrr_type_code, type_action_code, 
            description, display_group_name, service_panel_code)
    SELECT 'recordStateLand','stateLandServices','Record State Land','c',5,0.00,0.00,0.00,0,
	null,null,null,'Service to manually create a new State Land Property','General', 'slProperty'
	WHERE NOT EXISTS (SELECT code FROM application.request_type WHERE code = 'recordStateLand');
	
INSERT INTO system.approle (code, display_value, status, description)
SELECT 'recordStateLand', 'Service - Record State Land','c', 'State Land Service. Allows the Record State Land service to be started.'
WHERE NOT EXISTS (SELECT code FROM system.approle WHERE code = 'recordStateLand');

INSERT INTO system.approle_appgroup (approle_code, appgroup_id) 
    (SELECT 'recordStateLand', ag.id FROM system.appgroup ag WHERE ag."name" = 'Super group'
	 AND NOT EXISTS (SELECT approle_code FROM system.approle_appgroup 
	                 WHERE  approle_code = 'recordStateLand'
					 AND    appgroup_id = ag.id));
					 
-- Add description field to cadastre_object to allow recording of building
-- details and outbuildings. 
ALTER TABLE cadastre.cadastre_object
  DROP COLUMN IF EXISTS description;
  
ALTER TABLE cadastre.cadastre_object
    ADD COLUMN description TEXT;

COMMENT ON COLUMN cadastre.cadastre_object.description IS 'SOLA State Land Extension: A description of any buildings or structures erected on the parcel that may be relevant for maintence of the property.';

ALTER TABLE cadastre.cadastre_object_historic
  DROP COLUMN IF EXISTS description;
  
ALTER TABLE cadastre.cadastre_object_historic
    ADD COLUMN description TEXT;

-- Update Cadastre Object Types
UPDATE cadastre.cadastre_object_type
SET    status = 'x'
WHERE  code NOT IN ('parcel', 'stateLand'); 

INSERT INTO cadastre.cadastre_object_type (code, display_value, status, in_topology)
SELECT 'stateLand', 'State Land Parcel', 'c', FALSE
WHERE NOT EXISTS (SELECT code FROM cadastre.cadastre_object_type WHERE code = 'stateLand');

-- State Land Status Type table.  
CREATE TABLE cadastre.state_land_status_type
(
  code character varying(20) NOT NULL, 
  display_value character varying(500) NOT NULL, 
  description character varying(1000), 
  status character(1) NOT NULL,
  CONSTRAINT state_land_status_type_pkey PRIMARY KEY (code),
  CONSTRAINT state_land_status_type_display_value_unique UNIQUE (display_value)
);

ALTER TABLE cadastre.state_land_status_type
  OWNER TO postgres;
COMMENT ON TABLE cadastre.state_land_status_type
  IS 'Code list of status types applicable to state land parcels. e.g. Proposed, Current, Dormant, Surplus, Disposed, etc.
Tags: FLOSS SOLA State Land Extension, Reference Table';
COMMENT ON COLUMN cadastre.state_land_status_type.code IS 'The code for the state land status type.';
COMMENT ON COLUMN cadastre.state_land_status_type.display_value IS 'Displayed value of the state land status type.';
COMMENT ON COLUMN cadastre.state_land_status_type.description IS 'Description of the state land status type.';
COMMENT ON COLUMN cadastre.state_land_status_type.status IS 'Status of the state land status type.';

INSERT INTO cadastre.state_land_status_type(code, display_value, status, description)
SELECT 'proposed', 'Proposed', 'c', 'The land has been nominated for aquisition by the state.'
WHERE NOT EXISTS (SELECT code FROM administrative.notation_status_type WHERE code = 'proposed'); 

INSERT INTO cadastre.state_land_status_type(code, display_value, status, description)
SELECT 'current', 'Current', 'c', 'The state is currently responsible for managing or maintaining the land'
WHERE NOT EXISTS (SELECT code FROM administrative.notation_status_type WHERE code = 'current'); 

INSERT INTO cadastre.state_land_status_type(code, display_value, status, description)
SELECT 'dormant', 'Dormant', 'c', 'The land is not being used for any purpose (e.g. it has been land banked)'
WHERE NOT EXISTS (SELECT code FROM administrative.notation_status_type WHERE code = 'dormant');

INSERT INTO cadastre.state_land_status_type(code, display_value, status, description)
SELECT 'surplus', 'Surplus', 'c', 'The land is no longer required by the state and can be disposed of.'
WHERE NOT EXISTS (SELECT code FROM administrative.notation_status_type WHERE code = 'surplus');

INSERT INTO cadastre.state_land_status_type(code, display_value, status, description)
SELECT 'disposed', 'Disposed', 'c', 'The land has been disposed of and is no longer the responsiblity of the state.'
WHERE NOT EXISTS (SELECT code FROM administrative.notation_status_type WHERE code = 'disposed');


ALTER TABLE cadastre.cadastre_object
  DROP COLUMN IF EXISTS state_land_status_code;
  
ALTER TABLE cadastre.cadastre_object
    ADD COLUMN state_land_status_code VARCHAR(20);

COMMENT ON COLUMN cadastre.cadastre_object.state_land_status_code IS 'SOLA State Land Extension: Identifies the status of the land in relation to the state.';

ALTER TABLE cadastre.cadastre_object_historic
  DROP COLUMN IF EXISTS state_land_status_code;
  
ALTER TABLE cadastre.cadastre_object_historic
    ADD COLUMN state_land_status_code VARCHAR(20);

ALTER TABLE cadastre.cadastre_object
   DROP CONSTRAINT IF EXISTS cadastre_object_state_land_status_code_fkey;

ALTER TABLE cadastre.cadastre_object
   ADD CONSTRAINT cadastre_object_state_land_status_code_fkey FOREIGN KEY (state_land_status_code)
      REFERENCES cadastre.state_land_status_type (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE RESTRICT; 

-- Add New Land Use Types and update existing values
INSERT INTO cadastre.land_use_type(code, display_value, status, description)
SELECT 'road', 'Road', 'c', 'The land is used for roading.'
WHERE NOT EXISTS (SELECT code FROM administrative.notation_status_type WHERE code = 'road');

INSERT INTO cadastre.land_use_type(code, display_value, status, description)
SELECT 'school', 'School', 'c', 'The land is part of a school site.'
WHERE NOT EXISTS (SELECT code FROM administrative.notation_status_type WHERE code = 'school');

INSERT INTO cadastre.land_use_type(code, display_value, status, description)
SELECT 'riverBed', 'River bed', 'c', 'The land is part of a river bed.'
WHERE NOT EXISTS (SELECT code FROM administrative.notation_status_type WHERE code = 'riverBed');

INSERT INTO cadastre.land_use_type(code, display_value, status, description)
SELECT 'park', 'Park or Playground', 'c', 'The land is used for a local park, playground or local reserve.'
WHERE NOT EXISTS (SELECT code FROM administrative.notation_status_type WHERE code = 'park');
  
INSERT INTO cadastre.land_use_type(code, display_value, status, description)
SELECT 'regionalPark', 'Regional Park', 'c', 'The land is used for a regional park.'
WHERE NOT EXISTS (SELECT code FROM administrative.notation_status_type WHERE code = 'regionalPark');

INSERT INTO cadastre.land_use_type(code, display_value, status, description)
SELECT 'nationalPark', 'National Park', 'c', 'The land is used for a national park.'
WHERE NOT EXISTS (SELECT code FROM administrative.notation_status_type WHERE code = 'nationalPark');

INSERT INTO cadastre.land_use_type(code, display_value, status, description)
SELECT 'seabed', 'Seabed', 'c', 'The land is seabed.'
WHERE NOT EXISTS (SELECT code FROM administrative.notation_status_type WHERE code = 'seabed');

INSERT INTO cadastre.land_use_type(code, display_value, status, description)
SELECT 'greenZone', 'Green Zone', 'c', 'The land is designated as a green zone between developed and less developed or undeveloped areas.'
WHERE NOT EXISTS (SELECT code FROM administrative.notation_status_type WHERE code = 'greenZone');

INSERT INTO cadastre.land_use_type(code, display_value, status, description)
SELECT 'accessway', 'Accessway', 'c', 'The land is used for public access'
WHERE NOT EXISTS (SELECT code FROM administrative.notation_status_type WHERE code = 'accessway');

INSERT INTO cadastre.land_use_type(code, display_value, status, description)
SELECT 'building', 'Building', 'c', 'The land is used for a public or commerical building'
WHERE NOT EXISTS (SELECT code FROM administrative.notation_status_type WHERE code = 'building');

INSERT INTO cadastre.land_use_type(code, display_value, status, description)
SELECT 'mining', 'Mining', 'c', 'The land is used for a mine'
WHERE NOT EXISTS (SELECT code FROM administrative.notation_status_type WHERE code = 'mining');

INSERT INTO cadastre.land_use_type(code, display_value, status, description)
SELECT 'marineReserve', 'Marine Reserve', 'c', 'The land is used for a marine reserve'
WHERE NOT EXISTS (SELECT code FROM administrative.notation_status_type WHERE code = 'marineReserve');

INSERT INTO cadastre.land_use_type(code, display_value, status, description)
SELECT 'hospital', 'Hospital', 'c', 'The land is part of a hospital'
WHERE NOT EXISTS (SELECT code FROM administrative.notation_status_type WHERE code = 'hospital');

INSERT INTO cadastre.land_use_type(code, display_value, status, description)
SELECT 'forestry', 'Forestry', 'c', 'The land is part of a forest'
WHERE NOT EXISTS (SELECT code FROM administrative.notation_status_type WHERE code = 'forestry');

INSERT INTO cadastre.land_use_type(code, display_value, status, description)
SELECT 'pastoral', 'Pastoral', 'c', 'The land is pastoral land'
WHERE NOT EXISTS (SELECT code FROM administrative.notation_status_type WHERE code = 'pastoral');
  
-- Add new role for the Measure tool
INSERT INTO system.approle (code, display_value, status, description)
SELECT 'MeasureMap', 'Map - Measure','c', 'Allows the user to measure distances on the map using the Measure tool.'
WHERE NOT EXISTS (SELECT code FROM system.approle WHERE code = 'MeasureMap');

INSERT INTO system.approle_appgroup (approle_code, appgroup_id) 
    (SELECT 'MeasureMap', ag.id FROM system.appgroup ag WHERE ag."name" = 'Super group'
	 AND NOT EXISTS (SELECT approle_code FROM system.approle_appgroup 
	                 WHERE  approle_code = 'MeasureMap'
					 AND    appgroup_id = ag.id));
