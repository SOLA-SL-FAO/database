-- 21 Oct 2015
-- Add service to dispose state land property. 
INSERT INTO application.request_type(code, request_category_code, display_value, 
            status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, 
            nr_properties_required, notation_template, rrr_type_code, type_action_code, 
            description, display_group_name, service_panel_code)
    SELECT 'disposeSLProperty','stateLandServices','Dispose Property','c',5,0.00,0.00,0.00,0,
	null,null,'cancel','Updates a State Land Property to indicate the state has disposed of it','General', 'slProperty'
	WHERE NOT EXISTS (SELECT code FROM application.request_type WHERE code = 'disposeSLProperty');
	
INSERT INTO system.approle (code, display_value, status, description)
SELECT 'disposeSLProperty', 'Service - Dispose Property','c', 'State Land Service. Allows the Dispose Property service to be started.'
WHERE NOT EXISTS (SELECT code FROM system.approle WHERE code = 'disposeSLProperty');

INSERT INTO system.approle_appgroup (approle_code, appgroup_id) 
    (SELECT 'disposeSLProperty', ag.id FROM system.appgroup ag WHERE ag."name" = 'Super group'
	 AND NOT EXISTS (SELECT approle_code FROM system.approle_appgroup 
	                 WHERE  approle_code = 'disposeSLProperty'
					 AND    appgroup_id = ag.id));
					 
					 

