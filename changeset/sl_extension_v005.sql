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
SELECT 'recreation', 'license', 'Recreation', 'c', 'The license applies to use of hte land for recreational purposes such as a ski field.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_sub_type WHERE code = 'recreation');

INSERT INTO administrative.condition_type(code, display_value, status, description)
SELECT 'c7', '7. Removal of Contaminants', 'c', 'Any contaminants idenitified by the planning authority are to be removed and the land restored to is original state within 12 months from the begining of the lease.'
WHERE NOT EXISTS (SELECT code FROM administrative.condition_type WHERE code = 'c7');

UPDATE system.config_map_layer SET visible_on_start = TRUE WHERE name = 'house_num';


-- Make description a text field on the source table
ALTER TABLE source.source 
   ALTER COLUMN description TYPE TEXT;

ALTER TABLE source.source_historic
   ALTER COLUMN description TYPE TEXT;	

