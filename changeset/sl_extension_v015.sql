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


-- Add Public Display Map task
DELETE FROM application.service where request_type_code IN ('publicDisplay', 'publicDisplayMap');
DELETE FROM application.request_type WHERE code IN ('publicDisplay', 'publicDisplayMap');
DELETE FROM system.config_panel_launcher WHERE code IN ('publicDisplay', 'publicDisplayMap');
DELETE FROM system.approle WHERE code IN ('publicDisplay', 'publicDisplayMap');

INSERT INTO system.config_panel_launcher(code, display_value, description, status, launch_group, panel_class, message_code, card_name)
SELECT 'publicDisplayMap', 'Public Display Map Panel', null, 'c', 'generalServices', 'org.sola.clients.swing.desktop.cadastre.MapPublicDisplayPanel', 
'cliprgs110', 'MAP_PUBLIC_DISPLAY_PANEL'
WHERE NOT EXISTS (SELECT code FROM system.config_panel_launcher WHERE code = 'publicDisplayMap'); 

INSERT INTO application.request_type(code, request_category_code, display_value, 
            status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, 
            nr_properties_required, notation_template, rrr_type_code, type_action_code, 
            description, display_group_name, service_panel_code)
    SELECT 'publicDisplayMap','stateLandServices','Public Display Map','c',5,0.00,0.00,0.00,0,
	null,null,null,'Generates a map of the job area for public display purposes','General', 'publicDisplayMap'
	WHERE NOT EXISTS (SELECT code FROM application.request_type WHERE code = 'publicDisplayMap');
	
INSERT INTO system.approle (code, display_value, status, description)
SELECT 'publicDisplayMap', 'Service - Public Display Map','c', 'State Land Service. Allows the Public Display Map service to be started.'
WHERE NOT EXISTS (SELECT code FROM system.approle WHERE code = 'publicDisplayMap');

