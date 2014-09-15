-- 15 Sep 2015
-- Remove the CO Unique Name constraint as multiple versions of state land parcels are possible.    
ALTER TABLE cadastre.cadastre_object
DROP CONSTRAINT IF EXISTS cadastre_object_name;


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
   AND  co.status_code = ''current''
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


 
 
-- Add Information Tool for Pending State Land 
DELETE FROM system.config_map_layer WHERE name = 'state-land-pending'; 
DELETE FROM system.query WHERE name IN ('SpatialResult.getPendingStateLands', 'dynamic.informationtool.get_pending_state_land');

INSERT INTO system.query (name, sql, description) VALUES ('SpatialResult.getPendingStateLands', 
'SELECT id, co.name_firstpart || '' '' || co.name_lastpart AS label, 
        co.state_land_status_code AS filter_category,
        st_asewkb(st_transform(geom_polygon, #{srid})) AS the_geom 
 FROM cadastre.cadastre_object  co
 WHERE co.type_code = ''stateLand''
 AND co.status_code = ''pending''
 AND co.geom_polygon IS NOT NULL
 AND ST_Intersects(st_transform(geom_polygon, #{srid}), ST_SetSRID(ST_3DMakeBox(ST_Point(#{minx}, #{miny}),ST_Point(#{maxx}, #{maxy})), #{srid}))', 'Retrieves state land polygons');
 
 INSERT INTO system.query (name, sql, description) VALUES ('dynamic.informationtool.get_pending_state_land', 
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
   AND  co.status_code = ''pending''
  AND   geom_polygon IS NOT NULL
  AND  ST_Intersects(st_transform(geom_polygon, #{srid}), ST_SetSRID(ST_GeomFromWKB(#{wkb_geom}), #{srid}))', NULL);
  
DELETE FROM system.query_field WHERE query_name = 'dynamic.informationtool.get_pending_state_land'; 
INSERT INTO system.query_field(query_name, index_in_query, "name", display_value) 
 VALUES ('dynamic.informationtool.get_pending_state_land', 0, 'id', null); 
INSERT INTO system.query_field(query_name, index_in_query, "name", display_value) 
 VALUES ('dynamic.informationtool.get_pending_state_land', 1, 'label', 'Parcel'); 
INSERT INTO system.query_field(query_name, index_in_query, "name", display_value) 
 VALUES ('dynamic.informationtool.get_pending_state_land', 2, 'property', 'Property'); 
INSERT INTO system.query_field(query_name, index_in_query, "name", display_value) 
 VALUES ('dynamic.informationtool.get_pending_state_land', 3, 'area', 'Area'); 
INSERT INTO system.query_field(query_name, index_in_query, "name", display_value) 
 VALUES ('dynamic.informationtool.get_pending_state_land', 4, 'locality', 'Locality'); 
INSERT INTO system.query_field(query_name, index_in_query, "name", display_value) 
 VALUES ('dynamic.informationtool.get_pending_state_land', 5, 'sl_status', 'Status'); 
INSERT INTO system.query_field(query_name, index_in_query, "name", display_value) 
 VALUES ('dynamic.informationtool.get_pending_state_land', 6, 'the_geom', null); 
 
 INSERT INTO system.config_map_layer (name, title, type_code, active, visible_in_start, item_order, style, pojo_structure, pojo_query_name, pojo_query_name_for_select, added_from_bulk_operation, use_in_public_display) VALUES ('state-land-pending', 'Pending state land', 'pojo', true, true, 39, 'state_land_pending.xml', 'theGeom:Polygon,label:"",filter_category:""', 'SpatialResult.getPendingStateLands', 'dynamic.informationtool.get_pending_state_land', false, false);
 
 
-- Add Information Tool for Disposed State Land  
DELETE FROM system.config_map_layer WHERE name = 'state-land-disposed'; 
DELETE FROM system.query WHERE name IN ('SpatialResult.getDisposedStateLands', 'dynamic.informationtool.get_disposed_state_land');

INSERT INTO system.query (name, sql, description) VALUES ('SpatialResult.getDisposedStateLands', 
'SELECT id, co.name_firstpart || '' '' || co.name_lastpart AS label, 
        st_asewkb(st_transform(geom_polygon, #{srid})) AS the_geom 
 FROM cadastre.cadastre_object  co
 WHERE co.type_code = ''stateLand''
 AND co.state_land_status_code = ''disposed''
 AND co.geom_polygon IS NOT NULL
 AND ST_Intersects(st_transform(geom_polygon, #{srid}), ST_SetSRID(ST_3DMakeBox(ST_Point(#{minx}, #{miny}),ST_Point(#{maxx}, #{maxy})), #{srid}))', 'Retrieves state land polygons');
 
  INSERT INTO system.query (name, sql, description) VALUES ('dynamic.informationtool.get_disposed_state_land', 
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
  AND   co.state_land_status_code = ''disposed''
  AND   geom_polygon IS NOT NULL
  AND  ST_Intersects(st_transform(geom_polygon, #{srid}), ST_SetSRID(ST_GeomFromWKB(#{wkb_geom}), #{srid}))', NULL);
  
DELETE FROM system.query_field WHERE query_name = 'dynamic.informationtool.get_disposed_state_land'; 
INSERT INTO system.query_field(query_name, index_in_query, "name", display_value) 
 VALUES ('dynamic.informationtool.get_disposed_state_land', 0, 'id', null); 
INSERT INTO system.query_field(query_name, index_in_query, "name", display_value) 
 VALUES ('dynamic.informationtool.get_disposed_state_land', 1, 'label', 'Parcel'); 
INSERT INTO system.query_field(query_name, index_in_query, "name", display_value) 
 VALUES ('dynamic.informationtool.get_disposed_state_land', 2, 'property', 'Property'); 
INSERT INTO system.query_field(query_name, index_in_query, "name", display_value) 
 VALUES ('dynamic.informationtool.get_disposed_state_land', 3, 'area', 'Area'); 
INSERT INTO system.query_field(query_name, index_in_query, "name", display_value) 
 VALUES ('dynamic.informationtool.get_disposed_state_land', 4, 'locality', 'Locality'); 
INSERT INTO system.query_field(query_name, index_in_query, "name", display_value) 
 VALUES ('dynamic.informationtool.get_disposed_state_land', 5, 'sl_status', 'Status'); 
INSERT INTO system.query_field(query_name, index_in_query, "name", display_value) 
 VALUES ('dynamic.informationtool.get_disposed_state_land', 6, 'the_geom', null); 


 INSERT INTO system.config_map_layer (name, title, type_code, active, visible_in_start, item_order, style, pojo_structure, pojo_query_name, pojo_query_name_for_select, added_from_bulk_operation, use_in_public_display) VALUES ('state-land-disposed', 'Disposed state land', 'pojo', true, false, 33, 'state_land_disposed.xml', 'theGeom:Polygon,label:""', 'SpatialResult.getDisposedStateLands', 'dynamic.informationtool.get_disposed_state_land', false, false);				 
				