-- Update target-ba_unit-check-if-pending to include check for new request type					 
 UPDATE system.br_definition
 SET  body = 
 'WITH	otherCancel AS	(SELECT (SELECT (COUNT(*) = 0)FROM administrative.ba_unit_target ba_t2 
				INNER JOIN transaction.transaction tn ON (ba_t2.transaction_id = tn.id)
				WHERE ba_t2.ba_unit_id = ba_t.ba_unit_id
				AND ba_t2.transaction_id != ba_t.transaction_id
				AND tn.status_code != ''approved'') AS chkOther
			FROM administrative.ba_unit_target ba_t
			WHERE ba_t.ba_unit_id = #{id}), 
	cancelAp AS	(SELECT ap.id FROM administrative.ba_unit_target ba_t 
			INNER JOIN application.application_property pr ON (ba_t.ba_unit_id = pr.ba_unit_id)
			INNER JOIN application.service sv ON (pr.application_id = sv.application_id)
			INNER JOIN application.application ap ON (pr.application_id = ap.id)
			WHERE ba_t.ba_unit_id = #{id}
			AND sv.request_type_code IN (''cancelProperty'', ''disposeSLProperty'')
			AND sv.status_code != ''cancelled''
			AND ap.status_code NOT IN (''annulled'', ''approved'')),
	otherAps AS	(SELECT (SELECT (count(*) = 0) FROM administrative.ba_unit ba
			INNER JOIN administrative.rrr rr ON (ba.id = rr.ba_unit_id)
			INNER JOIN transaction.transaction tn ON (rr.transaction_id = tn.id)
			INNER JOIN application.service sv ON (tn.from_service_id = sv.id)
			INNER JOIN application.application ap ON (sv.application_id = ap.id)
			WHERE ba.id = #{id} 
			AND ap.status_code = ''lodged''
			AND ap.id NOT IN (SELECT id FROM cancelAp)) AS chkNoOtherAps),

	pendingRRR AS	(SELECT (SELECT (count(*) = 0) FROM administrative.rrr rr
				INNER JOIN administrative.ba_unit_target ba_t2 ON (rr.ba_unit_id = ba_t2.ba_unit_id)
				INNER JOIN transaction.transaction t2 ON (ba_t2.transaction_id = t2.id)
				INNER JOIN application.service s2 ON (t2.from_service_id = s2.id) 
				WHERE ba_t2.ba_unit_id = ba_t.ba_unit_id
				AND s2.application_id != s1.application_id
				AND ba_t2.transaction_id != ba_t.transaction_id
				AND rr.status_code = ''pending'') AS chkPend 
			FROM administrative.ba_unit_target ba_t
			INNER JOIN transaction.transaction t1 ON (ba_t.transaction_id = t1.id)
			INNER JOIN application.service s1 ON (t1.from_service_id = s1.id) 
			WHERE ba_t.ba_unit_id = #{id})
SELECT ((SELECT chkPend  FROM pendingRRR) AND (SELECT chkOther FROM otherCancel)  AND (SELECT chkNoOtherAps FROM otherAps)) AS vl 
FROM administrative.ba_unit_target tg
WHERE tg.ba_unit_id  = #{id}'

WHERE br_id = 'target-ba_unit-check-if-pending'; 


-- Update ba_unit-has-a-valid-primary-right to include check for new request type	
 UPDATE system.br_definition
 SET  body = '
SELECT (COUNT(*) = 1) AS vl FROM administrative.rrr rr1 
	 INNER JOIN administrative.ba_unit ba ON (rr1.ba_unit_id = ba.id)
	 INNER JOIN transaction.transaction tn ON (rr1.transaction_id = tn.id)
	 INNER JOIN application.service sv ON ((tn.from_service_id = sv.id) 
	      AND (sv.request_type_code NOT IN (''cancelProperty'', ''disposeSLProperty'')))
 WHERE ba.id = #{id}
 AND rr1.status_code != ''cancelled''
 AND rr1.is_primary
 AND rr1.type_code IN (''ownership'', ''apartment'', ''stateOwnership'', ''lease'')'
 WHERE br_id = 'ba_unit-has-a-valid-primary-right';


-- Add Public Display task
DELETE FROM application.request_type WHERE code = 'publicDisplay';
DELETE FROM system.config_panel_launcher WHERE code = 'publicDisplay';

INSERT INTO system.config_panel_launcher(code, display_value, description, status, launch_group, panel_class, message_code, card_name)
SELECT 'publicDisplay', 'Public Display Panel', null, 'c', 'generalServices', 'org.sola.clients.swing.desktop.cadastre.MapPublicDisplayPanel', 
'cliprgs108', 'MAP_PUBLIC_DISPLAY_PANEL'
WHERE NOT EXISTS (SELECT code FROM system.config_panel_launcher WHERE code = 'publicDisplay'); 

INSERT INTO application.request_type(code, request_category_code, display_value, 
            status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, 
            nr_properties_required, notation_template, rrr_type_code, type_action_code, 
            description, display_group_name, service_panel_code)
    SELECT 'publicDisplay','stateLandServices','Public Display Map','c',5,0.00,0.00,0.00,0,
	null,null,null,'Generates a map of the job area for public display purposes','General', 'publicDisplay'
	WHERE NOT EXISTS (SELECT code FROM application.request_type WHERE code = 'publicDisplay');
	
INSERT INTO system.approle (code, display_value, status, description)
SELECT 'publicDisplay', 'Service - Public Display Map','c', 'State Land Service. Allows the Public Display Map service to be started.'
WHERE NOT EXISTS (SELECT code FROM system.approle WHERE code = 'publicDisplay');

INSERT INTO system.approle_appgroup (approle_code, appgroup_id) 
    (SELECT 'publicDisplay', ag.id FROM system.appgroup ag WHERE ag."name" = 'Super group'
	 AND NOT EXISTS (SELECT approle_code FROM system.approle_appgroup 
	                 WHERE  approle_code = 'publicDisplay'
					 AND    appgroup_id = ag.id));
					 

-- Re-configure Public Display Layers
UPDATE system.config_map_layer
SET    use_in_public_display = FALSE;

UPDATE system.config_map_layer
SET    use_in_public_display = TRUE,
       active = TRUE
WHERE  name IN ('house_num', 'parcels',  'orthophoto', 
                'public-display-parcels', 'road-centerlines'); 
				
UPDATE system.query 
  SET sql  = 
'SELECT co.id, co.name_firstpart || '' '' || co.name_lastpart AS label, 
        st_asewkb(st_transform(co.geom_polygon, #{srid})) AS the_geom 
 FROM cadastre.cadastre_object  co,
      application.application_spatial_unit asu
 WHERE asu.application_id = #{appId}
 AND   co.id = asu.spatial_unit_id
 AND   co.type_code = ''stateLand''
 AND   co.geom_polygon IS NOT NULL
 AND ST_Intersects(st_transform(co.geom_polygon, #{srid}), ST_SetSRID(ST_3DMakeBox(ST_Point(#{minx}, #{miny}),ST_Point(#{maxx}, #{maxy})), #{srid}))', 
       description = 'Used by the Public Display Map task to retrieve state land parcels associated to the job'
WHERE name = 'public_display.parcels';

					 
DROP FUNCTION IF EXISTS application.get_concatenated_name(character varying);

CREATE OR REPLACE FUNCTION application.get_concatenated_name(service_id character varying,
  language_code character varying DEFAULT null)
  RETURNS character varying AS
$BODY$
declare
  rec record;
  category varchar; 
  req_type varchar; 
  launch_group varchar;
  name character varying; 
  status_desc character varying; 
  plan varchar; 
  
BEGIN
	name = '';
	status_desc = '';
	
	IF service_id IS NULL THEN
	 RETURN NULL; 
	END IF;
      
    SELECT  rt.request_category_code, rt.code, pl.launch_group
	INTO    category, req_type, launch_group
	FROM 	application.service ser,
			application.request_type rt,
			system.config_panel_launcher pl
	WHERE	ser.id = service_id
	AND		rt.code = ser.request_type_code
	AND     pl.code = rt.service_panel_code; 
	
	CASE WHEN req_type = 'changeSLParcels' THEN
	    -- Change to state land parcels so list the parcels affected
		FOR rec IN 
			SELECT TRIM(co.name_firstpart) as parcel_num,
				   TRIM(co.name_lastpart)  as plan
			FROM   transaction.transaction t,
				   cadastre.cadastre_object co
			WHERE  t.from_service_id = service_id
			AND	   co.transaction_id = t.id
			ORDER BY co.name_firstpart, co.name_lastpart
		
		LOOP
			name = name || ', ' || rec.parcel_num;
			IF plan IS NULL THEN plan = rec.plan; END IF; 
			IF plan != rec.plan THEN
				name = name || ' ' || plan; 
				plan = rec.plan; 
			END IF; 
		END LOOP;
		
		IF name != '' THEN  
			name = TRIM(SUBSTR(name,2)) || ' ' || plan;
		END IF;
		
    WHEN req_type = 'checklist' THEN
	
	     SELECT get_translation(cg.display_value, language_code)
		 INTO   name
		 FROM   application.service s,
		        application.checklist_group cg
		 WHERE  s.id = service_id
		 AND    cg.code = s.action_notes;
		 
    WHEN launch_group = 'generalServices' THEN
	
	     SELECT s.action_notes
		 INTO   name
		 FROM   application.service s
		 WHERE  s.id = service_id;
		 
	WHEN  category = 'stateLandServices' THEN	
	    -- Registration Services - list the properties affected
		-- by this service
		FOR rec IN 
			SELECT bu.name_firstpart || bu.name_lastpart  as prop
			FROM   transaction.transaction t,
				  administrative.ba_unit bu
			WHERE  t.from_service_id = service_id
			AND	  bu.transaction_id = t.id
			UNION
			SELECT bu.name_firstpart || bu.name_lastpart  as prop
			FROM   transaction.transaction t,
				  administrative.ba_unit bu,
				  administrative.rrr r
			WHERE  t.from_service_id = service_id
			AND	  r.transaction_id = t.id
			AND    bu.id = r.ba_unit_id
			UNION
			SELECT bu.name_firstpart || bu.name_lastpart  as prop
			FROM   transaction.transaction t,
				  administrative.ba_unit bu,
				  administrative.notation n
			WHERE  t.from_service_id = service_id
			AND	  n.transaction_id = t.id
			AND    n.rrr_id IS NULL
			AND    bu.id = n.ba_unit_id
			UNION
			SELECT bu.name_firstpart || bu.name_lastpart  as prop
			FROM   transaction.transaction t,
				  administrative.ba_unit bu,
				  administrative.ba_unit_target tar
			WHERE  t.from_service_id = service_id
			AND	  tar.transaction_id = t.id
			AND    bu.id = tar.ba_unit_id

		LOOP
		   name = name || ', ' || rec.prop;
		END LOOP;
		
		IF name != '' THEN  
			name = TRIM(SUBSTR(name,2));
		END IF;	
	ELSE
		-- do nothing as Information Service or Application Service
	END CASE;
	
RETURN name ;
END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION application.get_concatenated_name(character varying, character varying)
  OWNER TO postgres;
COMMENT ON FUNCTION application.get_concatenated_name(character varying, character varying) IS 'Returns the list properties that have been changed due to the service and/or summary details about the service.';
					 