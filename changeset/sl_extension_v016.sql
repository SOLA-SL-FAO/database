-- 3 Nov 2014
-- Add task to support recording of objections raised by concerned parties.  
DELETE FROM application.service where request_type_code IN ('slObjection');
DELETE FROM application.request_type WHERE code IN ('slObjection');
DELETE FROM system.config_panel_launcher WHERE code IN ('slObjection');
DELETE FROM system.approle WHERE code IN ('slObjection', 'ObjectionCommentEdit');

INSERT INTO system.config_panel_launcher(code, display_value, description, status, launch_group, panel_class, message_code, card_name)
SELECT 'slObjection', 'Objections List Panel', null, 'c', 'generalServices', 'org.sola.clients.swing.desktop.workflow.ObjectionListPanel', 
null, 'slObjectionListPanel'
WHERE NOT EXISTS (SELECT code FROM system.config_panel_launcher WHERE code = 'slObjection'); 

INSERT INTO application.request_type(code, request_category_code, display_value, 
            status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, 
            nr_properties_required, notation_template, rrr_type_code, type_action_code, 
            description, display_group_name, service_panel_code)
    SELECT 'slObjection','stateLandServices','Manage Objections','c',5,0.00,0.00,0.00,0,
	null,null,null,'Records details of objections raised by parties affected by State Land activities','General', 'slObjection'
	WHERE NOT EXISTS (SELECT code FROM application.request_type WHERE code = 'slObjection');
	
INSERT INTO system.approle (code, display_value, status, description)
SELECT 'slObjection', 'Service - Manage Objections','c', 'State Land Service. Allows the Manage Objections service to be started.'
WHERE NOT EXISTS (SELECT code FROM system.approle WHERE code = 'slObjection');

INSERT INTO system.approle_appgroup (approle_code, appgroup_id) 
    (SELECT 'slObjection', ag.id FROM system.appgroup ag WHERE ag."name" = 'Super group'
	 AND NOT EXISTS (SELECT approle_code FROM system.approle_appgroup 
	                 WHERE  approle_code = 'slObjection'
					 AND    appgroup_id = ag.id));
					 
INSERT INTO system.approle (code, display_value, status, description)
SELECT 'ObjectionCommentEdit', 'Workflow - Edit Objection Comment','c', 'Allows the user to edit or remove all Timeline comments on an Objection task.'
WHERE NOT EXISTS (SELECT code FROM system.approle WHERE code = 'ObjectionCommentEdit');

INSERT INTO system.approle_appgroup (approle_code, appgroup_id) 
    (SELECT 'ObjectionCommentEdit', ag.id FROM system.appgroup ag WHERE ag."name" = 'Super group'
	 AND NOT EXISTS (SELECT approle_code FROM system.approle_appgroup 
	                 WHERE  approle_code = 'ObjectionCommentEdit'
					 AND    appgroup_id = ag.id));
					 
--- ***  Drop and create the objection tables
DROP TABLE IF EXISTS application.objection_uses_source;
DROP TABLE IF EXISTS application.objection_uses_source_historic;
DROP TABLE IF EXISTS application.objection_property;
DROP TABLE IF EXISTS application.objection_property_historic;
DROP TABLE IF EXISTS application.objection_party;
DROP TABLE IF EXISTS application.objection_party_historic;
DROP TABLE IF EXISTS application.objection_comment;
DROP TABLE IF EXISTS application.objection_comment_historic;
DROP TABLE IF EXISTS application.objection;
DROP TABLE IF EXISTS application.objection_historic;
DROP TABLE IF EXISTS application.objection_status;
DROP TABLE IF EXISTS application.authority;

-- *** objection_status
CREATE TABLE application.objection_status
(
  code character varying(20) NOT NULL, 
  display_value character varying(250) NOT NULL, 
  description text, 
  status character(1) NOT NULL, 
  CONSTRAINT objection_status_pkey PRIMARY KEY (code),
  CONSTRAINT objection_status_display_value_unique UNIQUE (display_value)
);

COMMENT ON TABLE application.objection_status
  IS 'Code list of objection status
Tags: SOLA State Land Extension, Reference Table';
COMMENT ON COLUMN application.objection_status.code IS 'The code for the objection status.';
COMMENT ON COLUMN application.objection_status.display_value IS 'Displayed value of the objection status.';
COMMENT ON COLUMN application.objection_status.description IS 'Description of the objection status.';
COMMENT ON COLUMN application.objection_status.status IS 'Status of the objection status (c - current, x - no longer valid).';

