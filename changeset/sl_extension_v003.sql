-- 9 July 2014
-- SOLA Database extensions for v003 of the State Land application

INSERT INTO cadastre.land_use_type(code, display_value, status, description)
SELECT 'utility', 'Utility', 'c', 'The land is used for a utility such as a power substation, dam, water treatment plant, etc.'
WHERE NOT EXISTS (SELECT code FROM cadastre.land_use_type WHERE code = 'utility');

DELETE FROM cadastre.land_use_type WHERE code = 'school'; 
INSERT INTO cadastre.land_use_type(code, display_value, status, description)
SELECT 'educational', 'Educational', 'c', 'The land is used for an educational facility such as a school, university or training institution.'
WHERE NOT EXISTS (SELECT code FROM cadastre.land_use_type WHERE code = 'educational');

INSERT INTO cadastre.land_use_type(code, display_value, status, description)
SELECT 'military', 'Military', 'c', 'The land is used for a militry base or other military installation.'
WHERE NOT EXISTS (SELECT code FROM cadastre.land_use_type WHERE code = 'military');

INSERT INTO cadastre.land_use_type(code, display_value, status, description)
SELECT 'transport', 'Transportation', 'c', 'The land is used as a transportation hub such as a bus stop, railway station or ferry terminal.'
WHERE NOT EXISTS (SELECT code FROM cadastre.land_use_type WHERE code = 'transport');

INSERT INTO cadastre.land_use_type(code, display_value, status, description)
SELECT 'wharf', 'Wharf, Ramp or Jetty', 'c', 'The land has a wharf, boat ramp or jetty erected on it.'
WHERE NOT EXISTS (SELECT code FROM cadastre.land_use_type WHERE code = 'wharf');

INSERT INTO cadastre.land_use_type(code, display_value, status, description)
SELECT 'marginalStrip', 'Marginal Strip', 'c', 'The land extending along the landward margins of the foreshore and other water bodies.'
WHERE NOT EXISTS (SELECT code FROM cadastre.land_use_type WHERE code = 'marginalStrip');

INSERT INTO cadastre.land_use_type(code, display_value, status, description)
SELECT 'foreshore', 'Foreshore', 'c', 'The foreshore of water bodies such as seas, lakes and rivers.'
WHERE NOT EXISTS (SELECT code FROM cadastre.land_use_type WHERE code = 'foreshore');

-- New panel launching codes
INSERT INTO system.config_panel_launcher(code, display_value, description, status, launch_group, panel_class, message_code, card_name)
SELECT 'simpleRightCondPanel', 'Simple Right Condition Panel', null, 'c', 'generalRRR', 'org.sola.clients.swing.desktop.administrative.SimpleRightConditionPanel', null, 'simpleRightCondPanel'
WHERE NOT EXISTS (SELECT code FROM system.config_panel_launcher WHERE code = 'simpleRightCondPanel');

INSERT INTO system.config_panel_launcher(code, display_value, description, status, launch_group, panel_class, message_code, card_name)
SELECT 'simpleRholdConPanel', 'Simple Rightholder Condition Panel', null, 'c', 'generalRRR', 'org.sola.clients.swing.desktop.administrative.SimpleRightholderConditionPanel', null, 'simpleRightholderCondPanel'
WHERE NOT EXISTS (SELECT code FROM system.config_panel_launcher WHERE code = 'simpleRholdConPanel');


-- Updates to RRR Types
UPDATE administrative.rrr_type
SET status = 'x'
WHERE code NOT IN ('lease', 'occupation',
'ownership', 'servitude', 'stateOwnership', 'liability', 'license',
'claim', 'landbank', 'heritage', 'condition', 'restriction', 'rsensitivity',
'notice', 'order', 'customary'); 

UPDATE administrative.rrr_type
SET status = 'c',
    is_primary = FALSE,
    share_check = FALSE,
	party_required = TRUE,
	description = 'General occupation of land by an individual or group that may be informal, traditional or illegal.'
