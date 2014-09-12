-- 3 Sep 2014

-- Update the get_land_use_code function to use DESC order for the area size. 
CREATE OR REPLACE FUNCTION administrative.get_land_use_code(prop_id character varying)
  RETURNS character varying AS
$BODY$ 
BEGIN
    RETURN 
	   (WITH use_area AS 
           (SELECT  co3.land_use_code, 
		            SUM(sva3.size) AS area 
            FROM administrative.ba_unit_contains_spatial_unit bas3, 
			     cadastre.cadastre_object co3 LEFT OUTER JOIN
                 cadastre.spatial_value_area sva3 ON sva3.spatial_unit_id = co3.id 
				                                  AND sva3.type_code = 'officialArea'
            WHERE bas3.ba_unit_id = prop_id 
			AND   co3.id = bas3.spatial_unit_id 
            AND co3.land_use_code IS NOT NULL      
            GROUP BY co3.land_use_code)
			
            SELECT land_use_code FROM use_area 
            ORDER BY area DESC LIMIT 1);
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION administrative.get_land_use_code(character varying)
  OWNER TO postgres;
COMMENT ON FUNCTION administrative.get_land_use_code(character varying) IS 'Returns the land use code for a ba unit based on the land use code of the largest combined parcel by area';

-- Create function to determine the state land status of the property
CREATE OR REPLACE FUNCTION administrative.get_state_land_status(prop_id character varying)
  RETURNS character varying AS
$BODY$ 
BEGIN
    RETURN 
	   (WITH sl_status AS 
           (SELECT  co.state_land_status_code, 
		            CASE  co.state_land_status_code 
					   WHEN 'current' THEN 1
					   WHEN 'surplus' THEN 2
					   WHEN 'dormant' THEN 3
					   WHEN 'proposed' THEN 4
					   ELSE 5 END AS status_order
            FROM administrative.ba_unit_contains_spatial_unit bas, 
			     cadastre.cadastre_object co
            WHERE bas.ba_unit_id = prop_id 
			AND   co.id = bas.spatial_unit_id 
            AND   co.state_land_status_code IS NOT NULL)
			
            SELECT state_land_status_code FROM sl_status 
            ORDER BY status_order LIMIT 1);
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION administrative.get_state_land_status(character varying)
  OWNER TO postgres;
COMMENT ON FUNCTION administrative.get_state_land_status(character varying) IS 'Returns the state land status for the property based on the status of the parcels linked to the property';



-- Data fix
UPDATE cadastre.cadastre_object 
SET type_code = 'stateLand'
WHERE name_lastpart = 'DP 34562';

-- Change CO Unique Name constraint to include type_code so that state land parcels  
-- can have the same name as registered parcels. 
ALTER TABLE cadastre.cadastre_object
DROP CONSTRAINT cadastre_object_name; 

ALTER TABLE cadastre.cadastre_object
ADD CONSTRAINT cadastre_object_name UNIQUE (name_firstpart, name_lastpart, type_code); 


CREATE OR REPLACE FUNCTION cadastre.format_area_metric(area numeric)
  RETURNS character varying AS
$BODY$
  BEGIN
	CASE WHEN area IS NULL OR area < 0.05 THEN RETURN NULL;
	WHEN area < 1 THEN RETURN '    < 1 m' || chr(178);
	WHEN area < 10000 THEN RETURN to_char(area, '999,999 m') || chr(178);
	ELSE RETURN to_char((area/10000), '999,999.999 ha'); 
	END CASE; 
  END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION cadastre.format_area_metric(numeric)
  OWNER TO postgres;
COMMENT ON FUNCTION cadastre.format_area_metric(numeric) IS 'Formats a metric area to m2 or hectares if area > 10,000m2';


-- Revise the State Land layers
DELETE FROM system.config_map_layer WHERE name = 'state-land'; 
DELETE FROM system.query WHERE name IN ('SpatialResult.getStateLands', 'dynamic.informationtool.get_state_land');