INSERT INTO system.approle_appgroup (approle_code, appgroup_id) 
    (SELECT 'publicDisplayMap', ag.id FROM system.appgroup ag WHERE ag."name" = 'Super group'
	 AND NOT EXISTS (SELECT approle_code FROM system.approle_appgroup 
	                 WHERE  approle_code = 'publicDisplayMap'
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




-- Add task for managing public display details
INSERT INTO system.config_panel_launcher(code, display_value, description, status, launch_group, panel_class, message_code, card_name)
SELECT 'publicDisplay', 'Public Display Panel', null, 'c', 'generalServices', 'org.sola.clients.swing.desktop.workflow.PublicDisplayPanel', 
'cliprgs110', 'publicDisplay'
WHERE NOT EXISTS (SELECT code FROM system.config_panel_launcher WHERE code = 'publicDisplay'); 

INSERT INTO application.request_type(code, request_category_code, display_value, 
            status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, 
            nr_properties_required, notation_template, rrr_type_code, type_action_code, 
            description, display_group_name, service_panel_code)
    SELECT 'publicDisplayMap','stateLandServices','Public Display Map','c',5,0.00,0.00,0.00,0,
	null,null,null,'Generates a map of the job area for public display purposes','General', 'publicDisplayMap'
	WHERE NOT EXISTS (SELECT code FROM application.request_type WHERE code = 'publicDisplayMap');
	
INSERT INTO system.approle (code, display_value, status, description)
SELECT 'publicDisplayMap', 'Service - Public Display Map','c', 'State Land Service. Allows the Public Display Map service to be started.'
WHERE NOT EXISTS (SELECT code FROM system.approle WHERE code = 'publicDisplayMap');

INSERT INTO system.approle_appgroup (approle_code, appgroup_id) 
    (SELECT 'publicDisplayMap', ag.id FROM system.appgroup ag WHERE ag."name" = 'Super group'
	 AND NOT EXISTS (SELECT approle_code FROM system.approle_appgroup 
	                 WHERE  approle_code = 'publicDisplayMap'
					 AND    appgroup_id = ag.id));


--- ***  Drop and create the public display tables
DROP TABLE IF EXISTS application.public_display_item_uses_source;
DROP TABLE IF EXISTS application.public_display_item_uses_source_historic;
DROP TABLE IF EXISTS application.public_display_item;
DROP TABLE IF EXISTS application.public_display_item_historic;
DROP TABLE IF EXISTS application.public_display_type;
DROP TABLE IF EXISTS application.public_display_status;

CREATE TABLE application.public_display_type
(
  code character varying(20) NOT NULL, 
  display_value character varying(250) NOT NULL, 
  description text, 
  status character(1) NOT NULL, 
  CONSTRAINT public_display_type_pkey PRIMARY KEY (code),
  CONSTRAINT public_display_type_display_value_unique UNIQUE (display_value)
);

COMMENT ON TABLE application.public_display_type
  IS 'Code list of public display types
Tags: SOLA State Land Extension, Reference Table';
COMMENT ON COLUMN application.public_display_type.code IS 'The code for the public display type.';
COMMENT ON COLUMN application.public_display_type.display_value IS 'Displayed value of the public display type.';
COMMENT ON COLUMN application.public_display_type.description IS 'Description of the public display type.';
COMMENT ON COLUMN application.public_display_type.status IS 'Status of the public display type.';

INSERT INTO application.public_display_type (code, display_value, description, status)
VALUES ('displayMap', 'Display Map', 'Item for display is a Public Display Map illustrating the location of parcels affected', 'c'); 
INSERT INTO application.public_display_type (code, display_value, description, status)
VALUES ('newspaper', 'Newspaper', 'Item a newspaper advert or notice', 'c'); 
INSERT INTO application.public_display_type (code, display_value, description, status)
VALUES ('website', 'Website', 'The item for display is a website or website page', 'c'); 
INSERT INTO application.public_display_type (code, display_value, description, status)
VALUES ('gazette', 'Gazette Notice', 'Item is a gazette notice', 'c'); 


CREATE TABLE application.public_display_status
(
  code character varying(20) NOT NULL, 
  display_value character varying(250) NOT NULL, 
  description text, 
  status character(1) NOT NULL, 
  CONSTRAINT public_display_status_pkey PRIMARY KEY (code),
  CONSTRAINT public_display_status_display_value_unique UNIQUE (display_value)
);

COMMENT ON TABLE application.public_display_status
  IS 'Code list of public display statuses
Tags: SOLA State Land Extension, Reference Table';
COMMENT ON COLUMN application.public_display_status.code IS 'The code for the public display status.';
COMMENT ON COLUMN application.public_display_status.display_value IS 'Displayed value of the public display status.';
COMMENT ON COLUMN application.public_display_status.description IS 'Description of the public display status.';
COMMENT ON COLUMN application.public_display_status.status IS 'Status of the public display status.';

INSERT INTO application.public_display_status (code, display_value, description, status)
VALUES ('proposed', 'Proposed', 'Item is proposed for public display', 'c'); 
INSERT INTO application.public_display_status (code, display_value, description, status)
VALUES ('beingPreped', 'Being Prepared', 'Item is being prepared for public display', 'c'); 
INSERT INTO application.public_display_status (code, display_value, description, status)
VALUES ('ready', 'Ready', 'Item is ready for public display', 'c'); 
INSERT INTO application.public_display_status (code, display_value, description, status)
VALUES ('withdrawn', 'Withdrawn', 'Item is being withdrawn from public display', 'c'); 

CREATE TABLE application.public_display_item
(  
  id character varying(40) NOT NULL,
  service_id character varying(40) NOT NULL, 
  nr character varying(50), 
  type_code character varying(20) NOT NULL,
  status_code character varying(20) NOT NULL,
  display_from timestamp without time zone,
  display_to timestamp without time zone, 
  description text,
  classification_code character varying(20),
  redact_code character varying(20),
  rowidentifier character varying(40) NOT NULL DEFAULT uuid_generate_v1(), 
  rowversion integer NOT NULL DEFAULT 0,
  change_action character(1) NOT NULL DEFAULT 'i'::bpchar,
  change_user character varying(50),
  change_time timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT public_display_item_pkey PRIMARY KEY (id),
  CONSTRAINT public_display_item_type_code_fk FOREIGN KEY (type_code)
      REFERENCES application.public_display_type (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT public_display_item_service_id_fk FOREIGN KEY (service_id)
      REFERENCES application.service (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT public_display_item_status_code_fk FOREIGN KEY (status_code)
      REFERENCES application.public_display_status (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE 
);

COMMENT ON TABLE application.public_display_item
  IS 'Indicates if the checklist items applicable to a service are satisified as well as any comments from the user.
Tags: SOLA State Land Extension, Change History';
COMMENT ON COLUMN application.public_display_item.id IS 'Identifier for the public display item.';
COMMENT ON COLUMN application.public_display_item.service_id IS 'Identifier for the service.';
COMMENT ON COLUMN application.public_display_item.type_code IS 'The type of public display item. One of Public Display Map, Gazette Notice, Newspaper, etc.';
COMMENT ON COLUMN application.public_display_item.nr IS 'The reference number assigned to the public display item by the user';
COMMENT ON COLUMN application.public_display_item.description IS 'The description for the public display item. Entered by the user.';
COMMENT ON COLUMN application.public_display_item.status_code IS 'The status code for the public display item. One of Being Prepared, On Display or Completed, Withdrawn, etc.';
COMMENT ON COLUMN application.public_display_item.display_from IS 'Optional date indicating when the item is (or was) going to be on display from';
COMMENT ON COLUMN application.public_display_item.display_to IS 'Optional date indicating when the item is (or was) going to be on display to';
COMMENT ON COLUMN application.public_display_item.classification_code IS 'SOLA State Land Extension: The security classification for this Application/Job. Only users with the security classification (or a higher classification) will be able to view the record. If null, the record is considered unrestricted.';
COMMENT ON COLUMN application.public_display_item.redact_code IS 'SOLA State Land Extension: The redact classification for this Application/Job. Only users with the redact classification (or a higher classification) will be able to view the record with un-redacted fields. If null, the record is considered unrestricted and no redaction to the record will occur unless bulk redaction classifications have been set for fields of the record.';
COMMENT ON COLUMN application.public_display_item.rowidentifier IS 'Identifies the all change records for the row in the public_display_item_historic table';
COMMENT ON COLUMN application.public_display_item.rowversion IS 'Sequential value indicating the number of times this row has been modified.';
COMMENT ON COLUMN application.public_display_item.change_action IS 'Indicates if the last data modification action that occurred to the row was insert (i), update (u) or delete (d).';
COMMENT ON COLUMN application.public_display_item.change_user IS 'The user id of the last person to modify the row.';
COMMENT ON COLUMN application.public_display_item.change_time IS 'The date and time the row was last modified.';

CREATE INDEX public_display_item_index_on_rowidentifier
  ON application.public_display_item
  USING btree
  (rowidentifier COLLATE pg_catalog."default");
  
CREATE INDEX public_display_item_index_on_service_id
  ON application.public_display_item
  USING btree
  (service_id COLLATE pg_catalog."default");

CREATE TRIGGER __track_changes
  BEFORE INSERT OR UPDATE
  ON application.public_display_item
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_changes();

CREATE TRIGGER __track_history
  AFTER UPDATE OR DELETE
  ON application.public_display_item
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_history();


CREATE TABLE application.public_display_item_historic
(  
  id character varying(40),
  service_id character varying(40), 
  nr character varying(50), 
  type_code character varying(20),
  status_code character varying(20),
  display_from timestamp without time zone,
  display_to timestamp without time zone, 
  description text,
  classification_code character varying(20),
  redact_code character varying(20),
  rowidentifier character varying(40), 
  rowversion integer NOT NULL DEFAULT 0,
  change_action character(1),
  change_user character varying(50),
  change_time timestamp without time zone,
  change_time_valid_until timestamp without time zone NOT NULL DEFAULT now());

COMMENT ON TABLE application.public_display_item_historic
  IS 'History table for the application.spublic_display_item table';

CREATE INDEX public_display_item_historic_index_on_rowidentifier
  ON application.public_display_item_historic
  USING btree
  (rowidentifier COLLATE pg_catalog."default");
  
  
CREATE TABLE application.public_display_item_uses_source
(
  public_display_item_id character varying(40) NOT NULL,
  source_id character varying(40) NOT NULL, 
  rowidentifier character varying(40) NOT NULL DEFAULT uuid_generate_v1(), 
  rowversion integer NOT NULL DEFAULT 0, 
  change_action character(1) NOT NULL DEFAULT 'i'::bpchar, 
  change_user character varying(50),
  change_time timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT public_display_item_uses_source_pkey PRIMARY KEY (public_display_item_id, source_id),
  CONSTRAINT public_display_item_uses_source_public_display_item_id_fk FOREIGN KEY (public_display_item_id)
      REFERENCES application.public_display_item (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT public_display_item_uses_source_source_id_fk FOREIGN KEY (source_id)
      REFERENCES source.source (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
);


COMMENT ON TABLE application.public_display_item_uses_source
  IS 'Links the public display items to the sources (a.k.a. documents) submitted with the application. 
Tags: FLOSS SOLA Extension, Change History';
COMMENT ON COLUMN application.public_display_item_uses_source.public_display_item_id IS 'Identifier for the public display item the record is associated to.';
COMMENT ON COLUMN application.public_display_item_uses_source.source_id IS 'Identifier of the source associated to the application.';
COMMENT ON COLUMN application.public_display_item_uses_source.rowidentifier IS 'Identifies the all change records for the row in the public_display_item_uses_source_historic table';
COMMENT ON COLUMN application.public_display_item_uses_source.rowversion IS 'Sequential value indicating the number of times this row has been modified.';
COMMENT ON COLUMN application.public_display_item_uses_source.change_action IS 'Indicates if the last data modification action that occurred to the row was insert (i), update (u) or delete (d).';
COMMENT ON COLUMN application.public_display_item_uses_source.change_user IS 'The user id of the last person to modify the row.';
COMMENT ON COLUMN application.public_display_item_uses_source.change_time IS 'The date and time the row was last modified.';

CREATE INDEX public_display_item_uses_source_public_display_item_id_fk_ind
  ON application.public_display_item_uses_source
  USING btree
  (public_display_item_id COLLATE pg_catalog."default");

CREATE INDEX public_display_item_uses_source_index_on_rowidentifier
  ON application.public_display_item_uses_source
  USING btree
  (rowidentifier COLLATE pg_catalog."default");

CREATE INDEX public_display_item_uses_source_source_id_fk_ind
  ON application.public_display_item_uses_source
  USING btree
  (source_id COLLATE pg_catalog."default");

CREATE TRIGGER __track_changes
  BEFORE INSERT OR UPDATE
  ON application.public_display_item_uses_source
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_changes();

CREATE TRIGGER __track_history
  AFTER UPDATE OR DELETE
  ON application.public_display_item_uses_source
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_history();
  
 
CREATE TABLE application.public_display_item_uses_source_historic
(
  public_display_item_id character varying(40),
  source_id character varying(40),
  rowidentifier character varying(40),
  rowversion integer,
  change_action character(1),
  change_user character varying(50),
  change_time timestamp without time zone,
  change_time_valid_until timestamp without time zone NOT NULL DEFAULT now()
);

CREATE INDEX public_display_item_uses_source_historic_index_on_rowidentifier
  ON application.public_display_item_uses_source_historic
  USING btree
  (rowidentifier COLLATE pg_catalog."default");

  
  
  

-- Update get_concatenated_name function					 
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
					 