WHERE code = 'occupation';

UPDATE administrative.rrr_type
SET status = 'c',
    is_primary = FALSE,
    share_check = FALSE,
	party_required = TRUE,
	description = 'Lease of property possibly subject to conditions.'
WHERE code = 'lease';

UPDATE administrative.rrr_type
SET status = 'c',
    display_value = 'Owner',
    is_primary = TRUE,
    share_check = TRUE,
	party_required = TRUE,
	description = 'The owner of a property.'
WHERE code = 'ownership';

UPDATE administrative.rrr_type
SET status = 'c',
    display_value = 'Easement',
    is_primary = FALSE,
    share_check = FALSE,
	party_required = FALSE,
	description = 'An easement over a property for general access, roading, water or power transmission.'
WHERE code = 'servitude';

UPDATE administrative.rrr_type
SET status = 'c',
    display_value = 'State Landholder',
    is_primary = TRUE,
    share_check = FALSE,
	party_required = TRUE,
	rrr_panel_code = 'simpleRightholder',
	description = 'State agency or other state organisation that has the primary responsiblity for managing and using the land.'
WHERE code = 'stateOwnership';

INSERT INTO administrative.rrr_type(code, rrr_group_type_code, display_value, is_primary, share_check, party_required, status, rrr_panel_code, description)
SELECT 'liability', 'responsibilities', 'Liability', FALSE, FALSE, FALSE, 'c', 'simpleRight', 'Indicates the land is subject to some form of liability such as contamination, erosision or instability.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_type WHERE code = 'liability');

INSERT INTO administrative.rrr_type(code, rrr_group_type_code, display_value, is_primary, share_check, party_required, status, rrr_panel_code, description)
SELECT 'license', 'rights', 'License', FALSE, FALSE, TRUE, 'c', 'lease', 'Indicates that a license, usually for a specific purpose such has mining, grazing, forestry, etc, has been granted.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_type WHERE code = 'license');

INSERT INTO administrative.rrr_type(code, rrr_group_type_code, display_value, is_primary, share_check, party_required, status, rrr_panel_code, description)
SELECT 'claim', 'restrictions', 'Claim', FALSE, FALSE, TRUE, 'c', 'simpleRightholder', 'Indicates an individual or group has a claim over the property.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_type WHERE code = 'claim');

INSERT INTO administrative.rrr_type(code, rrr_group_type_code, display_value, is_primary, share_check, party_required, status, rrr_panel_code, description)
SELECT 'landbank', 'restrictions', 'Landbank', FALSE, FALSE, FALSE, 'c', 'simpleRight', 'Indicates the land is part of a landbank and is likely to be disposed of at some point.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_type WHERE code = 'landbank');

INSERT INTO administrative.rrr_type(code, rrr_group_type_code, display_value, is_primary, share_check, party_required, status, rrr_panel_code, description)
SELECT 'heritage', 'responsibilities', 'Heritage', FALSE, FALSE, FALSE, 'c', 'simpleRight', 'Indicates the land contains a heritage site that has historical, cultural, archaelogical or natural/environmental significance.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_type WHERE code = 'heritage');

INSERT INTO administrative.rrr_type(code, rrr_group_type_code, display_value, is_primary, share_check, party_required, status, rrr_panel_code, description)
SELECT 'customary', 'rights', 'Customary', FALSE, FALSE, TRUE, 'c', 'simpleRightholder', 'Indicates the land is subject to customary title and related activities such as food gathering. '
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_type WHERE code = 'customary');

INSERT INTO administrative.rrr_type(code, rrr_group_type_code, display_value, is_primary, share_check, party_required, status, rrr_panel_code, description)
SELECT 'condition', 'responsibilities', 'Condition', FALSE, FALSE, FALSE, 'c', 'simpleRightCondPanel', 'Indicates that conditions have been imposed on the states ownership of the land (e.g. specific disposal conditions, etc).'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_type WHERE code = 'condition');

