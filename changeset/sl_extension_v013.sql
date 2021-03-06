﻿-- 26 Sep 2015
-- Add Checklist Request Type and Security Roles

DELETE FROM application.request_type WHERE code = 'checklist';
DELETE FROM system.config_panel_launcher WHERE code = 'checklist';
DELETE FROM system.panel_launcher_group WHERE code = 'generalServices';

INSERT INTO system.panel_launcher_group(code, display_value, description, status)
SELECT 'generalServices', 'General Services', null, 'c'
WHERE NOT EXISTS (SELECT code FROM system.panel_launcher_group WHERE code = 'generalServices');

INSERT INTO system.config_panel_launcher(code, display_value, description, status, launch_group, panel_class, message_code, card_name)
SELECT 'checklist', 'Checklist Panel', null, 'c', 'generalServices', 'org.sola.clients.swing.desktop.workflow.ChecklistPanel', 
'cliprgs108', 'checklistPanel'
WHERE NOT EXISTS (SELECT code FROM system.config_panel_launcher WHERE code = 'checklist');

INSERT INTO application.request_type(code, request_category_code, display_value, 
            status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, 
            nr_properties_required, notation_template, rrr_type_code, type_action_code, 
            description, display_group_name, service_panel_code)
    SELECT 'checklist','stateLandServices','Checklist','c',5,0.00,0.00,0.00,0,
	null,null,null,'Identifies a checklist of items to be completed for this Job','General', 'checklist'
	WHERE NOT EXISTS (SELECT code FROM application.request_type WHERE code = 'checklist');
	
INSERT INTO system.approle (code, display_value, status, description)
SELECT 'checklist', 'Service - Checklist','c', 'State Land Service. Allows the Checklist service to be started.'
WHERE NOT EXISTS (SELECT code FROM system.approle WHERE code = 'checklist');

INSERT INTO system.approle_appgroup (approle_code, appgroup_id) 
    (SELECT 'checklist', ag.id FROM system.appgroup ag WHERE ag."name" = 'Super group'
	 AND NOT EXISTS (SELECT approle_code FROM system.approle_appgroup 
	                 WHERE  approle_code = 'checklist'
					 AND    appgroup_id = ag.id));
					 

--- ***  Drop and create the Checklist tables
DROP TABLE IF EXISTS application.service_checklist_item;
DROP TABLE IF EXISTS application.checklist_item_in_group;
DROP TABLE IF EXISTS application.checklist_item;
DROP TABLE IF EXISTS application.checklist_group;

CREATE TABLE application.checklist_group
(
  code character varying(20) NOT NULL, -- The code for the checklist item group.
  display_value character varying(250) NOT NULL, -- Displayed value of the checklist item group.
  description text, -- Description of the checklist item group.
  status character(1) NOT NULL, -- Status of the checklist item group.
  CONSTRAINT checklist_group_pkey PRIMARY KEY (code),
  CONSTRAINT checklist_group_display_value_unique UNIQUE (display_value)
);

COMMENT ON TABLE application.checklist_group
  IS 'Indicates a group of checklist items that should be applied to various transaction types.
Tags: SOLA State Land Extension, Reference Table';
COMMENT ON COLUMN application.checklist_group.code IS 'The code for the checklist item group.';
COMMENT ON COLUMN application.checklist_group.display_value IS 'Displayed value of the checklist item group.';
COMMENT ON COLUMN application.checklist_group.description IS 'Description of the checklist item group.';
COMMENT ON COLUMN application.checklist_group.status IS 'Status of the checklist item group.';


CREATE TABLE application.checklist_item
(
  code character varying(20) NOT NULL, -- The code for the checklist item.
  display_value character varying(250) NOT NULL, -- Displayed value of the checklist item.
  description text, -- Description of the checklist item.
  status character(1) NOT NULL, -- Status of the checklist item.
  display_order int NOT NULL DEFAULT 0, 
  CONSTRAINT checklist_item_pkey PRIMARY KEY (code),
  CONSTRAINT checklist_item_display_value_unique UNIQUE (display_value)
);

COMMENT ON TABLE application.checklist_item
  IS 'An item that must be checked and confirmed before the application can proceed.
Tags: SOLA State Land Extension, Reference Table';
COMMENT ON COLUMN application.checklist_item.code IS 'The code for the checklist item.';
COMMENT ON COLUMN application.checklist_item.display_value IS 'Displayed value of the checklist item.';
COMMENT ON COLUMN application.checklist_item.description IS 'Description of the checklist item.';
COMMENT ON COLUMN application.checklist_item.status IS 'Status of the checklist item.';
COMMENT ON COLUMN application.checklist_item.display_order IS 'The relative display order for the checklist item.'; 


