-- 20 Aug 2014
 -- Fix the document nr number sequency
DROP SEQUENCE document.document_nr_seq;

CREATE SEQUENCE document.document_nr_seq
  INCREMENT 1
  MINVALUE 1000
  MAXVALUE 99999999
  START 1000
  CACHE 1
  CYCLE;
COMMENT ON SEQUENCE document.document_nr_seq
  IS 'Sequence number used as the basis for the document Nr field. This sequence is used by the Digital Archive EJB.';
  
-- Adjust the layers displayed in the Map Viewer
UPDATE system.config_map_layer
SET    active = FALSE
WHERE  name IN ('applications', 'claims-orthophoto', 'parcel-nodes',
                'parcels-historic-current-ba', 'pending-parcels', 
				'public-display-parcels', 'public-display-parcels-next',
				'sug_hierarchy', 'survey-controls'); 
				

INSERT INTO application.request_type(code, request_category_code, display_value, 
            status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, 
            nr_properties_required, notation_template, rrr_type_code, type_action_code, 
            description, display_group_name, service_panel_code)
    SELECT 'changeSLParcels','stateLandServices','Change State Land Parcels','c',5,0.00,0.00,0.00,0,
	null,null,null,'Service to manually create or change State Land parcels','General', 'cadastreTransMap'
	WHERE NOT EXISTS (SELECT code FROM application.request_type WHERE code = 'changeSLParcels');
	
INSERT INTO system.approle (code, display_value, status, description)
SELECT 'changeSLParcels', 'Service - Change State Land Parcels','c', 'State Land Service. Allows the Change State Land Parcels service to be started.'
WHERE NOT EXISTS (SELECT code FROM system.approle WHERE code = 'changeSLParcels');

INSERT INTO system.approle_appgroup (approle_code, appgroup_id) 
    (SELECT 'changeSLParcels', ag.id FROM system.appgroup ag WHERE ag."name" = 'Super group'
	 AND NOT EXISTS (SELECT approle_code FROM system.approle_appgroup 
	                 WHERE  approle_code = 'changeSLParcels'
					 AND    appgroup_id = ag.id));	
					 
					 
UPDATE administrative.rrr SET is_primary = 't' WHERE type_code = 'stateOwnership';


-- Construct/configure State Land layer
DELETE FROM system.config_map_layer WHERE name = 'state-land'; 
DELETE FROM system.query WHERE name IN ('SpatialResult.getStateLands', 'dynamic.informationtool.get_state_land');

INSERT INTO system.query (name, sql, description) VALUES ('SpatialResult.getStateLands', 
'SELECT id, co.name_firstpart || '' '' || co.name_lastpart AS label, 
        st_asewkb(st_transform(geom_polygon, #{srid})) as the_geom 
 FROM cadastre.cadastre_object  co
 WHERE co.type_code = ''stateLand''
 AND geom_polygon IS NOT NULL
 AND ST_Intersects(st_transform(geom_polygon, #{srid}), ST_SetSRID(ST_3DMakeBox(ST_Point(#{minx}, #{miny}),ST_Point(#{maxx}, #{maxy})), #{srid}))', 'Retrieves state land polygons');
 
INSERT INTO system.query (name, sql, description) VALUES ('dynamic.informationtool.get_state_land', 
 'SELECT id, co.name_firstpart || '' '' || co.name_lastpart AS label, 
        st_asewkb(st_transform(geom_polygon, #{srid})) as the_geom 
  FROM cadastre.cadastre_object  co
  WHERE co.type_code = ''stateLand''
  AND geom_polygon IS NOT NULL
  AND  ST_Intersects(st_transform(geom_polygon, #{srid}), ST_SetSRID(ST_GeomFromWKB(#{wkb_geom}), #{srid}))', NULL);
  
DELETE FROM system.query_field WHERE query_name = 'dynamic.informationtool.get_state_land'; 
INSERT INTO system.query_field(query_name, index_in_query, "name", display_value) 
 VALUES ('dynamic.informationtool.get_state_land', 0, 'id', null); 
INSERT INTO system.query_field(query_name, index_in_query, "name", display_value) 
 VALUES ('dynamic.informationtool.get_state_land', 1, 'label', 'Parcel name'); 
INSERT INTO system.query_field(query_name, index_in_query, "name", display_value) 
 VALUES ('dynamic.informationtool.get_state_land', 2, 'the_geom', null); 

INSERT INTO system.config_map_layer (name, title, type_code, active, visible_in_start, item_order, style, pojo_structure, pojo_query_name, pojo_query_name_for_select, added_from_bulk_operation, use_in_public_display) VALUES ('state-land', 'State land', 'pojo', true, true, 41, 'state_land.xml', 'theGeom:Polygon,label:""', 'SpatialResult.getStateLands', 'dynamic.informationtool.get_state_land', false, false);
					 
				