INSERT INTO administrative.rrr_type(code, rrr_group_type_code, display_value, is_primary, share_check, party_required, status, rrr_panel_code, description)
SELECT 'restriction', 'restrictions', 'Restriction', FALSE, FALSE, FALSE, 'c', 'simpleRight', 'Restriction imposed on the property usually by local government bodies such as building and/or water taking restrictions.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_type WHERE code = 'restriction');

INSERT INTO administrative.rrr_type(code, rrr_group_type_code, display_value, is_primary, share_check, party_required, status, rrr_panel_code, description)
SELECT 'notice', 'restrictions', 'Notice', FALSE, FALSE, FALSE, 'c', 'simpleRight', 'Public or legal notices that have been issued in relation to the property such as noticies for trespass, littering or rubbish dumping, etc.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_type WHERE code = 'notice');

INSERT INTO administrative.rrr_type(code, rrr_group_type_code, display_value, is_primary, share_check, party_required, status, rrr_panel_code, description)
SELECT 'rsensitivity', 'restrictions', 'Reverse Sensitivity', FALSE, FALSE, FALSE, 'c', 'simpleRight', 'Indicates that in a mixed use area, once a particular use for land is established (e.g. road or highway), any new uses for surronding property (e.g. residential development) cannot impose restrictions on the established use.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_type WHERE code = 'rsensitivity');

INSERT INTO administrative.rrr_type(code, rrr_group_type_code, display_value, is_primary, share_check, party_required, status, rrr_panel_code, description)
SELECT 'order', 'restrictions', 'Order', FALSE, FALSE, FALSE, 'c', 'simpleRight', 'An order issued by the court or a decision from a tribunal or other judicial authority that imposes a specific action on the property (e.g. transfer from one owner to another or a demolition order, etc.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_type WHERE code = 'order');


-- Updates to Standard Condition Text
UPDATE administrative.condition_type
SET display_value = '1. Fence Boundaries'
WHERE code = 'c1'; 

UPDATE administrative.condition_type
SET display_value = '2. Development of Land'
WHERE code = 'c2'; 

UPDATE administrative.condition_type
SET display_value = '3. Drainage and Sewerage'
WHERE code = 'c3'; 

UPDATE administrative.condition_type
SET display_value = '4. Use of Land'
WHERE code = 'c4'; 

UPDATE administrative.condition_type
SET display_value = '5. Planning Authority Access'
WHERE code = 'c5'; 

UPDATE administrative.condition_type
SET display_value = '6. Building Repair and Maintenance'
WHERE code = 'c6'; 

-- Add a new field to condition for rrr so the name for any custom condition can be specified.
ALTER TABLE administrative.condition_for_rrr
  DROP COLUMN IF EXISTS custom_condition_name;
  
ALTER TABLE administrative.condition_for_rrr
    ADD COLUMN custom_condition_name VARCHAR(500);
	
COMMENT ON COLUMN administrative.condition_for_rrr.custom_condition_name IS 'SOLA State Land Extension: The name for the custom lease or license condition';

ALTER TABLE administrative.condition_for_rrr_historic
  DROP COLUMN IF EXISTS custom_condition_name;
  
ALTER TABLE administrative.condition_for_rrr_historic
    ADD COLUMN custom_condition_name VARCHAR(500);
	
ALTER TABLE administrative.condition_for_rrr 
   ALTER COLUMN custom_condition_text TYPE TEXT;

ALTER TABLE administrative.condition_for_rrr_historic
   ALTER COLUMN custom_condition_text TYPE TEXT;

ALTER TABLE administrative.condition_type 
   ALTER COLUMN description TYPE TEXT;
   
   
-- State Land RRR Sub Type table.  
ALTER TABLE administrative.rrr
   DROP CONSTRAINT IF EXISTS rrr_rrr_sub_type_fkey;