INSERT INTO application.objection_status (code, display_value, description, status)
VALUES ('lodged', 'Lodged', 'The objection hs been lodged but has yet to be assessed.', 'c'); 
INSERT INTO application.objection_status (code, display_value, description, status)
VALUES ('open', 'Open', 'The objection is being assessed and relevant actions to resolve the objection are in progress.', 'c'); 
INSERT INTO application.objection_status (code, display_value, description, status)
VALUES ('resolved', 'Resolved', 'A suitable resolution has been reached with all parties invovled. No further actions are requried.', 'c');
INSERT INTO application.objection_status (code, display_value, description, status)
VALUES ('closed', 'Closed', 'A resolution for the objection has been perscribed by the relavant authority.', 'c');
INSERT INTO application.objection_status (code, display_value, description, status)
VALUES ('appeal', 'Appeal', 'The resolution proposed for the objection is being appealled by one or more parties.', 'c'); 
INSERT INTO application.objection_status (code, display_value, description, status)
VALUES ('withdrawn', 'Withdrawn', 'The parties lodging the objection have withdrawn it.', 'c'); 

-- *** authority
CREATE TABLE application.authority
(
  code character varying(20) NOT NULL, 
  display_value character varying(250) NOT NULL, 
  description text, 
  status character(1) NOT NULL, 
  CONSTRAINT authority_pkey PRIMARY KEY (code),
  CONSTRAINT authority_display_value_unique UNIQUE (display_value)
);

COMMENT ON TABLE application.authority
  IS 'Code list of authorities that can assist in the resolution of a dispute or objection. 
Tags: SOLA State Land Extension, Reference Table';
COMMENT ON COLUMN application.authority.code IS 'The code for the authority.';
COMMENT ON COLUMN application.authority.display_value IS 'Displayed value of the authority.';
COMMENT ON COLUMN application.authority.description IS 'Description of the authority.';
COMMENT ON COLUMN application.authority.status IS 'Status of the authority (c - current, x - no longer valid).';

INSERT INTO application.authority (code, display_value, description, status)
VALUES ('mediator', 'Mediator', 'A mediator is being used to help resolve the dispute or objection.', 'c'); 
INSERT INTO application.authority (code, display_value, description, status)
VALUES ('court', 'Court', 'A court is being used to help resolve the dispute or objection.', 'c'); 
INSERT INTO application.authority (code, display_value, description, status)
VALUES ('tribunal', 'Tribunal', 'A tribunal is being used to help resolve the dispute or objection.', 'c');  



