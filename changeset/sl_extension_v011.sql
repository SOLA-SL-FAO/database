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


 -- Update compare_strings function to recognize \s
 CREATE OR REPLACE FUNCTION compare_strings(string1 character varying, string2 character varying)
  RETURNS boolean AS
$BODY$
  DECLARE
    rec record;
    result boolean;
  BEGIN
      result = false;
      for rec in select regexp_split_to_table(lower(string1),'[^a-z0-9\\s]') as word loop
          if rec.word != '' then 
            if not string2 ~* rec.word then
                return false;
            end if;
            result = true;
          end if;
      end loop;
      return result;
  END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION compare_strings(character varying, character varying)
  OWNER TO postgres;
COMMENT ON FUNCTION compare_strings(character varying, character varying) IS E'Special string compare function. Allows spaces to be recognized as valid search parameters when entered as \s';



-- Fix Locality Map Search so that only one record is returned if
-- both the state land parcel and an underlying parcel share
-- the same address. 
DELETE FROM system.map_search_option
 WHERE query_name = 'map_search.locality';
 
 DELETE FROM system.query
 WHERE "name" = 'map_search.locality';
 
 INSERT INTO system.query("name", sql)
 VALUES ('map_search.locality', 
 'WITH state_land AS ( SELECT co.id, a.description as label, st_asewkb(co.geom_polygon) as the_geom 
  FROM cadastre.cadastre_object co, cadastre.spatial_unit_address sa,
       address.address a
  WHERE co.id = sa.spatial_unit_id
  AND   a.id = sa.address_id  
  AND compare_strings(#{search_string}, a.description)
  AND co.geom_polygon IS NOT NULL
  AND co.type_code = ''stateLand''
  AND co.status_code IN (''pending'', ''current''))
  
 SELECT co.id, a.description as label, 
        st_asewkb(co.geom_polygon) as the_geom	
  FROM cadastre.cadastre_object co, cadastre.spatial_unit_address sa,
       address.address a
  WHERE co.id = sa.spatial_unit_id
  AND   a.id = sa.address_id  
  AND compare_strings(#{search_string}, a.description)
  AND co.geom_polygon IS NOT NULL
  AND co.type_code != ''stateLand''
  AND co.status_code IN (''pending'', ''current'')
  AND NOT EXISTS (SELECT sl.id FROM state_land sl 
                  WHERE a.description = sl.label)
  UNION
  SELECT id, label, the_geom  FROM state_land ');
 
 INSERT INTO system.map_search_option(code, title, query_name, active, min_search_str_len, zoom_in_buffer)
 VALUES ('LOCALITY', 'Locality', 'map_search.locality', TRUE, 3, 100);  
 
 
 -- Update Parcel Number map search
 DELETE FROM system.map_search_option
 WHERE query_name = 'map_search.cadastre_object_by_number';
 
 DELETE FROM system.query
 WHERE "name" = 'map_search.cadastre_object_by_number';
 
 INSERT INTO system.query("name", sql)
 VALUES ('map_search.cadastre_object_by_number', 
'WITH state_land AS ( 
  SELECT co.id, TRIM(co.name_firstpart) || '' '' || TRIM(co.name_lastpart) as label, 
         st_asewkb(co.geom_polygon) as the_geom 
  FROM cadastre.cadastre_object co
  WHERE co.geom_polygon IS NOT NULL
  AND co.type_code = ''stateLand''
  AND co.status_code = ''current''
  AND compare_strings(#{search_string}, co.name_firstpart || '' '' || co.name_lastpart)),
  
state_land_pending AS ( 
  SELECT co.id, TRIM(co.name_firstpart) || '' '' || TRIM(co.name_lastpart) as label, 
         st_asewkb(co.geom_polygon) as the_geom 
  FROM cadastre.cadastre_object co
  WHERE co.geom_polygon IS NOT NULL
  AND co.type_code = ''stateLand''
  AND co.status_code = ''pending''
  AND compare_strings(#{search_string}, co.name_firstpart || '' '' || co.name_lastpart))
  
 SELECT co.id, TRIM(co.name_firstpart) || '' '' || TRIM(co.name_lastpart) as label, 
         st_asewkb(co.geom_polygon) as the_geom 
  FROM cadastre.cadastre_object co
  WHERE co.geom_polygon IS NOT NULL
  AND co.type_code != ''stateLand''
  AND co.status_code = ''current''
  AND compare_strings(#{search_string}, co.name_firstpart || '' '' || co.name_lastpart)
  AND NOT EXISTS (SELECT sl.id FROM state_land sl 
                  WHERE TRIM(co.name_firstpart) || '' '' || TRIM(co.name_lastpart) = sl.label)
  AND NOT EXISTS (SELECT slp.id FROM state_land_pending slp
                  WHERE TRIM(co.name_firstpart) || '' '' || TRIM(co.name_lastpart) = slp.label)
  UNION 
  SELECT id, label, the_geom FROM state_land_pending slp
  WHERE NOT EXISTS (SELECT sl.id FROM state_land sl 
                    WHERE slp.label = sl.label)
  UNION
  SELECT id, label, the_geom FROM state_land 
  LIMIT 50 ');
 
 INSERT INTO system.map_search_option(code, title, query_name, active, min_search_str_len, zoom_in_buffer)
 VALUES ('NUMBER', 'Parcel number', 'map_search.cadastre_object_by_number', TRUE, 3, 50);  
 
 
  -- Update Property Number map search
 DELETE FROM system.map_search_option
 WHERE query_name = 'map_search.cadastre_object_by_baunit';
 
 DELETE FROM system.query
 WHERE "name" = 'map_search.cadastre_object_by_baunit';
 
 INSERT INTO system.query("name", sql)
 VALUES ('map_search.cadastre_object_by_baunit', 
'WITH state_land AS ( 
  SELECT co.id, TRIM(ba.name_firstpart) || TRIM(ba.name_lastpart)
    || '' ('' || TRIM(co.name_firstpart) || '' '' || TRIM(co.name_lastpart) || '')'' as label, 
         st_asewkb(co.geom_polygon) as the_geom 
  FROM cadastre.cadastre_object co,
       administrative.ba_unit_contains_spatial_unit bas,
	   administrative.ba_unit ba
  WHERE co.geom_polygon IS NOT NULL
  AND co.type_code = ''stateLand''
  AND co.status_code = ''current''
  AND bas.spatial_unit_id = co.id
  AND ba.id = bas.ba_unit_id
  AND ba.status_code = ''current''
  AND compare_strings(#{search_string}, ba.name_firstpart || '' '' || ba.name_lastpart)),
  
state_land_pending AS ( 
  SELECT co.id, TRIM(ba.name_firstpart) || TRIM(ba.name_lastpart) 
       || '' ('' || TRIM(co.name_firstpart) || '' '' || TRIM(co.name_lastpart) || '')'' as label, 
         st_asewkb(co.geom_polygon) as the_geom
  FROM cadastre.cadastre_object co,
       administrative.ba_unit_contains_spatial_unit bas,
	   administrative.ba_unit ba
  WHERE co.geom_polygon IS NOT NULL
  AND co.type_code = ''stateLand''
  AND co.status_code = ''pending''
  AND bas.spatial_unit_id = co.id
  AND ba.id = bas.ba_unit_id
  AND ba.status_code = ''current''
  AND compare_strings(#{search_string}, ba.name_firstpart || '' '' || ba.name_lastpart))
  
  SELECT id, label, the_geom, 1 AS sort_idx FROM state_land_pending slp
  WHERE NOT EXISTS (SELECT sl.id FROM state_land sl 
                    WHERE slp.label = sl.label)
  UNION
  SELECT id, label, the_geom, 1 AS sort_idx FROM state_land
  UNION
  SELECT co.id, TRIM(ba.name_firstpart) || ''/'' || TRIM(ba.name_lastpart) 
     || '' ('' || TRIM(co.name_firstpart) || '' '' || TRIM(co.name_lastpart) || '')'' as label,   
         st_asewkb(co.geom_polygon) as the_geom, 2 AS sort_idx
  FROM cadastre.cadastre_object co,
       administrative.ba_unit_contains_spatial_unit bas,
	   administrative.ba_unit ba
  WHERE co.geom_polygon IS NOT NULL
  AND co.type_code != ''stateLand''
  AND co.status_code = ''current''
  AND bas.spatial_unit_id = co.id
  AND ba.id = bas.ba_unit_id
  AND ba.status_code = ''current''
  AND compare_strings(#{search_string}, ba.name_firstpart || '' '' || ba.name_lastpart)
  LIMIT 50 ');
 
 INSERT INTO system.map_search_option(code, title, query_name, active, min_search_str_len, zoom_in_buffer)
 VALUES ('BAUNIT', 'Property number', 'map_search.cadastre_object_by_baunit', TRUE, 3, 50);  
 
   -- Update Property Owner map search
 DELETE FROM system.map_search_option
 WHERE query_name = 'map_search.cadastre_object_by_baunit_owner';
 
 DELETE FROM system.query
 WHERE "name" = 'map_search.cadastre_object_by_baunit_owner';
 
 INSERT INTO system.query("name", sql)
 VALUES ('map_search.cadastre_object_by_baunit_owner', 
'WITH state_land AS ( 
  SELECT co.id,  COALESCE(p.name, '''') || '' '' || COALESCE(p.last_name, '''') 
       || '' ('' || TRIM(co.name_firstpart) || '' '' || TRIM(co.name_lastpart) || '')'' as label, 
         st_asewkb(co.geom_polygon) as the_geom 
  FROM cadastre.cadastre_object co,
       administrative.ba_unit_contains_spatial_unit bas,
	   administrative.rrr rrr, 
	   administrative.party_for_rrr pfr,
	   party.party p   
  WHERE co.geom_polygon IS NOT NULL
  AND co.type_code = ''stateLand''
  AND co.status_code = ''current''
  AND bas.spatial_unit_id = co.id
  AND rrr.ba_unit_id = bas.ba_unit_id
  AND rrr.is_primary = TRUE
  AND rrr.status_code = ''current''
  AND pfr.rrr_id = rrr.id
  AND p.id = pfr.party_id
  AND compare_strings(#{search_string}, COALESCE(p.name, '''') || '' '' || COALESCE(p.last_name, ''''))),
  
state_land_pending AS ( 
  SELECT co.id,  COALESCE(p.name, '''') || '' '' || COALESCE(p.last_name, '''') 
    || '' ('' || TRIM(co.name_firstpart) || '' '' || TRIM(co.name_lastpart) || '')'' as label, 
         st_asewkb(co.geom_polygon) as the_geom 
  FROM cadastre.cadastre_object co,
       administrative.ba_unit_contains_spatial_unit bas,
	   administrative.rrr rrr, 
	   administrative.party_for_rrr pfr,
	   party.party p   
  WHERE co.geom_polygon IS NOT NULL
  AND co.type_code = ''stateLand''
  AND co.status_code = ''pending''
  AND bas.spatial_unit_id = co.id
  AND rrr.ba_unit_id = bas.ba_unit_id
  AND rrr.is_primary = TRUE
  AND rrr.status_code = ''current''
  AND pfr.rrr_id = rrr.id
  AND p.id = pfr.party_id
  AND compare_strings(#{search_string}, COALESCE(p.name, '''') || '' '' || COALESCE(p.last_name, '''')))
  
  SELECT id, label, the_geom, 1 AS sort_idx FROM state_land_pending slp
  WHERE NOT EXISTS (SELECT sl.id FROM state_land sl 
                    WHERE slp.label = sl.label)
  UNION
  SELECT id, label, the_geom, 1 AS sort_idx FROM state_land
  UNION
  SELECT co.id,  COALESCE(p.name, '''') || '' '' || COALESCE(p.last_name, '''') 
     || '' ('' || TRIM(co.name_firstpart) || '' '' || TRIM(co.name_lastpart) || '')'' as label,   
         st_asewkb(co.geom_polygon) as the_geom, 2 AS sort_idx 
  FROM cadastre.cadastre_object co,
       administrative.ba_unit_contains_spatial_unit bas,
	   administrative.rrr rrr, 
	   administrative.party_for_rrr pfr,
	   party.party p   
  WHERE co.geom_polygon IS NOT NULL
  AND co.type_code != ''stateLand''
  AND co.status_code = ''current''
  AND bas.spatial_unit_id = co.id
  AND rrr.ba_unit_id = bas.ba_unit_id
  AND rrr.is_primary = TRUE
  AND rrr.status_code = ''current''
  AND pfr.rrr_id = rrr.id
  AND p.id = pfr.party_id
  AND compare_strings(#{search_string}, COALESCE(p.name, '''') || '' '' || COALESCE(p.last_name, ''''))
  LIMIT 50 ');
 
 INSERT INTO system.map_search_option(code, title, query_name, active, min_search_str_len, zoom_in_buffer)
 VALUES ('OWNER_OF_BAUNIT', 'Property owner', 'map_search.cadastre_object_by_baunit_owner', TRUE, 3, 50);  
  
 
 -- *** State Land application services ***
INSERT INTO system.config_panel_launcher(code, display_value, description, status, launch_group, panel_class, message_code, card_name)
SELECT 'newSLProperty', 'New State Land Property Panel', null, 'c', 'newPropServices', 'org.sola.clients.swing.desktop.administrative.SLPropertyPanel', 'cliprgs009', 'slPropertyPanel'
WHERE NOT EXISTS (SELECT code FROM system.config_panel_launcher WHERE code = 'newSLProperty');

UPDATE system.config_panel_launcher 
SET launch_group = 'slPropertyServices' WHERE code = 'slProperty'; 

UPDATE application.request_type 
SET service_panel_code = 'newSLProperty',
    display_value = 'Record New Property',
	description = 'Create a new State Land Property'
WHERE code = 'recordStateLand';

UPDATE application.request_type 
SET display_value = 'Create or Change Parcels',
    description = 'Create, change or dispose State Land Parcels'
WHERE code = 'changeSLParcels'; 

 
 -- Add additional request types
 INSERT INTO application.request_type(code, request_category_code, display_value, 
            status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, 
            nr_properties_required, notation_template, rrr_type_code, type_action_code, 
            description, display_group_name, service_panel_code)
    SELECT 'maintainStateLand','stateLandServices','Maintain Property','c',5,0.00,0.00,0.00,0,
	null,null,null,'Add or change details for an existing State Land Property including interests, parcels and relationships','General', 'slProperty'
	WHERE NOT EXISTS (SELECT code FROM application.request_type WHERE code = 'maintainStateLand');
	
INSERT INTO system.approle (code, display_value, status, description)
SELECT 'maintainStateLand', 'Service - Maintain State Land','c', 'State Land Service. Allows the Maintain State Land service to be started.'
WHERE NOT EXISTS (SELECT code FROM system.approle WHERE code = 'maintainStateLand');

INSERT INTO system.approle_appgroup (approle_code, appgroup_id) 
    (SELECT 'maintainStateLand', ag.id FROM system.appgroup ag WHERE ag."name" = 'Super group'
	 AND NOT EXISTS (SELECT approle_code FROM system.approle_appgroup 
	                 WHERE  approle_code = 'maintainStateLand'
					 AND    appgroup_id = ag.id));
					 
 INSERT INTO application.request_type(code, request_category_code, display_value, 
            status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, 
            nr_properties_required, notation_template, rrr_type_code, type_action_code, 
            description, display_group_name, service_panel_code)
    SELECT 'cancelInterest','stateLandServices','Cancel Interest','c',5,0.00,0.00,0.00,0,
	null,null,'cancel','Cancel one or more interests on an existing State Land Property','General', 'slProperty'
	WHERE NOT EXISTS (SELECT code FROM application.request_type WHERE code = 'cancelInterest');
	
INSERT INTO system.approle (code, display_value, status, description)
SELECT 'cancelInterest', 'Service - Cancel State Land Interest','c', 'State Land Service. Allows the Cancel State Land Interest service to be started.'
WHERE NOT EXISTS (SELECT code FROM system.approle WHERE code = 'cancelInterest');

INSERT INTO system.approle_appgroup (approle_code, appgroup_id) 
    (SELECT 'cancelInterest', ag.id FROM system.appgroup ag WHERE ag."name" = 'Super group'
	 AND NOT EXISTS (SELECT approle_code FROM system.approle_appgroup 
	                 WHERE  approle_code = 'cancelInterest'
					 AND    appgroup_id = ag.id));