DROP TABLE IF EXISTS administrative.rrr_sub_type; 
   
CREATE TABLE administrative.rrr_sub_type
(
  code character varying(20) NOT NULL, 
  display_value character varying(500) NOT NULL, 
  description character varying(1000), 
  status character(1) NOT NULL,
  rrr_type_code character varying(20) NOT NULL, 
  CONSTRAINT rrr_sub_type_pkey PRIMARY KEY (code),
  CONSTRAINT rrr_sub_type_display_value_unique UNIQUE (display_value)
);

ALTER TABLE administrative.rrr_sub_type
   ADD CONSTRAINT rrr_sub_type_rrr_type_fkey FOREIGN KEY (rrr_type_code)
      REFERENCES administrative.rrr_type(code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE RESTRICT; 
	  
COMMENT ON TABLE administrative.rrr_sub_type
  IS 'Code list of the RRR sub types. Each subtype is associated to a specific RRR identified by rrr_type.
Tags: FLOSS SOLA State Land Extension, Reference Table';
COMMENT ON COLUMN administrative.rrr_sub_type.code IS 'The code for the sub type.';
COMMENT ON COLUMN administrative.rrr_sub_type.display_value IS 'Displayed value of the sub type.';
COMMENT ON COLUMN administrative.rrr_sub_type.description IS 'Description of the sub type.';
COMMENT ON COLUMN administrative.rrr_sub_type.status IS 'Status of the sub type.';
COMMENT ON COLUMN administrative.rrr_sub_type.rrr_type_code IS 'The RRRR type the sub type is associated to.';

INSERT INTO administrative.rrr_sub_type(code, rrr_type_code, display_value, status, description)
SELECT 'mining', 'license', 'Mining', 'c', 'The license applies to mining activities.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_sub_type WHERE code = 'mining'); 

INSERT INTO administrative.rrr_sub_type(code, rrr_type_code, display_value, status, description)
SELECT 'fishing', 'license', 'Fishing', 'c', 'The license applies to fishing activities.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_sub_type WHERE code = 'fishing'); 

INSERT INTO administrative.rrr_sub_type(code, rrr_type_code, display_value, status, description)
SELECT 'exploration', 'license', 'Exploration', 'c', 'The license applies to resource exploration activities.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_sub_type WHERE code = 'exploration'); 

INSERT INTO administrative.rrr_sub_type(code, rrr_type_code, display_value, status, description)
SELECT 'forestry', 'license', 'Forestry', 'c', 'The license applies to forestry activities.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_sub_type WHERE code = 'forestry'); 

INSERT INTO administrative.rrr_sub_type(code, rrr_type_code, display_value, status, description)
SELECT 'aquaculture', 'license', 'Aquaculture', 'c', 'The license applies to aquaculture such as fish and shellfish farming activities.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_sub_type WHERE code = 'aquaculture'); 

INSERT INTO administrative.rrr_sub_type(code, rrr_type_code, display_value, status, description)
SELECT 'pastoral', 'license', 'Pastoral Occupation', 'c', 'The license applies to pastoral occupation.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_sub_type WHERE code = 'pastoral'); 

INSERT INTO administrative.rrr_sub_type(code, rrr_type_code, display_value, status, description)
SELECT 'contamination', 'liability', 'Contamination', 'c', 'The liability is for contamination of the land.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_sub_type WHERE code = 'contamination'); 

INSERT INTO administrative.rrr_sub_type(code, rrr_type_code, display_value, status, description)
SELECT 'erosion', 'liability', 'Erosion', 'c', 'The liability is for erosion of the land.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_sub_type WHERE code = 'erosion'); 

INSERT INTO administrative.rrr_sub_type(code, rrr_type_code, display_value, status, description)
SELECT 'instability', 'liability', 'Instabiltiy', 'c', 'The liability is related to instability of the land. e.g. Red Zone land'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_sub_type WHERE code = 'instability'); 