INSERT INTO system.query (name, sql, description) VALUES ('SpatialResult.getStateLands', 
'SELECT id, co.name_firstpart || '' '' || co.name_lastpart AS label, 
        co.state_land_status_code AS filter_category,
        st_asewkb(st_transform(geom_polygon, #{srid})) AS the_geom 
 FROM cadastre.cadastre_object  co
 WHERE co.type_code = ''stateLand''
 AND co.status_code = ''current''
 AND co.geom_polygon IS NOT NULL
 AND ST_Intersects(st_transform(geom_polygon, #{srid}), ST_SetSRID(ST_3DMakeBox(ST_Point(#{minx}, #{miny}),ST_Point(#{maxx}, #{maxy})), #{srid}))', 'Retrieves state land polygons');
 
INSERT INTO system.query (name, sql, description) VALUES ('dynamic.informationtool.get_state_land', 
 'SELECT id, co.name_firstpart || '' '' || co.name_lastpart AS label, 
	   (SELECT string_agg(ba.name_firstpart || ba.name_lastpart, '', '') 
	    FROM administrative.ba_unit_contains_spatial_unit bas, 
		     administrative.ba_unit ba 
		WHERE spatial_unit_id = co.id 
		AND   bas.ba_unit_id = ba.id) AS property,
	   (SELECT cadastre.format_area_metric(sva.size)
	    FROM cadastre.spatial_value_area  sva    
		WHERE sva.type_code = ''officialArea'' 
		AND   sva.spatial_unit_id = co.id) AS area,
       (SELECT string_agg(a.description, '' - '')
	    FROM   cadastre.spatial_unit_address sua,
		       address.address a
		WHERE  sua.spatial_unit_id = co.id
		AND    a.id = sua.address_id) AS locality,		
       (SELECT sl.display_value 
	    FROM   cadastre.state_land_status_type sl
		WHERE  sl.code = co.state_land_status_code) AS sl_status,		
        st_asewkb(st_transform(geom_polygon, #{srid})) as the_geom 
  FROM cadastre.cadastre_object  co
  WHERE co.type_code = ''stateLand''
  AND   geom_polygon IS NOT NULL
  AND  ST_Intersects(st_transform(geom_polygon, #{srid}), ST_SetSRID(ST_GeomFromWKB(#{wkb_geom}), #{srid}))', NULL);
  
DELETE FROM system.query_field WHERE query_name = 'dynamic.informationtool.get_state_land'; 
INSERT INTO system.query_field(query_name, index_in_query, "name", display_value) 
 VALUES ('dynamic.informationtool.get_state_land', 0, 'id', null); 
INSERT INTO system.query_field(query_name, index_in_query, "name", display_value) 
 VALUES ('dynamic.informationtool.get_state_land', 1, 'label', 'Parcel'); 
INSERT INTO system.query_field(query_name, index_in_query, "name", display_value) 
 VALUES ('dynamic.informationtool.get_state_land', 2, 'property', 'Property'); 
INSERT INTO system.query_field(query_name, index_in_query, "name", display_value) 
 VALUES ('dynamic.informationtool.get_state_land', 3, 'area', 'Area'); 
INSERT INTO system.query_field(query_name, index_in_query, "name", display_value) 
 VALUES ('dynamic.informationtool.get_state_land', 4, 'locality', 'Locality'); 
INSERT INTO system.query_field(query_name, index_in_query, "name", display_value) 
 VALUES ('dynamic.informationtool.get_state_land', 5, 'sl_status', 'Status'); 
INSERT INTO system.query_field(query_name, index_in_query, "name", display_value) 
 VALUES ('dynamic.informationtool.get_state_land', 6, 'the_geom', null); 

INSERT INTO system.config_map_layer (name, title, type_code, active, visible_in_start, item_order, style, pojo_structure, pojo_query_name, pojo_query_name_for_select, added_from_bulk_operation, use_in_public_display) VALUES ('state-land', 'State land', 'pojo', true, true, 36, 'state_land.xml', 'theGeom:Polygon,label:"",filter_category:""', 'SpatialResult.getStateLands', 'dynamic.informationtool.get_state_land', false, false);


DELETE FROM system.config_map_layer WHERE name = 'state-land-disposed'; 
DELETE FROM system.query WHERE name IN ('SpatialResult.getDisposedStateLands');

INSERT INTO system.query (name, sql, description) VALUES ('SpatialResult.getDisposedStateLands', 
'SELECT id, co.name_firstpart || '' '' || co.name_lastpart AS label, 
        st_asewkb(st_transform(geom_polygon, #{srid})) AS the_geom 
 FROM cadastre.cadastre_object  co
 WHERE co.type_code = ''stateLand''
 AND co.status_code = ''current''
 AND co.state_land_status_code = ''disposed''
 AND co.geom_polygon IS NOT NULL
 AND ST_Intersects(st_transform(geom_polygon, #{srid}), ST_SetSRID(ST_3DMakeBox(ST_Point(#{minx}, #{miny}),ST_Point(#{maxx}, #{maxy})), #{srid}))', 'Retrieves state land polygons');
 
 INSERT INTO system.config_map_layer (name, title, type_code, active, visible_in_start, item_order, style, pojo_structure, pojo_query_name, pojo_query_name_for_select, added_from_bulk_operation, use_in_public_display) VALUES ('state-land-disposed', 'Disposed state land', 'pojo', true, false, 33, 'state_land_disposed.xml', 'theGeom:Polygon,label:""', 'SpatialResult.getDisposedStateLands', null, false, false);
 
DELETE FROM system.config_map_layer WHERE name = 'state-land-pending'; 
DELETE FROM system.query WHERE name IN ('SpatialResult.getPendingStateLands');

INSERT INTO system.query (name, sql, description) VALUES ('SpatialResult.getPendingStateLands', 
'SELECT id, co.name_firstpart || '' '' || co.name_lastpart AS label, 
        co.state_land_status_code AS filter_category,
        st_asewkb(st_transform(geom_polygon, #{srid})) AS the_geom 
 FROM cadastre.cadastre_object  co
 WHERE co.type_code = ''stateLand''
 AND co.status_code = ''pending''
 AND co.geom_polygon IS NOT NULL
 AND ST_Intersects(st_transform(geom_polygon, #{srid}), ST_SetSRID(ST_3DMakeBox(ST_Point(#{minx}, #{miny}),ST_Point(#{maxx}, #{maxy})), #{srid}))', 'Retrieves state land polygons');
 
 INSERT INTO system.config_map_layer (name, title, type_code, active, visible_in_start, item_order, style, pojo_structure, pojo_query_name, pojo_query_name_for_select, added_from_bulk_operation, use_in_public_display) VALUES ('state-land-pending', 'Pending state land', 'pojo', true, true, 39, 'state_land_pending.xml', 'theGeom:Polygon,label:"",filter_category:""', 'SpatialResult.getPendingStateLands', null, false, false);
 
UPDATE system.config_map_layer 
SET item_order = 29
WHERE name = 'roads';

-- Adjust information tool for registered parcels. 
UPDATE system.query SET sql = 
 'SELECT co.id, co.name_firstpart || ''/'' || co.name_lastpart AS parcel_nr, 
	   (SELECT string_agg(ba.name_firstpart || ''/'' || ba.name_lastpart, '', '') 
	    FROM administrative.ba_unit_contains_spatial_unit bas, 
		     administrative.ba_unit ba 
		WHERE spatial_unit_id = co.id 
		AND   bas.ba_unit_id = ba.id) AS ba_units,
	   (SELECT cadastre.format_area_metric(sva.size)
	    FROM cadastre.spatial_value_area  sva    
		WHERE sva.type_code = ''officialArea'' 
		AND   sva.spatial_unit_id = co.id) AS area_official_sqm,
       (SELECT string_agg(a.description, '' - '')
	    FROM   cadastre.spatial_unit_address sua,
		       address.address a
		WHERE  sua.spatial_unit_id = co.id
		AND    a.id = sua.address_id) AS locality,				
        st_asewkb(st_transform(geom_polygon, #{srid})) as the_geom 
  FROM cadastre.cadastre_object  co
  WHERE co.type_code = ''parcel''
  AND   status_code = ''current''
  AND   geom_polygon IS NOT NULL
  AND  ST_Intersects(st_transform(geom_polygon, #{srid}), ST_SetSRID(ST_GeomFromWKB(#{wkb_geom}), #{srid}))'
 WHERE name = 'dynamic.informationtool.get_parcel'; 
  
DELETE FROM system.query_field WHERE query_name = 'dynamic.informationtool.get_parcel'; 
INSERT INTO system.query_field(query_name, index_in_query, "name", display_value) 
 VALUES ('dynamic.informationtool.get_parcel', 0, 'id', null); 
INSERT INTO system.query_field(query_name, index_in_query, "name", display_value) 
 VALUES ('dynamic.informationtool.get_parcel', 1, 'parcel_nr', 'Parcel'); 
INSERT INTO system.query_field(query_name, index_in_query, "name", display_value) 
 VALUES ('dynamic.informationtool.get_parcel', 2, 'ba_units', 'Property'); 
INSERT INTO system.query_field(query_name, index_in_query, "name", display_value) 
 VALUES ('dynamic.informationtool.get_parcel', 3, 'area_official_sqm', 'Area'); 
INSERT INTO system.query_field(query_name, index_in_query, "name", display_value) 
 VALUES ('dynamic.informationtool.get_parcel', 4, 'locality', 'Locality'); 
INSERT INTO system.query_field(query_name, index_in_query, "name", display_value) 
 VALUES ('dynamic.informationtool.get_parcel', 5, 'the_geom', null); 
					 
				