-- *** objection
CREATE TABLE application.objection
(  
  id character varying(40) NOT NULL,
  service_id character varying(40) NOT NULL, 
  nr character varying(50), 
  status_code character varying(20) NOT NULL DEFAULT 'lodged',
  lodged_date timestamp without time zone NOT NULL DEFAULT now(),
  resolution_date timestamp without time zone, 
  description text,
  resolution text,
  authority_code character varying(20),
  classification_code character varying(20),
  redact_code character varying(20),
  rowidentifier character varying(40) NOT NULL DEFAULT uuid_generate_v1(), 
  rowversion integer NOT NULL DEFAULT 0,
  change_action character(1) NOT NULL DEFAULT 'i'::bpchar,
  change_user character varying(50),
  change_time timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT objection_pkey PRIMARY KEY (id),
  CONSTRAINT objection_service_id_fk FOREIGN KEY (service_id)
      REFERENCES application.service (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT objection_status_code_fk FOREIGN KEY (status_code)
      REFERENCES application.objection_status (code) MATCH SIMPLE,
  CONSTRAINT objection_authority_code_fk FOREIGN KEY (authority_code)
      REFERENCES application.authority (code) MATCH SIMPLE
);

COMMENT ON TABLE application.objection
  IS 'Identifies details of an objection raised by parties affected by the activities of the state in relation to land.
Tags: SOLA State Land Extension, Change History';
COMMENT ON COLUMN application.objection.id IS 'Identifier for the objection.';
COMMENT ON COLUMN application.objection.service_id IS 'Identifier for the service.';
COMMENT ON COLUMN application.objection.nr IS 'The reference number assigned to the objection by the user';
COMMENT ON COLUMN application.objection.description IS 'The description for the objection. Entered by the user.';
COMMENT ON COLUMN application.objection.status_code IS 'The status code for the objection. One of Lodged, Open, Resolved, Closed, Appeal or Withdrawn, etc.';
COMMENT ON COLUMN application.objection.lodged_date IS 'Date indicating when the objection was first lodged with the state.';
COMMENT ON COLUMN application.objection.resolution_date IS 'Date indicating when the objection was resolved.';
COMMENT ON COLUMN application.objection.resolution IS 'Description of the resolution for the objection along with any notes on how the resolution will be enforced.';
COMMENT ON COLUMN application.objection.authority_code IS 'The authority that is assisting to resolve the dispute. Can be Mediator, Court, Tribunal, etc.';
COMMENT ON COLUMN application.objection.classification_code IS 'SOLA State Land Extension: The security classification for this Objection. Only users with the security classification (or a higher classification) will be able to view the record. If null, the record is considered unrestricted.';
COMMENT ON COLUMN application.objection.redact_code IS 'SOLA State Land Extension: The redact classification for this Objection. Only users with the redact classification (or a higher classification) will be able to view the record with un-redacted fields. If null, the record is considered unrestricted and no redaction to the record will occur unless bulk redaction classifications have been set for fields of the record.';
COMMENT ON COLUMN application.objection.rowidentifier IS 'Identifies the all change records for the row in the objection_historic table';
COMMENT ON COLUMN application.objection.rowversion IS 'Sequential value indicating the number of times this row has been modified.';
COMMENT ON COLUMN application.objection.change_action IS 'Indicates if the last data modification action that occurred to the row was insert (i), update (u) or delete (d).';
COMMENT ON COLUMN application.objection.change_user IS 'The user id of the last person to modify the row.';
COMMENT ON COLUMN application.objection.change_time IS 'The date and time the row was last modified.';

CREATE INDEX objection_index_on_rowidentifier
  ON application.objection
  USING btree
  (rowidentifier COLLATE pg_catalog."default");
  
CREATE INDEX objection_index_on_service_id
  ON application.objection
  USING btree
  (service_id COLLATE pg_catalog."default");

CREATE TRIGGER __track_changes
  BEFORE INSERT OR UPDATE
  ON application.objection
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_changes();

CREATE TRIGGER __track_history
  AFTER UPDATE OR DELETE
  ON application.objection
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_history();


CREATE TABLE application.objection_historic
(  
  id character varying(40),
  service_id character varying(40), 
  nr character varying(50), 
  status_code character varying(20),
  lodged_date timestamp without time zone,
  resolution_date timestamp without time zone, 
  description text,
  resolution text,
  authority_code character varying(20),
  classification_code character varying(20),
  redact_code character varying(20),
  rowidentifier character varying(40), 
  rowversion integer NOT NULL DEFAULT 0,
  change_action character(1),
  change_user character varying(50),
  change_time timestamp without time zone,
  change_time_valid_until timestamp without time zone NOT NULL DEFAULT now());

COMMENT ON TABLE application.objection_historic
  IS 'History table for the application.objection table';

CREATE INDEX objection_historic_index_on_rowidentifier
  ON application.objection_historic
  USING btree
  (rowidentifier COLLATE pg_catalog."default");
  
-- *** objection_comment 
CREATE TABLE application.objection_comment
(  
  id character varying(40) NOT NULL,
  objection_id character varying(40) NOT NULL,
  username character varying(40) NOT NULL,
  comment_date timestamp without time zone NOT NULL DEFAULT now(),
  comment text, 
  rowidentifier character varying(40) NOT NULL DEFAULT uuid_generate_v1(), 
  rowversion integer NOT NULL DEFAULT 0, 
  change_action character(1) NOT NULL DEFAULT 'i'::bpchar, 
  change_user character varying(50),
  change_time timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT objection_comment_pkey PRIMARY KEY (id),
  CONSTRAINT objection_comment_objection_id_fk FOREIGN KEY (objection_id)
      REFERENCES application.objection (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
);


COMMENT ON TABLE application.objection_comment
  IS 'Describes actions that have occurred in relation to this objection such as court filings, court appearance dates, etc. Intended to provide a history of actions related to dealing with this objection.  
Tags: FLOSS SOLA Extension, Change History';
COMMENT ON COLUMN application.objection_comment.id IS 'Identifier for the objection comment.';
COMMENT ON COLUMN application.objection_comment.objection_id IS 'Identifier of the objection the comment relates to.';
COMMENT ON COLUMN application.objection_comment.username IS 'The username of the user that entered the comment.';
COMMENT ON COLUMN application.objection_comment.comment_date IS 'The date applicable for the comment such as the date entered or the date the comment applies from.';
COMMENT ON COLUMN application.objection_comment.comment IS 'The comment relating to the objection.';
COMMENT ON COLUMN application.objection_comment.rowidentifier IS 'Identifies the all change records for the row in the objection_comment_historic table';
COMMENT ON COLUMN application.objection_comment.rowversion IS 'Sequential value indicating the number of times this row has been modified.';
COMMENT ON COLUMN application.objection_comment.change_action IS 'Indicates if the last data modification action that occurred to the row was insert (i), update (u) or delete (d).';
COMMENT ON COLUMN application.objection_comment.change_user IS 'The user id of the last person to modify the row.';
COMMENT ON COLUMN application.objection_comment.change_time IS 'The date and time the row was last modified.';

CREATE INDEX objection_comment_objection_id_fk_ind
  ON application.objection_comment
  USING btree
  (objection_id COLLATE pg_catalog."default");

CREATE INDEX objection_comment_index_on_rowidentifier
  ON application.objection_comment
  USING btree
  (rowidentifier COLLATE pg_catalog."default");

CREATE TRIGGER __track_changes
  BEFORE INSERT OR UPDATE
  ON application.objection_comment
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_changes();

CREATE TRIGGER __track_history
  AFTER UPDATE OR DELETE
  ON application.objection_comment
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_history();
  
 
CREATE TABLE application.objection_comment_historic
(
  id character varying(40),
  objection_id character varying(40),
  username character varying(40),
  comment_date timestamp without time zone,
  comment text,
  rowidentifier character varying(40),
  rowversion integer,
  change_action character(1),
  change_user character varying(50),
  change_time timestamp without time zone,
  change_time_valid_until timestamp without time zone NOT NULL DEFAULT now()
);

CREATE INDEX objection_comment_historic_index_on_rowidentifier
  ON application.objection_comment_historic
  USING btree
  (rowidentifier COLLATE pg_catalog."default");
  
 
-- *** objection_uses_source 
CREATE TABLE application.objection_uses_source
(
  objection_id character varying(40) NOT NULL,
  source_id character varying(40) NOT NULL, 
  rowidentifier character varying(40) NOT NULL DEFAULT uuid_generate_v1(), 
  rowversion integer NOT NULL DEFAULT 0, 
  change_action character(1) NOT NULL DEFAULT 'i'::bpchar, 
  change_user character varying(50),
  change_time timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT objection_uses_source_pkey PRIMARY KEY (objection_id, source_id),
  CONSTRAINT objection_uses_source_objection_id_fk FOREIGN KEY (objection_id)
      REFERENCES application.objection (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT objection_uses_source_source_id_fk FOREIGN KEY (source_id)
      REFERENCES source.source (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
);


COMMENT ON TABLE application.objection_uses_source
  IS 'Links the objections to the sources (a.k.a. documents) submitted with the objection. 
Tags: FLOSS SOLA Extension, Change History';
COMMENT ON COLUMN application.objection_uses_source.objection_id IS 'Identifier for the objection the record is associated to.';
COMMENT ON COLUMN application.objection_uses_source.source_id IS 'Identifier of the source associated to the application.';
COMMENT ON COLUMN application.objection_uses_source.rowidentifier IS 'Identifies the all change records for the row in the objection_uses_source_historic table';
COMMENT ON COLUMN application.objection_uses_source.rowversion IS 'Sequential value indicating the number of times this row has been modified.';
COMMENT ON COLUMN application.objection_uses_source.change_action IS 'Indicates if the last data modification action that occurred to the row was insert (i), update (u) or delete (d).';
COMMENT ON COLUMN application.objection_uses_source.change_user IS 'The user id of the last person to modify the row.';
COMMENT ON COLUMN application.objection_uses_source.change_time IS 'The date and time the row was last modified.';

CREATE INDEX objection_uses_source_objection_id_fk_ind
  ON application.objection_uses_source
  USING btree
  (objection_id COLLATE pg_catalog."default");

CREATE INDEX objection_uses_source_index_on_rowidentifier
  ON application.objection_uses_source
  USING btree
  (rowidentifier COLLATE pg_catalog."default");

CREATE INDEX objection_uses_source_source_id_fk_ind
  ON application.objection_uses_source
  USING btree
  (source_id COLLATE pg_catalog."default");

CREATE TRIGGER __track_changes
  BEFORE INSERT OR UPDATE
  ON application.objection_uses_source
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_changes();

CREATE TRIGGER __track_history
  AFTER UPDATE OR DELETE
  ON application.objection_uses_source
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_history();
  
 
CREATE TABLE application.objection_uses_source_historic
(
  objection_id character varying(40),
  source_id character varying(40),
  rowidentifier character varying(40),
  rowversion integer,
  change_action character(1),
  change_user character varying(50),
  change_time timestamp without time zone,
  change_time_valid_until timestamp without time zone NOT NULL DEFAULT now()
);

CREATE INDEX objection_uses_source_historic_index_on_rowidentifier
  ON application.objection_uses_source_historic
  USING btree
  (rowidentifier COLLATE pg_catalog."default");
  
-- *** objection_party
CREATE TABLE application.objection_party
(
  objection_id character varying(40) NOT NULL,
  party_id character varying(40) NOT NULL, 
  rowidentifier character varying(40) NOT NULL DEFAULT uuid_generate_v1(), 
  rowversion integer NOT NULL DEFAULT 0, 
  change_action character(1) NOT NULL DEFAULT 'i'::bpchar, 
  change_user character varying(50),
  change_time timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT objection_party_pkey PRIMARY KEY (objection_id, party_id),
  CONSTRAINT objection_party_objection_id_fk FOREIGN KEY (objection_id)
      REFERENCES application.objection (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT objection_party_party_id_fk FOREIGN KEY (party_id)
      REFERENCES party.party (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
);


COMMENT ON TABLE application.objection_party
  IS 'Identifies the parties that are invovled with this objection. 
Tags: FLOSS SOLA Extension, Change History';
COMMENT ON COLUMN application.objection_party.objection_id IS 'Identifier for the objection the record is associated to.';
COMMENT ON COLUMN application.objection_party.party_id IS 'Identifier of the party associated to the objection.';
COMMENT ON COLUMN application.objection_party.rowidentifier IS 'Identifies the all change records for the row in the objection_party_historic table';
COMMENT ON COLUMN application.objection_party.rowversion IS 'Sequential value indicating the number of times this row has been modified.';
COMMENT ON COLUMN application.objection_party.change_action IS 'Indicates if the last data modification action that occurred to the row was insert (i), update (u) or delete (d).';
COMMENT ON COLUMN application.objection_party.change_user IS 'The user id of the last person to modify the row.';
COMMENT ON COLUMN application.objection_party.change_time IS 'The date and time the row was last modified.';

CREATE INDEX objection_party_objection_id_fk_ind
  ON application.objection_party
  USING btree
  (objection_id COLLATE pg_catalog."default");

CREATE INDEX objection_party_index_on_rowidentifier
  ON application.objection_party
  USING btree
  (rowidentifier COLLATE pg_catalog."default");

CREATE INDEX objection_party_party_id_fk_ind
  ON application.objection_party
  USING btree
  (party_id COLLATE pg_catalog."default");

CREATE TRIGGER __track_changes
  BEFORE INSERT OR UPDATE
  ON application.objection_party
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_changes();

CREATE TRIGGER __track_history
  AFTER UPDATE OR DELETE
  ON application.objection_party
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_history();
 
CREATE TABLE application.objection_party_historic
(
  objection_id character varying(40),
  party_id character varying(40),
  rowidentifier character varying(40),
  rowversion integer,
  change_action character(1),
  change_user character varying(50),
  change_time timestamp without time zone,
  change_time_valid_until timestamp without time zone NOT NULL DEFAULT now()
);

CREATE INDEX objection_party_historic_index_on_rowidentifier
  ON application.objection_party_historic
  USING btree
  (rowidentifier COLLATE pg_catalog."default");
  
 -- *** objection_property
CREATE TABLE application.objection_property
(
  objection_id character varying(40) NOT NULL,
  ba_unit_id character varying(40) NOT NULL, 
  rowidentifier character varying(40) NOT NULL DEFAULT uuid_generate_v1(), 
  rowversion integer NOT NULL DEFAULT 0, 
  change_action character(1) NOT NULL DEFAULT 'i'::bpchar, 
  change_user character varying(50),
  change_time timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT objection_property_pkey PRIMARY KEY (objection_id, ba_unit_id),
  CONSTRAINT objection_property_objection_id_fk FOREIGN KEY (objection_id)
      REFERENCES application.objection (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT objection_property_ba_unit_id_fk FOREIGN KEY (ba_unit_id)
      REFERENCES administrative.ba_unit (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
);


COMMENT ON TABLE application.objection_property
  IS 'Identifies the properties (a.k.a. Ba Units) this objection is in relation to. 
Tags: FLOSS SOLA Extension, Change History';
COMMENT ON COLUMN application.objection_property.objection_id IS 'Identifier for the objection the record is associated to.';
COMMENT ON COLUMN application.objection_property.ba_unit_id IS 'Identifier of the property associated to the objection.';
COMMENT ON COLUMN application.objection_property.rowidentifier IS 'Identifies the all change records for the row in the objection_property_historic table';
COMMENT ON COLUMN application.objection_property.rowversion IS 'Sequential value indicating the number of times this row has been modified.';
COMMENT ON COLUMN application.objection_property.change_action IS 'Indicates if the last data modification action that occurred to the row was insert (i), update (u) or delete (d).';
COMMENT ON COLUMN application.objection_property.change_user IS 'The user id of the last person to modify the row.';
COMMENT ON COLUMN application.objection_property.change_time IS 'The date and time the row was last modified.';

CREATE INDEX objection_property_objection_id_fk_ind
  ON application.objection_property
  USING btree
  (objection_id COLLATE pg_catalog."default");

CREATE INDEX objection_property_index_on_rowidentifier
  ON application.objection_property
  USING btree
  (rowidentifier COLLATE pg_catalog."default");

CREATE INDEX objection_property_ba_unit_id_fk_ind
  ON application.objection_property
  USING btree
  (ba_unit_id COLLATE pg_catalog."default");

CREATE TRIGGER __track_changes
  BEFORE INSERT OR UPDATE
  ON application.objection_property
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_changes();

CREATE TRIGGER __track_history
  AFTER UPDATE OR DELETE
  ON application.objection_property
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_history();
 
CREATE TABLE application.objection_property_historic
(
  objection_id character varying(40),
  ba_unit_id character varying(40),
  rowidentifier character varying(40),
  rowversion integer,
  change_action character(1),
  change_user character varying(50),
  change_time timestamp without time zone,
  change_time_valid_until timestamp without time zone NOT NULL DEFAULT now()
);

CREATE INDEX objection_property_historic_index_on_rowidentifier
  ON application.objection_property_historic
  USING btree
  (rowidentifier COLLATE pg_catalog."default");

  
  
  
  
  -- Add task to support generating bulk notifications to a number of parties.  
DELETE FROM application.service where request_type_code IN ('slNotify');
DELETE FROM application.request_type WHERE code IN ('slNotify');
DELETE FROM system.config_panel_launcher WHERE code IN ('slNotify');
DELETE FROM system.approle WHERE code IN ('slNotify');

INSERT INTO system.config_panel_launcher(code, display_value, description, status, launch_group, panel_class, message_code, card_name)
SELECT 'slNotify', 'Notify List Panel', null, 'c', 'generalServices', 'org.sola.clients.swing.desktop.workflow.NotifyListPanel', 
null, 'slNotifyListPanel'
WHERE NOT EXISTS (SELECT code FROM system.config_panel_launcher WHERE code = 'slNotify'); 

INSERT INTO application.request_type(code, request_category_code, display_value, 
            status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, 
            nr_properties_required, notation_template, rrr_type_code, type_action_code, 
            description, display_group_name, service_panel_code)
    SELECT 'slNotify','stateLandServices','Manage Notifications','c',5,0.00,0.00,0.00,0,
	null,null,null,'Used for generating and managing bulk notifications related to the job','General', 'slNotify'
	WHERE NOT EXISTS (SELECT code FROM application.request_type WHERE code = 'slNotify');
	
INSERT INTO system.approle (code, display_value, status, description)
SELECT 'slNotify', 'Service - Manage Notifications','c', 'State Land Service. Allows the Manage Notifications service to be started.'
WHERE NOT EXISTS (SELECT code FROM system.approle WHERE code = 'slNotify');

INSERT INTO system.approle_appgroup (approle_code, appgroup_id) 
    (SELECT 'slNotify', ag.id FROM system.appgroup ag WHERE ag."name" = 'Super group'
	 AND NOT EXISTS (SELECT approle_code FROM system.approle_appgroup 
	                 WHERE  approle_code = 'slNotify'
					 AND    appgroup_id = ag.id));
					 
--- ***  Drop and create the notify tables
DROP TABLE IF EXISTS application.notify_uses_source;
DROP TABLE IF EXISTS application.notify_uses_source_historic;
DROP TABLE IF EXISTS application.notify_property;
DROP TABLE IF EXISTS application.notify_property_historic;
DROP TABLE IF EXISTS application.notify;
DROP TABLE IF EXISTS application.notify_historic;
DROP TABLE IF EXISTS application.notify_relationship_type;

-- *** notify_relationship_type
CREATE TABLE application.notify_relationship_type
(
  code character varying(20) NOT NULL, 
  display_value character varying(250) NOT NULL, 
  description text, 
  status character(1) NOT NULL, 
  CONSTRAINT notify_relationship_type_pkey PRIMARY KEY (code),
  CONSTRAINT notify_relationship_type_display_value_unique UNIQUE (display_value)
);

COMMENT ON TABLE application.notify_relationship_type
  IS 'Code list identifying the type of relationship a party has with land affected by a job. Used for bulk notification purposes. 
Tags: SOLA State Land Extension, Reference Table';
COMMENT ON COLUMN application.notify_relationship_type.code IS 'The code for the relationship type.';
COMMENT ON COLUMN application.notify_relationship_type.display_value IS 'Displayed value of the relationship type.';
COMMENT ON COLUMN application.notify_relationship_type.description IS 'Description of the relationship type.';
COMMENT ON COLUMN application.notify_relationship_type.status IS 'Status of the relationship type (c - current, x - no longer valid).';

INSERT INTO application.notify_relationship_type (code, display_value, description, status)
VALUES ('owner', 'Owner', 'Party to notify is an owner of land affected by the job.', 'c'); 
INSERT INTO application.notify_relationship_type (code, display_value, description, status)
VALUES ('adjoiningOwner', 'Adjoining Owner', 'Party to notify is an owner of land adjoining the land affected by the job', 'c'); 
INSERT INTO application.notify_relationship_type (code, display_value, description, status)
VALUES ('occupier', 'Occupier', 'Party to notify is and occupier or tenant of the land affected by the job', 'c'); 
INSERT INTO application.notify_relationship_type (code, display_value, description, status)
VALUES ('adjoiningOccupier', 'Adjoining Occupier', 'Party to notify is an occupier or tenant of land adjoining the land affected by the job', 'c'); 
INSERT INTO application.notify_relationship_type (code, display_value, description, status)
VALUES ('rightHolder', 'Rightholder', 'Party to notify has a recognized right or interest (e.g. easement) over the land affected by the job', 'c'); 
INSERT INTO application.notify_relationship_type (code, display_value, description, status)
VALUES ('other', 'Other', 'Party to notify has a general interest in the land but is not an owner, rightholder, occuiper or tenant of the land affected by the job.', 'c');


-- *** notify
CREATE TABLE application.notify
(  
  id character varying(40) NOT NULL,
  service_id character varying(40) NOT NULL, 
  party_id character varying(40) NOT NULL, 
  relationship_type_code character varying(20) NOT NULL DEFAULT 'owner',
  description text, 
  classification_code character varying(20),
  redact_code character varying(20),
  rowidentifier character varying(40) NOT NULL DEFAULT uuid_generate_v1(), 
  rowversion integer NOT NULL DEFAULT 0,
  change_action character(1) NOT NULL DEFAULT 'i'::bpchar,
  change_user character varying(50),
  change_time timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT notify_pkey PRIMARY KEY (id),
  CONSTRAINT notify_service_id_fk FOREIGN KEY (service_id)
      REFERENCES application.service (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT notify_party_id_fk FOREIGN KEY (party_id)
      REFERENCES party.party (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT notify_type_code_fk FOREIGN KEY (relationship_type_code)
      REFERENCES application.notify_relationship_type (code) MATCH SIMPLE
);

COMMENT ON TABLE application.notify
  IS 'Identifies parties to be notified in bulk as well as the relationship the party has with the land affected by the job.
Tags: SOLA State Land Extension, Change History';
COMMENT ON COLUMN application.notify.id IS 'Identifier for the notification.';
COMMENT ON COLUMN application.notify.service_id IS 'Identifier for the service.';
COMMENT ON COLUMN application.notify.party_id IS 'Identifier for the party.';
COMMENT ON COLUMN application.notify.description IS 'The description of the party to notify.';
COMMENT ON COLUMN application.notify.relationship_type_code IS 'The type of relationship between the party and the land affected by the job. One of Owner, Adjoining Owner, Occupier, Adjoining Occupier, Rightholder, Other, etc.';
COMMENT ON COLUMN application.notify.classification_code IS 'SOLA State Land Extension: The security classification for this Notification Party. Only users with the security classification (or a higher classification) will be able to view the record. If null, the record is considered unrestricted.';
COMMENT ON COLUMN application.notify.redact_code IS 'SOLA State Land Extension: The redact classification for this Notification Party. Only users with the redact classification (or a higher classification) will be able to view the record with un-redacted fields. If null, the record is considered unrestricted and no redaction to the record will occur unless bulk redaction classifications have been set for fields of the record.';
COMMENT ON COLUMN application.notify.rowidentifier IS 'Identifies the all change records for the row in the notify_historic table';
COMMENT ON COLUMN application.notify.rowversion IS 'Sequential value indicating the number of times this row has been modified.';
COMMENT ON COLUMN application.notify.change_action IS 'Indicates if the last data modification action that occurred to the row was insert (i), update (u) or delete (d).';
COMMENT ON COLUMN application.notify.change_user IS 'The user id of the last person to modify the row.';
COMMENT ON COLUMN application.notify.change_time IS 'The date and time the row was last modified.';

CREATE INDEX notify_index_on_rowidentifier
  ON application.notify
  USING btree
  (rowidentifier COLLATE pg_catalog."default");
  
CREATE INDEX notify_index_on_service_id
  ON application.notify
  USING btree
  (service_id COLLATE pg_catalog."default");
  
CREATE INDEX notify_index_on_party_id
  ON application.notify
  USING btree
  (party_id COLLATE pg_catalog."default");

CREATE TRIGGER __track_changes
  BEFORE INSERT OR UPDATE
  ON application.notify
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_changes();

CREATE TRIGGER __track_history
  AFTER UPDATE OR DELETE
  ON application.notify
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_history();


CREATE TABLE application.notify_historic
(  
  id character varying(40),
  service_id character varying(40), 
  party_id character varying(40), 
  relationship_type_code character varying(20),
  description text,
  classification_code character varying(20),
  redact_code character varying(20),
  rowidentifier character varying(40), 
  rowversion integer NOT NULL DEFAULT 0,
  change_action character(1),
  change_user character varying(50),
  change_time timestamp without time zone,
  change_time_valid_until timestamp without time zone NOT NULL DEFAULT now());

COMMENT ON TABLE application.notify_historic
  IS 'History table for the application.notify table';

CREATE INDEX notify_historic_index_on_rowidentifier
  ON application.notify_historic
  USING btree
  (rowidentifier COLLATE pg_catalog."default");
  
 
-- *** notify_uses_source 
CREATE TABLE application.notify_uses_source
(
  notify_id character varying(40) NOT NULL,
  source_id character varying(40) NOT NULL, 
  rowidentifier character varying(40) NOT NULL DEFAULT uuid_generate_v1(), 
  rowversion integer NOT NULL DEFAULT 0, 
  change_action character(1) NOT NULL DEFAULT 'i'::bpchar, 
  change_user character varying(50),
  change_time timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT notify_uses_source_pkey PRIMARY KEY (notify_id, source_id),
  CONSTRAINT notify_uses_source_notify_id_fk FOREIGN KEY (notify_id)
      REFERENCES application.notify (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT notify_uses_source_source_id_fk FOREIGN KEY (source_id)
      REFERENCES source.source (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
);


COMMENT ON TABLE application.notify_uses_source
  IS 'Links the notification parties to the sources (a.k.a. documents) genreated for the bulk notification. 
Tags: FLOSS SOLA Extension, Change History';
COMMENT ON COLUMN application.notify_uses_source.notify_id IS 'Identifier for the notification party the record is associated to.';
COMMENT ON COLUMN application.notify_uses_source.source_id IS 'Identifier of the source associated to the application.';
COMMENT ON COLUMN application.notify_uses_source.rowidentifier IS 'Identifies the all change records for the row in the objection_uses_source_historic table';
COMMENT ON COLUMN application.notify_uses_source.rowversion IS 'Sequential value indicating the number of times this row has been modified.';
COMMENT ON COLUMN application.notify_uses_source.change_action IS 'Indicates if the last data modification action that occurred to the row was insert (i), update (u) or delete (d).';
COMMENT ON COLUMN application.notify_uses_source.change_user IS 'The user id of the last person to modify the row.';
COMMENT ON COLUMN application.notify_uses_source.change_time IS 'The date and time the row was last modified.';

CREATE INDEX notify_uses_source_notify_id_fk_ind
  ON application.notify_uses_source
  USING btree
  (notify_id COLLATE pg_catalog."default");

CREATE INDEX notify_uses_source_index_on_rowidentifier
  ON application.notify_uses_source
  USING btree
  (rowidentifier COLLATE pg_catalog."default");

CREATE INDEX notify_uses_source_source_id_fk_ind
  ON application.notify_uses_source
  USING btree
  (source_id COLLATE pg_catalog."default");

CREATE TRIGGER __track_changes
  BEFORE INSERT OR UPDATE
  ON application.notify_uses_source
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_changes();

CREATE TRIGGER __track_history
  AFTER UPDATE OR DELETE
  ON application.notify_uses_source
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_history();
  
 
CREATE TABLE application.notify_uses_source_historic
(
  notify_id character varying(40),
  source_id character varying(40),
  rowidentifier character varying(40),
  rowversion integer,
  change_action character(1),
  change_user character varying(50),
  change_time timestamp without time zone,
  change_time_valid_until timestamp without time zone NOT NULL DEFAULT now()
);

CREATE INDEX notify_uses_source_historic_index_on_rowidentifier
  ON application.notify_uses_source_historic
  USING btree
  (rowidentifier COLLATE pg_catalog."default");
  
  
 -- *** notify_property
CREATE TABLE application.notify_property
(
  notify_id character varying(40) NOT NULL,
  ba_unit_id character varying(40) NOT NULL, 
  rowidentifier character varying(40) NOT NULL DEFAULT uuid_generate_v1(), 
  rowversion integer NOT NULL DEFAULT 0, 
  change_action character(1) NOT NULL DEFAULT 'i'::bpchar, 
  change_user character varying(50),
  change_time timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT notifiy_property_pkey PRIMARY KEY (notify_id, ba_unit_id),
  CONSTRAINT notify_property_notify_id_fk FOREIGN KEY (notify_id)
      REFERENCES application.notify (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT notify_property_ba_unit_id_fk FOREIGN KEY (ba_unit_id)
      REFERENCES administrative.ba_unit (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
);


COMMENT ON TABLE application.notify_property
  IS 'Identifies the properties (a.k.a. Ba Units) this notification party is related to. 
Tags: FLOSS SOLA Extension, Change History';
COMMENT ON COLUMN application.notify_property.notify_id IS 'Identifier for the notification party the record is associated to.';
COMMENT ON COLUMN application.notify_property.ba_unit_id IS 'Identifier of the property associated to the objection.';
COMMENT ON COLUMN application.notify_property.rowidentifier IS 'Identifies the all change records for the row in the notify_property_historic table';
COMMENT ON COLUMN application.notify_property.rowversion IS 'Sequential value indicating the number of times this row has been modified.';
COMMENT ON COLUMN application.notify_property.change_action IS 'Indicates if the last data modification action that occurred to the row was insert (i), update (u) or delete (d).';
COMMENT ON COLUMN application.notify_property.change_user IS 'The user id of the last person to modify the row.';
COMMENT ON COLUMN application.notify_property.change_time IS 'The date and time the row was last modified.';

CREATE INDEX notify_property_notify_id_fk_ind
  ON application.notify_property
  USING btree
  (notify_id COLLATE pg_catalog."default");

CREATE INDEX notify_property_index_on_rowidentifier
  ON application.notify_property
  USING btree
  (rowidentifier COLLATE pg_catalog."default");

CREATE INDEX notify_property_ba_unit_id_fk_ind
  ON application.notify_property
  USING btree
  (ba_unit_id COLLATE pg_catalog."default");

CREATE TRIGGER __track_changes
  BEFORE INSERT OR UPDATE
  ON application.notify_property
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_changes();

CREATE TRIGGER __track_history
  AFTER UPDATE OR DELETE
  ON application.notify_property
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_history();
 
CREATE TABLE application.notify_property_historic
(
  notify_id character varying(40),
  ba_unit_id character varying(40),
  rowidentifier character varying(40),
  rowversion integer,
  change_action character(1),
  change_user character varying(50),
  change_time timestamp without time zone,
  change_time_valid_until timestamp without time zone NOT NULL DEFAULT now()
);

CREATE INDEX notify_property_historic_index_on_rowidentifier
  ON application.notify_property_historic
  USING btree
  (rowidentifier COLLATE pg_catalog."default");