INSERT INTO administrative.rrr_sub_type(code, rrr_type_code, display_value, status, description)
SELECT 'building', 'restriction', 'Building Restriction', 'c', 'The restriction relates to buildings on the property.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_sub_type WHERE code = 'building');

INSERT INTO administrative.rrr_sub_type(code, rrr_type_code, display_value, status, description)
SELECT 'water', 'restriction', 'Water Restriction', 'c', 'The restriction relates to taking of water from the property.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_sub_type WHERE code = 'water');

INSERT INTO administrative.rrr_sub_type(code, rrr_type_code, display_value, status, description)
SELECT 'cultural', 'heritage', 'Cultural', 'c', 'The land has a cultural heritage site located on it.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_sub_type WHERE code = 'cultural');

INSERT INTO administrative.rrr_sub_type(code, rrr_type_code, display_value, status, description)
SELECT 'archeological', 'heritage', 'Archeological', 'c', 'The land has an archeological heritage site located on it.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_sub_type WHERE code = 'archeological');

INSERT INTO administrative.rrr_sub_type(code, rrr_type_code, display_value, status, description)
SELECT 'historic', 'heritage', 'Historic', 'c', 'The land has an historical heritage site loctaed on it.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_sub_type WHERE code = 'historical');

INSERT INTO administrative.rrr_sub_type(code, rrr_type_code, display_value, status, description)
SELECT 'nature', 'heritage', 'Natural', 'c', 'The land has a natural site of significance loctaed on it.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_sub_type WHERE code = 'nature');

INSERT INTO administrative.rrr_sub_type(code, rrr_type_code, display_value, status, description)
SELECT 'rightOfWay', 'servitude', 'Right of Way', 'c', 'The easement is for a Right of Way.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_sub_type WHERE code = 'rightOfWay');

INSERT INTO administrative.rrr_sub_type(code, rrr_type_code, display_value, status, description)
SELECT 'utility', 'servitude', 'Utility Transmission', 'c', 'The easement is for the transmission of utilities across the property.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_sub_type WHERE code = 'utility');

INSERT INTO administrative.rrr_sub_type(code, rrr_type_code, display_value, status, description)
SELECT 'accessway', 'servitude', 'Accessway', 'c', 'The easement is for a public accessway across the property.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_sub_type WHERE code = 'accessway');

INSERT INTO administrative.rrr_sub_type(code, rrr_type_code, display_value, status, description)
SELECT 'food', 'customary', 'Food Gathering', 'c', 'The customary right is for food gathering.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_sub_type WHERE code = 'food');

INSERT INTO administrative.rrr_sub_type(code, rrr_type_code, display_value, status, description)
SELECT 'noise', 'rsensitivity', 'Noise Level', 'c', 'The reverse sensitivity relates to the noise level (e.g. motorway noise) eminating from the property.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_sub_type WHERE code = 'noise');

INSERT INTO administrative.rrr_sub_type(code, rrr_type_code, display_value, status, description)
SELECT 'disposal', 'condition', 'Disposal', 'c', 'The conditions relate to disposal of the property.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_sub_type WHERE code = 'disposal');


ALTER TABLE administrative.rrr
  DROP COLUMN IF EXISTS sub_type_code;
  
ALTER TABLE administrative.rrr
    ADD COLUMN sub_type_code VARCHAR(20);

COMMENT ON COLUMN administrative.rrr.sub_type_code IS 'SOLA State Land Extension: The sub type of the RRR.';

ALTER TABLE administrative.rrr_historic
  DROP COLUMN IF EXISTS sub_type_code;
  
ALTER TABLE administrative.rrr_historic
    ADD COLUMN sub_type_code VARCHAR(20);

ALTER TABLE administrative.rrr
   ADD CONSTRAINT rrr_rrr_sub_type_fkey FOREIGN KEY (sub_type_code)
      REFERENCES administrative.rrr_sub_type (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE RESTRICT; 
 