CREATE TABLE application.checklist_item_in_group
(
  checklist_group_code character varying(20) NOT NULL, -- The code for the checklist group.
  checklist_item_code character varying(20) NOT NULL, -- Code of the checklist item related to the checklist group.
  CONSTRAINT checklist_item_in_group_pkey PRIMARY KEY (checklist_group_code, checklist_item_code),
  CONSTRAINT checklist_item_in_group_group_code_fk FOREIGN KEY (checklist_group_code)
      REFERENCES application.checklist_group (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT checklist_item_in_group_item_code_fk FOREIGN KEY (checklist_item_code)
      REFERENCES application.checklist_item (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
);

COMMENT ON TABLE application.checklist_item_in_group
  IS 'Identifies the checklist items within each checklist group.
Tags: SOLA State Land Extension, Reference Table';
COMMENT ON COLUMN application.checklist_item_in_group.checklist_group_code IS 'The code for the checklist group.';
COMMENT ON COLUMN application.checklist_item_in_group.checklist_item_code IS 'Code of the checklist item related to the checklist group.';


-- *** Drop and create service_checklist_item table
DROP TABLE IF EXISTS application.service_checklist_item;
DROP TABLE IF EXISTS application.service_checklist_item_historic;

CREATE TABLE application.service_checklist_item
(  
  id character varying(40) NOT NULL,
  service_id character varying(40) NOT NULL, -- Identifier for the service.
  checklist_item_code character varying(20), -- Code of the checklist item.
  name character varying(250) NOT NULL,
  description text,
  result character(1), -- Flag indicating if the checklist item passed (true), failed (false) or is not applicable (null)
  comment text, -- Comment entered by the user to clarify why the checklist item passed, failed or is not applicable.
  rowidentifier character varying(40) NOT NULL DEFAULT uuid_generate_v1(), -- Identifies the all change records for the row in the service_checklist_item_historic table
  rowversion integer NOT NULL DEFAULT 0, -- Sequential value indicating the number of times this row has been modified.
  change_action character(1) NOT NULL DEFAULT 'i'::bpchar, -- Indicates if the last data modification action that occurred to the row was insert (i), update (u) or delete (d).
  change_user character varying(50), -- The user id of the last person to modify the row.
  change_time timestamp without time zone NOT NULL DEFAULT now(), -- The date and time the row was last modified.
  CONSTRAINT service_checklist_item_pkey PRIMARY KEY (id),
  CONSTRAINT service_checklist_item_item_code_fk FOREIGN KEY (checklist_item_code)
      REFERENCES application.checklist_item (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT service_checklist_item_service_id_fk FOREIGN KEY (service_id)
      REFERENCES application.service (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
);

COMMENT ON TABLE application.service_checklist_item
  IS 'Indicates if the checklist items applicable to a service are satisified as well as any comments from the user.
Tags: SOLA State Land Extension, Change History';
COMMENT ON COLUMN application.service_checklist_item.id IS 'Identifier for the service checklist item.';
COMMENT ON COLUMN application.service_checklist_item.service_id IS 'Identifier for the service.';
COMMENT ON COLUMN application.service_checklist_item.checklist_item_code IS 'Code of the checklist item. If null, then the service checklist item is a custom item created by the user.';
COMMENT ON COLUMN application.service_checklist_item.name IS 'The name or title for the checklist item. Entered by the user for a custom item.';
COMMENT ON COLUMN application.service_checklist_item.description IS 'The description for the checklist item. Entered by the user for a custom item.';
COMMENT ON COLUMN application.service_checklist_item.result IS 'Flag indicating if the checklist item passed (t), failed (f) or is not applicable (null)';
COMMENT ON COLUMN application.service_checklist_item.comment IS 'Comment entered by the user to clarify why the checklist item passed, failed or is not applicable.';
COMMENT ON COLUMN application.service_checklist_item.rowidentifier IS 'Identifies the all change records for the row in the service_checklist_item_historic table';
COMMENT ON COLUMN application.service_checklist_item.rowversion IS 'Sequential value indicating the number of times this row has been modified.';
COMMENT ON COLUMN application.service_checklist_item.change_action IS 'Indicates if the last data modification action that occurred to the row was insert (i), update (u) or delete (d).';
COMMENT ON COLUMN application.service_checklist_item.change_user IS 'The user id of the last person to modify the row.';
COMMENT ON COLUMN application.service_checklist_item.change_time IS 'The date and time the row was last modified.';

CREATE INDEX service_checklist_item_index_on_rowidentifier
  ON application.service_checklist_item
  USING btree
  (rowidentifier COLLATE pg_catalog."default");
  
CREATE INDEX service_checklist_item_index_on_service_id
  ON application.service_checklist_item
  USING btree
  (service_id COLLATE pg_catalog."default");

CREATE TRIGGER __track_changes
  BEFORE INSERT OR UPDATE
  ON application.service_checklist_item
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_changes();

CREATE TRIGGER __track_history
  AFTER UPDATE OR DELETE
  ON application.service_checklist_item
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_history();

  
CREATE TABLE application.service_checklist_item_historic
(
 id character varying(40),
  service_id character varying(40),
  checklist_item_code character varying(20),
  name character varying(250) NOT NULL,
  description text,
  result character(1),
  comment character varying(1000),
  rowidentifier character varying(40),
  rowversion integer NOT NULL DEFAULT 0,
  change_action character(1),
  change_user character varying(50),
  change_time timestamp without time zone,
  change_time_valid_until timestamp without time zone NOT NULL DEFAULT now()
);

COMMENT ON TABLE application.service_checklist_item_historic
  IS 'History table for the application.servie_checklist_item table';

CREATE INDEX service_checklist_item_historic_index_on_rowidentifier
  ON application.service_checklist_item_historic
  USING btree
  (rowidentifier COLLATE pg_catalog."default");
  
  

-- Checklist Items
INSERT INTO application.checklist_item (code, display_value, description, status, display_order)
VALUES ('landIdentified', 'Land Identified', 'All land affected by the proposed works has been identified ', 'c', 10);
INSERT INTO application.checklist_item (code, display_value, description, status, display_order)
VALUES ('publishPlan', 'Publish Plan', 'The plan outlining the requirements for land to be acquired has been published', 'c', 20); 
INSERT INTO application.checklist_item (code, display_value, description, status, display_order)
VALUES ('notifyLandholders', 'Notify Landholders', 'All affected landholders and adjoining landholders have been notified of the works to be undertaken.', 'c', 30); 
INSERT INTO application.checklist_item (code, display_value, description, status, display_order)
VALUES ('consents', 'Consents', 'Any planning consents for the proposed works have been obtained from the appropriate authority.', 'c', 40);
INSERT INTO application.checklist_item (code, display_value, description, status, display_order)
VALUES ('regInterests', 'Registered Interests', 'All interests registered on the land have been investigated and addressed.', 'c', 50);
INSERT INTO application.checklist_item (code, display_value, description, status, display_order)
VALUES ('transferDocs', 'Transfer Documents', 'Documents to transfer land have been prepared and submitted to the Land Registration Authority', 'c', 60);
INSERT INTO application.checklist_item (code, display_value, description, status, display_order)
VALUES ('conditions', 'Lease Conditions', 'Lease conditions have been negotiated and agreeded', 'c', 70);

-- Compulsory
INSERT INTO application.checklist_group (code, display_value, description, status)
VALUES ('compulsory', 'Compulsory Acquisition', 'Items to confirm when using compulsory powers to acquire new land for state purposes', 'c'); 
INSERT INTO application.checklist_item_in_group(checklist_group_code, checklist_item_code)
VALUES ('compulsory', 'landIdentified'); 
INSERT INTO application.checklist_item_in_group(checklist_group_code, checklist_item_code)
VALUES ('compulsory', 'publishPlan'); 
INSERT INTO application.checklist_item_in_group(checklist_group_code, checklist_item_code)
VALUES ('compulsory', 'notifyLandholders'); 
INSERT INTO application.checklist_item_in_group(checklist_group_code, checklist_item_code)
VALUES ('compulsory', 'consents'); 
INSERT INTO application.checklist_item_in_group(checklist_group_code, checklist_item_code)
VALUES ('compulsory', 'regInterests'); 
INSERT INTO application.checklist_item_in_group(checklist_group_code, checklist_item_code)
VALUES ('compulsory', 'transferDocs'); 

-- Voluntary
INSERT INTO application.checklist_group (code, display_value, description, status)
VALUES ('voluntary', 'Voluntary Acquisition', 'Items to confirm when using voluntary powers to acquire new land for state purposes', 'c'); 
INSERT INTO application.checklist_item_in_group(checklist_group_code, checklist_item_code)
VALUES ('voluntary', 'landIdentified'); 
INSERT INTO application.checklist_item_in_group(checklist_group_code, checklist_item_code)
VALUES ('voluntary', 'consents'); 
INSERT INTO application.checklist_item_in_group(checklist_group_code, checklist_item_code)
VALUES ('voluntary', 'regInterests'); 
INSERT INTO application.checklist_item_in_group(checklist_group_code, checklist_item_code)
VALUES ('voluntary', 'transferDocs'); 

-- Lease
INSERT INTO application.checklist_group (code, display_value, description, status)
VALUES ('lease', 'Lease', 'Items to confirm when leasing new land for state purposes', 'c'); 
INSERT INTO application.checklist_item_in_group(checklist_group_code, checklist_item_code)
VALUES ('lease', 'landIdentified'); 
INSERT INTO application.checklist_item_in_group(checklist_group_code, checklist_item_code)
VALUES ('lease', 'conditions'); 

DROP FUNCTION IF EXISTS application.get_concatenated_name(character varying);

CREATE OR REPLACE FUNCTION application.get_concatenated_name(service_id character varying,
  language_code character varying DEFAULT null)
  RETURNS character varying AS
$BODY$
declare
  rec record;
  category varchar; 
  req_type varchar; 
  name character varying; 
  status_desc character varying; 
  plan varchar; 
  
BEGIN
	name = '';
	status_desc = '';
	
	IF service_id IS NULL THEN
	 RETURN NULL; 
	END IF;
      
    SELECT  rt.request_category_code, rt.code
	INTO    category, req_type
	FROM 	application.service ser,
			application.request_type rt
	WHERE	ser.id = service_id
	AND		rt.code = ser.request_type_code; 
	
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
