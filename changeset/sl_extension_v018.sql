-- Add Notified status to negotiate_status and delete presented status
DELETE FROM application.negotiate_status WHERE code IN ('presented', 'notified', 'agreed'); 
DELETE FROM application.negotiate_type  WHERE code IN ('lease'); 
INSERT INTO application.negotiate_status (code, display_value, description, status)
VALUES ('notified', 'Notified', 'The purchaser has notified or presented an offer to the vendor for their consideration.', 'c'); 

UPDATE application.negotiate_type 
SET    display_value = 'Open Market'
WHERE  code = 'open'; 
INSERT INTO application.negotiate_type (code, display_value, description, status)
VALUES ('lease', 'Lease', 'The negotiation in relation to leasing rather purchasing the property.', 'c'); 

--- ***  Revise columns in the negotiate table using drop and re-create
DROP TABLE IF EXISTS application.negotiate_uses_source;
DROP TABLE IF EXISTS application.negotiate_uses_source_historic;;
DROP TABLE IF EXISTS application.negotiate;
DROP TABLE IF EXISTS application.negotiate_historic;

-- *** negotiate
CREATE TABLE application.negotiate
(  
  id character varying(40) NOT NULL,
  service_id character varying(40) NOT NULL, 
  ba_unit_id character varying(40) NOT NULL, 
  initial_amount numeric(29,2) DEFAULT 0,
  final_amount numeric(29,2) DEFAULT 0,
  notification_date timestamp without time zone, 
  type_code character varying(20),
  status_code character varying(20),
  description text,  
  classification_code character varying(20),
  redact_code character varying(20),
  rowidentifier character varying(40) NOT NULL DEFAULT uuid_generate_v1(), 
  rowversion integer NOT NULL DEFAULT 0,
  change_action character(1) NOT NULL DEFAULT 'i'::bpchar,
  change_user character varying(50),
  change_time timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT negotiate_pkey PRIMARY KEY (id),
  CONSTRAINT negotiate_service_id_fk FOREIGN KEY (service_id)
      REFERENCES application.service (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT negotiate_ba_unit_id_fk FOREIGN KEY (ba_unit_id)
      REFERENCES administrative.ba_unit (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT negotiate_type_code_fk FOREIGN KEY (type_code)
      REFERENCES application.negotiate_type (code) MATCH SIMPLE,
  CONSTRAINT negotiate_status_code_fk FOREIGN KEY (status_code)
      REFERENCES application.negotiate_status (code) MATCH SIMPLE
);

COMMENT ON TABLE application.negotiate
  IS 'Summarizes details of the negotiation between the state and the landholder in relation to a property being acquired or disposed by the state.
Tags: SOLA State Land Extension, Change History';
COMMENT ON COLUMN application.negotiate.id IS 'Identifier for the notification.';
COMMENT ON COLUMN application.negotiate.service_id IS 'Identifier for the service.';
COMMENT ON COLUMN application.negotiate.ba_unit_id IS 'Identifier for the ba_unit (a.k.a. property).';
COMMENT ON COLUMN application.negotiate.description IS 'General details related to the negotiation such as a summary of any specific conditions, etc.';
COMMENT ON COLUMN application.negotiate.type_code IS 'The type of negotiation. One of Open or Compulsory, etc.';
COMMENT ON COLUMN application.negotiate.status_code IS 'The status of the negotiation. Indicates the stage of the negotiation process. One of Pending, Presented, Negotiating, Rejected, Withdrawn, Agreed, Completed, etc.';
COMMENT ON COLUMN application.negotiate.notification_date IS 'The date the land holder is notified of the initial offer and negotiation begins. This date can be used to calculate when the offer expires or when responses are required, etc.';
COMMENT ON COLUMN application.negotiate.initial_amount IS 'The initial amount offered for the property to start the negotiation. Usually set based on valuations that have been undertaken.';
COMMENT ON COLUMN application.negotiate.final_amount IS 'The final amount resulting from the negotiation.';
COMMENT ON COLUMN application.negotiate.classification_code IS 'SOLA State Land Extension: The security classification for this Negotiation. Only users with the security classification (or a higher classification) will be able to view the record. If null, the record is considered unrestricted.';
COMMENT ON COLUMN application.negotiate.redact_code IS 'SOLA State Land Extension: The redact classification for this Negotiation. Only users with the redact classification (or a higher classification) will be able to view the record with un-redacted fields. If null, the record is considered unrestricted and no redaction to the record will occur unless bulk redaction classifications have been set for fields of the record.';
COMMENT ON COLUMN application.negotiate.rowidentifier IS 'Identifies the all change records for the row in the negotiate_historic table';
COMMENT ON COLUMN application.negotiate.rowversion IS 'Sequential value indicating the number of times this row has been modified.';
COMMENT ON COLUMN application.negotiate.change_action IS 'Indicates if the last data modification action that occurred to the row was insert (i), update (u) or delete (d).';
COMMENT ON COLUMN application.negotiate.change_user IS 'The user id of the last person to modify the row.';
COMMENT ON COLUMN application.negotiate.change_time IS 'The date and time the row was last modified.';

CREATE INDEX negotiate_index_on_rowidentifier
  ON application.negotiate
  USING btree
  (rowidentifier COLLATE pg_catalog."default");
  
CREATE INDEX negotiate_index_on_service_id
  ON application.negotiate
  USING btree
  (service_id COLLATE pg_catalog."default");
  
CREATE INDEX negotiate_index_on_ba_unit_id
  ON application.negotiate
  USING btree
  (ba_unit_id COLLATE pg_catalog."default");

CREATE TRIGGER __track_changes
  BEFORE INSERT OR UPDATE
  ON application.negotiate
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_changes();

CREATE TRIGGER __track_history
  AFTER UPDATE OR DELETE
  ON application.negotiate
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_history();


CREATE TABLE application.negotiate_historic
(  
  id character varying(40),
  service_id character varying(40), 
  ba_unit_id character varying(40), 
  initial_amount numeric(29,2) DEFAULT 0,
  final_amount numeric(29,2) DEFAULT 0,
  notification_date timestamp without time zone, 
  type_code character varying(20),
  status_code character varying(20),
  description text,  
  classification_code character varying(20),
  redact_code character varying(20),
  rowidentifier character varying(40), 
  rowversion integer NOT NULL DEFAULT 0,
  change_action character(1),
  change_user character varying(50),
  change_time timestamp without time zone,
  change_time_valid_until timestamp without time zone NOT NULL DEFAULT now());

COMMENT ON TABLE application.negotiate_historic
  IS 'History table for the application.negotiate table';

CREATE INDEX negotiate_historic_index_on_rowidentifier
  ON application.negotiate_historic
  USING btree
  (rowidentifier COLLATE pg_catalog."default");
  
 
-- *** negotiate_uses_source 
CREATE TABLE application.negotiate_uses_source
(
  negotiate_id character varying(40) NOT NULL,
  source_id character varying(40) NOT NULL, 
  rowidentifier character varying(40) NOT NULL DEFAULT uuid_generate_v1(), 
  rowversion integer NOT NULL DEFAULT 0, 
  change_action character(1) NOT NULL DEFAULT 'i'::bpchar, 
  change_user character varying(50),
  change_time timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT negotiate_uses_source_pkey PRIMARY KEY (negotiate_id, source_id),
  CONSTRAINT negotiate_uses_source_negotiate_id_fk FOREIGN KEY (negotiate_id)
      REFERENCES application.negotiate (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT negotiate_uses_source_source_id_fk FOREIGN KEY (source_id)
      REFERENCES source.source (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
);


COMMENT ON TABLE application.negotiate_uses_source
  IS 'Links sources (a.k.a. documents) to the applicable negotiation records. 
Tags: FLOSS SOLA Extension, Change History';
COMMENT ON COLUMN application.negotiate_uses_source.negotiate_id IS 'Identifier for the negotiation the record is associated to.';
COMMENT ON COLUMN application.negotiate_uses_source.source_id IS 'Identifier of the source associated to the negotiation.';
COMMENT ON COLUMN application.negotiate_uses_source.rowidentifier IS 'Identifies the all change records for the row in the negotiate_uses_source table';
COMMENT ON COLUMN application.negotiate_uses_source.rowversion IS 'Sequential value indicating the number of times this row has been modified.';
COMMENT ON COLUMN application.negotiate_uses_source.change_action IS 'Indicates if the last data modification action that occurred to the row was insert (i), update (u) or delete (d).';
COMMENT ON COLUMN application.negotiate_uses_source.change_user IS 'The user id of the last person to modify the row.';
COMMENT ON COLUMN application.negotiate_uses_source.change_time IS 'The date and time the row was last modified.';

CREATE INDEX negotiate_uses_source_negotiate_id_fk_ind
  ON application.negotiate_uses_source
  USING btree
  (negotiate_id COLLATE pg_catalog."default");

CREATE INDEX negotiate_uses_source_index_on_rowidentifier
  ON application.negotiate_uses_source
  USING btree
  (rowidentifier COLLATE pg_catalog."default");

CREATE INDEX negotiate_uses_source_source_id_fk_ind
  ON application.negotiate_uses_source
  USING btree
  (source_id COLLATE pg_catalog."default");

CREATE TRIGGER __track_changes
  BEFORE INSERT OR UPDATE
  ON application.negotiate_uses_source
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_changes();

CREATE TRIGGER __track_history
  AFTER UPDATE OR DELETE
  ON application.negotiate_uses_source
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_history();
  
 
CREATE TABLE application.negotiate_uses_source_historic
(
  negotiate_id character varying(40),
  source_id character varying(40),
  rowidentifier character varying(40),
  rowversion integer,
  change_action character(1),
  change_user character varying(50),
  change_time timestamp without time zone,
  change_time_valid_until timestamp without time zone NOT NULL DEFAULT now()
);

CREATE INDEX negotiate_uses_source_historic_index_on_rowidentifier
  ON application.negotiate_uses_source_historic
  USING btree
  (rowidentifier COLLATE pg_catalog."default");

  
-- *** Add request_display_group table and display order to
  --     request_types  
 ALTER TABLE application.request_type 
  DROP COLUMN IF EXISTS  display_group_name,
  DROP COLUMN IF EXISTS  display_group_code,
  DROP COLUMN IF EXISTS  display_order,
  DROP CONSTRAINT IF EXISTS  request_type_display_group_code_fk;
  
DROP TABLE IF EXISTS application.request_display_group; 
  
CREATE TABLE application.request_display_group
(
  code character varying(20) NOT NULL, 
  display_value character varying(250) NOT NULL, 
  description text, 
  status character(1) NOT NULL, 
  CONSTRAINT request_display_group_pkey PRIMARY KEY (code),
  CONSTRAINT request_display_group_display_value_unique UNIQUE (display_value)
);

COMMENT ON TABLE application.request_display_group
  IS 'Code list identifying the display groups that can be used for request types
Tags: SOLA State Land Extension, Reference Table';
COMMENT ON COLUMN application.request_display_group.code IS 'The code for the request display group.';
COMMENT ON COLUMN application.request_display_group.display_value IS 'Displayed value of the request display group.';
COMMENT ON COLUMN application.request_display_group.description IS 'Description of the request display group.';
COMMENT ON COLUMN application.request_display_group.status IS 'Status of the negotiation type (c - current, x - no longer valid).';

INSERT INTO application.request_display_group (code, display_value, description, status)
VALUES ('parcels', 'Parcels', 'Parcels display group.', 'c'); 
INSERT INTO application.request_display_group (code, display_value, description, status)
VALUES ('property', 'Property', 'Property display group.', 'c'); 
INSERT INTO application.request_display_group (code, display_value, description, status)
VALUES ('job', 'Job', 'Job display group.', 'c');

ALTER TABLE application.request_type 
  ADD COLUMN display_group_code character varying(20),
  ADD COLUMN display_order int,
  ADD CONSTRAINT request_type_display_group_code_fk FOREIGN KEY (display_group_code)
      REFERENCES application.request_display_group (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE; 
	  
UPDATE application.request_type 
SET    display_group_code = 'parcels'
WHERE  code IN ('changeSLParcels');

UPDATE application.request_type 
SET    display_group_code = 'property'
WHERE  code IN ('cancelInterest', 'disposeSLProperty', 'recordStateLand', 
                'maintainStateLand', 'slValuation' );
				
UPDATE application.request_type 
SET    display_group_code = 'job'
WHERE  code IN ('checklist', 'slNegotiate', 'slObjection', 
                'slNotify', 'publicDisplayMap', 'publicDisplay' );
				
UPDATE application.request_type SET display_order = 10 WHERE code IN ('changeSLParcels');
UPDATE application.request_type SET display_order = 20 WHERE code IN ('recordStateLand');
UPDATE application.request_type SET display_order = 30 WHERE code IN ('maintainStateLand');
UPDATE application.request_type SET display_order = 40 WHERE code IN ('slValuation');
UPDATE application.request_type SET display_order = 50 WHERE code IN ('cancelInterest');
UPDATE application.request_type SET display_order = 60 WHERE code IN ('disposeSLProperty');
UPDATE application.request_type SET display_order = 70 WHERE code IN ('checklist');
UPDATE application.request_type SET display_order = 80 WHERE code IN ('publicDisplayMap');
UPDATE application.request_type SET display_order = 90 WHERE code IN ('publicDisplay');
UPDATE application.request_type SET display_order = 100 WHERE code IN ('slNotify');
UPDATE application.request_type SET display_order = 110 WHERE code IN ('slNegotiate');
UPDATE application.request_type SET display_order = 120 WHERE code IN ('slObjection');



-- Function to determine the formatted name for the property
DROP FUNCTION IF EXISTS administrative.get_property_name(character varying);
CREATE OR REPLACE FUNCTION administrative.get_property_name(prop_id character varying)
  RETURNS character varying AS
$BODY$ 
BEGIN
    RETURN 
	  (SELECT CASE WHEN type_code = 'stateLand' THEN name_firstpart || name_lastpart
	              ELSE name_firstpart || '/' || name_lastpart END
	  FROM  administrative.ba_unit
      WHERE id = prop_id);
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION administrative.get_property_name(character varying)
  OWNER TO postgres;
COMMENT ON FUNCTION administrative.get_property_name(character varying) IS 'Returns the formatted name for the property';



DROP FUNCTION IF EXISTS application.get_application_documents(character varying);
CREATE OR REPLACE FUNCTION application.get_application_documents(app_id character varying)
  RETURNS TABLE (doc_id character varying(40)) AS
$BODY$ 
BEGIN 
  RETURN QUERY
	SELECT doc.source_id AS doc_id
	FROM   application.application_uses_source doc
	WHERE  application_id = app_id
	UNION  
	SELECT doc.source_id AS doc_id
	FROM   application.negotiate_uses_source doc,
		   application.negotiate n,
		   application.service ser
	WHERE  ser.application_id = app_id
	AND    n.service_id = ser.id
	AND    doc.negotiate_id = n.id
	UNION  
	SELECT doc.source_id AS doc_id
	FROM   application.notify_uses_source doc,
		   application.notify n,
		   application.service ser
	WHERE  ser.application_id = app_id
	AND    n.service_id = ser.id
	AND    doc.notify_id = n.id
	UNION  
	SELECT doc.source_id AS doc_id
	FROM   application.objection_uses_source doc,
		   application.objection o,
		   application.service ser
	WHERE  ser.application_id = app_id
	AND    o.service_id = ser.id
	AND    doc.objection_id = o.id
	UNION  
	SELECT doc.source_id AS doc_id
	FROM   application.public_display_item_uses_source doc,
		   application.public_display_item p,
		   application.service ser
	WHERE  ser.application_id = app_id
	AND    p.service_id = ser.id
	AND    doc.public_display_item_id = p.id
	UNION  
	SELECT doc.source_id AS doc_id
	FROM   application.public_display_item_uses_source doc,
		   application.public_display_item p,
		   application.service ser
	WHERE  ser.application_id = app_id
	AND    p.service_id = ser.id
	AND    doc.public_display_item_id = p.id
	UNION  
	SELECT doc.source_id AS doc_id
	FROM   administrative.source_describes_ba_unit doc,
		   administrative.ba_unit ba,
		   transaction.transaction t,
		   application.service ser
	WHERE  ser.application_id = app_id
	AND    t.from_service_id = ser.id
	AND    ba.transaction_id = t.id
	AND    doc.ba_unit_id = ba.id	
	UNION  
	SELECT doc.source_id AS doc_id
	FROM   administrative.source_describes_notation doc,
		   administrative.notation n,
		   transaction.transaction t,
		   application.service ser
	WHERE  ser.application_id = app_id
	AND    t.from_service_id = ser.id
	AND    n.transaction_id = t.id
	AND    doc.notation_id = n.id	
	UNION  
	SELECT doc.source_id AS doc_id
	FROM   administrative.source_describes_rrr doc,
		   administrative.rrr r,
		   transaction.transaction t,
		   application.service ser
	WHERE  ser.application_id = app_id
	AND    t.from_service_id = ser.id
	AND    r.transaction_id = t.id
	AND    doc.rrr_id = r.id
	UNION  
	SELECT doc.source_id AS doc_id
	FROM   administrative.source_describes_valuation doc,
		   administrative.valuation v,
		   transaction.transaction t,
		   application.service ser
	WHERE  ser.application_id = app_id
	AND    t.from_service_id = ser.id
	AND    v.transaction_id = t.id
	AND    doc.valuation_id = v.id;	
	END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION application.get_application_documents(character varying)
  OWNER TO postgres;
COMMENT ON FUNCTION application.get_application_documents(character varying) IS 'Returns the id for all documents (a.k.a. sources) that are associated with an application/job either directly or indirectly';



-- *** State Land Parcel Business Rules
DELETE FROM system.br_validation WHERE target_code = 'state_land'; 
DELETE FROM system.br_validation_target_type WHERE code = 'state_land'; 

INSERT INTO system.br_validation_target_type (code, display_value, status, description)
VALUES('state_land', 'State Land Parcel', 'c', 'Identifies business rules to execute when creating or changing State Land Parcels. These rules accept the transaction id as a parameter.'); 

-- *** Updates to existing rules

-- cadastre-object-check-name
DELETE FROM system.br_validation WHERE br_id = 'cadastre-object-check-name';

UPDATE system.br 
SET description = 'Updated for State Land BR-5',
    feedback = 'Parcel name(s) inconsistent with naming convention; _$parcel_list '
WHERE id = 'cadastre-object-check-name'; 

UPDATE system.br_definition SET body = 
  'SELECT  FALSE AS vl,
           string_agg(COALESCE(co.name_firstpart, '''') || '' '' || COALESCE(co.name_lastpart, ''''), '', '') AS _$parcel_list
   FROM    cadastre.cadastre_object co
   WHERE   co.transaction_id = #{id} 
   AND     co.type_code = ''stateLand''
   AND     cadastre.cadastre_object_name_is_valid(TRIM(co.name_firstpart), TRIM(co.name_lastpart)) = FALSE
   GROUP BY vl'
WHERE br_id = 'cadastre-object-check-name'; 

INSERT INTO system.br_validation(
            br_id, target_code, target_application_moment, target_service_moment, 
            target_reg_moment, target_request_type_code, target_rrr_type_code, 
            severity_code, order_of_execution)
VALUES ('cadastre-object-check-name', 'state_land', NULL, NULL, 'pending', NULL, NULL, 'medium', 665);

INSERT INTO system.br_validation(
            br_id, target_code, target_application_moment, target_service_moment, 
            target_reg_moment, target_request_type_code, target_rrr_type_code, 
            severity_code, order_of_execution)
VALUES ('cadastre-object-check-name', 'state_land', NULL, NULL, 'current', NULL, NULL, 'medium', 605);


-- ba_unit-has-a-valid-primary-right
UPDATE system.br 
SET description = 'Updated for State Land BR-1',
    feedback = '_$property_name must have one State Landholder interest or one Owner interest.'
WHERE id = 'ba_unit-has-a-valid-primary-right'; 

UPDATE system.br_definition SET body = 
    'SELECT (COUNT(*) = 1) AS vl, 
	 administrative.get_property_name(ba.id) AS _$property_name
	 FROM administrative.rrr rr1 
	 INNER JOIN administrative.ba_unit ba ON (rr1.ba_unit_id = ba.id)
	 INNER JOIN transaction.transaction tn ON (rr1.transaction_id = tn.id)
	 INNER JOIN application.service sv ON ((tn.from_service_id = sv.id) 
	      AND (sv.request_type_code NOT IN (''cancelProperty'', ''disposeSLProperty'')))
 WHERE ba.id = #{id}
 AND rr1.status_code != ''cancelled''
 AND rr1.is_primary
 AND rr1.type_code IN (''ownership'', ''apartment'', ''stateOwnership'', ''lease'')
 GROUP BY ba.id '
WHERE br_id = 'ba_unit-has-a-valid-primary-right';


-- ba_unit-spatial_unit-area-comparison
UPDATE system.br 
SET description = 'Updated for State Land BR-2',
    feedback = 'The difference between the property area (_$property_area) and the parcel area (_$parcel_area) must be less than 1%'
WHERE id = 'ba_unit-spatial_unit-area-comparison'; 

UPDATE system.br_definition SET body = 
'WITH parcel_area AS (
SELECT COALESCE(SUM(sva.size),0) AS p_area
FROM   administrative.ba_unit_contains_spatial_unit bas,
       cadastre.cadastre_object co,
       cadastre.spatial_value_area sva
WHERE  bas.ba_unit_id = #{id}
AND    co.id = bas.spatial_unit_id
AND    co.status_code != ''historic''
AND    sva.spatial_unit_id = co.id
AND    sva.type_code = ''officialArea''
AND    NOT EXISTS (SELECT cot.cadastre_object_id
                   FROM cadastre.cadastre_object_target cot
                   WHERE cot.cadastre_object_id = co.id))
SELECT ABS((COALESCE(baa.size, 0) - parea)) < (p_area * 0.01) AS vl,
       TRIM(cadastre.format_area_metric(p_area)) AS _$parcel_area,
       TRIM(cadastre.format_area_metric(COALESCE(baa.size, 0))) AS _$property_area
FROM   administrative.ba_unit ba LEFT OUTER JOIN administrative.ba_unit_area baa 
       ON ba.id = baa.ba_unit_id AND baa.type_code = ''officialArea'',
       parcel_area
WHERE  ba.id = #{id}'
WHERE br_id = 'ba_unit-spatial_unit-area-comparison'; 

-- area-check-percentage-newofficialarea-calculatednewarea
DELETE FROM system.br_validation WHERE br_id = 'area-check-percentage-newofficialarea-calculatednewarea';

UPDATE system.br 
SET description = 'Updated for State Land BR-3',
    feedback = 'The difference between the official parcel area and its calculated area should be less than 1%; _$parcel_list'
WHERE id = 'area-check-percentage-newofficialarea-calculatednewarea'; 

UPDATE system.br_definition SET body = 
'WITH parcel_area AS (
SELECT co.id AS co_id,
       COALESCE(sva.size,0) AS p_area,
       COALESCE(st_area(geom_polygon),0) AS c_area,
       ABS(COALESCE(sva.size,0) - COALESCE(st_area(geom_polygon),0)) 
           <  (COALESCE(sva.size,0) * 0.01) AS within_tolerance
FROM   cadastre.cadastre_object co LEFT OUTER JOIN cadastre.spatial_value_area sva
       ON co.id = sva.spatial_unit_id AND sva.type_code = ''officialArea''
WHERE  co.transaction_id = #{id})
SELECT COUNT(*) = 0 AS vl,
       string_agg(COALESCE(co.name_firstpart, '''') || '' '' || COALESCE(co.name_lastpart, '''') 
       || '' (Calc:'' || TRIM(cadastre.format_area_metric(c_area::NUMERIC)) || '')'', '', '') AS _$parcel_list
FROM   cadastre.cadastre_object co, 
       parcel_area
WHERE  within_tolerance = FALSE
AND    co.id = co_id'
WHERE br_id = 'area-check-percentage-newofficialarea-calculatednewarea'; 

INSERT INTO system.br_validation(
            br_id, target_code, target_application_moment, target_service_moment, 
            target_reg_moment, target_request_type_code, target_rrr_type_code, 
            severity_code, order_of_execution)
VALUES ('area-check-percentage-newofficialarea-calculatednewarea', 'state_land', NULL, NULL, 'pending', NULL, NULL, 'warning', 620);

INSERT INTO system.br_validation(
            br_id, target_code, target_application_moment, target_service_moment, 
            target_reg_moment, target_request_type_code, target_rrr_type_code, 
            severity_code, order_of_execution)
VALUES ('area-check-percentage-newofficialarea-calculatednewarea', 'state_land', NULL, NULL, 'current', NULL, NULL, 'warning', 610);

-- new-cadastre-objects-do-not-overlap
DELETE FROM system.br_validation WHERE br_id = 'new-cadastre-objects-do-not-overlap';

UPDATE system.br 
SET description = 'Updated for State Land BR-4',
    feedback = 'New parcel polygons must not overlap'
WHERE id = 'new-cadastre-objects-do-not-overlap';  

INSERT INTO system.br_validation(
            br_id, target_code, target_application_moment, target_service_moment, 
            target_reg_moment, target_request_type_code, target_rrr_type_code, 
            severity_code, order_of_execution)
VALUES ('new-cadastre-objects-do-not-overlap', 'state_land', NULL, NULL, 'pending', NULL, NULL, 'warning', 60);

INSERT INTO system.br_validation(
            br_id, target_code, target_application_moment, target_service_moment, 
            target_reg_moment, target_request_type_code, target_rrr_type_code, 
            severity_code, order_of_execution)
VALUES ('new-cadastre-objects-do-not-overlap', 'state_land', NULL, NULL, 'current', NULL, NULL, 'medium', 480);

-- ba_unit-has-cadastre-object
UPDATE system.br 
SET feedback = 'Property must have an associated parcel'
WHERE id = 'ba_unit-has-cadastre-object';

-- application-br4-check-sources-date-not-in-the-future
UPDATE system.br 
SET feedback = 'Document date must not be in the future; _$doc_list'
WHERE id = 'application-br4-check-sources-date-not-in-the-future';

UPDATE system.br_definition SET body = 
' SELECT COUNT(*) = 0 AS vl,
       COALESCE(string_agg(s.la_nr, '', ''), '''') AS _$doc_list
 FROM  source.source s, 
       application.get_application_documents(#{id}) docs
 WHERE s.id = docs.doc_id
 AND   s.recordation < NOW() '
WHERE br_id = 'application-br4-check-sources-date-not-in-the-future';

-- application-br7-check-sources-have-documents
DELETE FROM system.br_validation WHERE br_id = 'application-br7-check-sources-have-documents';

UPDATE system.br 
SET description = 'Updated for State Land',
    feedback = 'Documents lodged with a job should have a scanned image file (or other source file) attached; _$doc_list'
WHERE id = 'application-br7-check-sources-have-documents';  

UPDATE system.br_definition SET body = 
' SELECT COUNT(*) = 0 AS vl,
       COALESCE(string_agg(s.la_nr, '', ''), '''') AS _$doc_list
 FROM  source.source s, 
       application.get_application_documents(#{id}) docs
 WHERE s.id = docs.doc_id
 AND   s.ext_archive_id IS NULL '
WHERE br_id = 'application-br7-check-sources-have-documents'; 

INSERT INTO system.br_validation(
            br_id, target_code, target_application_moment, target_service_moment, 
            target_reg_moment, target_request_type_code, target_rrr_type_code, 
            severity_code, order_of_execution)
VALUES ('application-br7-check-sources-have-documents', 'application', 'validate', NULL, NULL, NULL, NULL, 'warning', 570);

-- application-br8-check-has-services
UPDATE system.br 
SET feedback = 'A job must have at least one task'
WHERE id = 'application-br8-check-has-services';

-- application-on-approve-check-services-status
UPDATE system.br 
SET feedback = 'All tasks in the job must have the status Cancelled or Completed.'
WHERE id = 'application-on-approve-check-services-status';

-- cancel-title-check-rrr-cancelled
UPDATE system.br 
SET feedback = 'All current interests on the property being disposed must be extinguished by this job'
WHERE id = 'cancel-title-check-rrr-cancelled'; 

UPDATE system.br_definition SET body = 
' WITH 	pending_property_rrr AS (SELECT DISTINCT ON(rr1.nr) rr1.nr FROM administrative.rrr rr1 
				INNER JOIN transaction.transaction tn ON (rr1.transaction_id = tn.id)
				INNER JOIN application.service sv1 ON (tn.from_service_id = sv1.id) 
				WHERE sv1.application_id = #{id}
				AND rr1.status_code = ''pending''),
								
	target_title	AS	(SELECT prp.ba_unit_id AS liveTitle FROM application.application_property prp
				WHERE prp.application_id = #{id}),
				
	cancelPropApp	AS	(SELECT sv3.id AS fhCheck, sv3.request_type_code FROM application.service sv3
				WHERE sv3.application_id = #{id}
				AND sv3.request_type_code IN ( ''cancelProperty'', ''disposeSLProperty'')),
					
	current_rrr AS 		(SELECT DISTINCT ON(rr2.nr) rr2.nr FROM administrative.rrr rr2 
				WHERE rr2.status_code = ''current''
				AND rr2.ba_unit_id IN (SELECT liveTitle FROM target_title)),

	rem_property_rrr AS	(SELECT nr FROM current_rrr WHERE nr NOT IN (SELECT nr FROM pending_property_rrr))
				
SELECT CASE 	WHEN (SELECT (COUNT(*) = 0) FROM cancelPropApp) THEN NULL
		WHEN (SELECT (COUNT(*) = 0) FROM pending_property_rrr) THEN FALSE
		WHEN (SELECT (COUNT(*) = 0) FROM rem_property_rrr) THEN TRUE
		ELSE FALSE
	END AS vl'
WHERE br_id = 'cancel-title-check-rrr-cancelled';

-- rrr-must-have-parties
UPDATE system.br 
SET feedback = 'The _$rrr_type interest on _$property_name must have a rightholder specified'
WHERE id = 'rrr-must-have-parties'; 

UPDATE system.br_definition SET body = 
' SELECT FALSE AS vl,
  COALESCE(get_translation(rt.display_value, #{sql_param_languageCode}), '''') AS _$rrr_type,
  administrative.get_property_name(r.ba_unit_id) AS _$property_name
FROM administrative.rrr r,
     administrative.rrr_type rt
WHERE r.id = #{id} 
AND   rt.code = r.type_code 
AND   rt.party_required = TRUE
AND   NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = r.id)'
WHERE br_id = 'rrr-must-have-parties'; 

-- Unlink SOLA BR's that do not apply to State Land
DELETE FROM system.br_validation WHERE br_id IN ('newtitle-br22-check-different-owners', 
'ba_unit-has-compatible-cadastre-object', 'target-ba_unit-check-if-pending',
'app-allowable-primary-right-for-new-title', 'app-check-title-ref',
'app-current-caveat-and-no-remove-or-vary', 'app-other-app-with-caveat',
'app-title-has-primary-right', 'applicant-name-to-owner-name-check',
'application-approve-cancel-old-titles', 'ba_unit-spatial_unit-area-comparison',
'application-baunit-has-parcels',  'application-br1-check-required-sources-are-present', 
'application-br2-check-title-documents-not-old', 'application-br3-check-properties-are-not-historic',
'application-br5-check-there-are-front-desk-services', 'application-br6-check-new-title-service-is-needed',
'application-cancel-property-service-before-new-title', 'application-for-new-title-has-cancel-property-service',
'application-not-transferred', 'application-on-approve-check-public-display', 
'application-on-approve-check-services-without-transaction', 'application-on-approve-check-systematic-reg-no-objection',
'application-spatial-unit-not-transferred', 'application-verifies-identification', 
'area-check-percentage-newareas-oldareas', 'ba_unit-has-caveat', 'ba_unit-has-several-mortgages-with-same-rank',
'baunit-has-multiple-mortgages', 'cadastre-redefinition-target-geometries-dont-overlap',
'cadastre-redefinition-union-old-new-the-same', 'current-rrr-for-variation-or-cancellation-check',
'document-supporting-rrr-is-current', 'documents-present', 'mortgage-value-check',
'new-cadastre-objects-present', 'power-of-attorney-owner-check', 'power-of-attorney-service-has-document',
'public-display-check-baunit-has-co', 'public-display-check-complete-status', 'required-sources-are-present',
'rrr-has-pending', 'service-check-no-previous-digital-title-service', 'service-has-person-verification',
'service-on-complete-without-transaction', 'service-title-terminated', 
'source-attach-in-transaction-allowed-type', 'source-attach-in-transaction-no-pendings',
'spatial-unit-group-inside-other-spatial-unit-group', 'spatial-unit-group-name-unique',
'spatial-unit-group-not-overlap', 'survey-points-present', 'target-and-new-union-the-same',
'target-parcels-check-isapolygon', 'target-parcels-check-nopending', 'target-parcels-present');

UPDATE system.br SET description = 'NOT USED BY SOLA STATE LAND'
WHERE id IN ('newtitle-br22-check-different-owners', 
'ba_unit-has-compatible-cadastre-object', 'target-ba_unit-check-if-pending',
'app-allowable-primary-right-for-new-title', 'app-check-title-ref',
'app-current-caveat-and-no-remove-or-vary', 'app-other-app-with-caveat',
'app-title-has-primary-right', 'applicant-name-to-owner-name-check',
'application-approve-cancel-old-titles', 'ba_unit-spatial_unit-area-comparison',
'application-baunit-has-parcels',  'application-br1-check-required-sources-are-present', 
'application-br2-check-title-documents-not-old', 'application-br3-check-properties-are-not-historic',
'application-br5-check-there-are-front-desk-services', 'application-br6-check-new-title-service-is-needed',
'application-cancel-property-service-before-new-title', 'application-for-new-title-has-cancel-property-service',
'application-not-transferred', 'application-on-approve-check-public-display', 
'application-on-approve-check-services-without-transaction', 'application-on-approve-check-systematic-reg-no-objection',
'application-spatial-unit-not-transferred', 'application-verifies-identification', 
'area-check-percentage-newareas-oldareas', 'ba_unit-has-caveat', 'ba_unit-has-several-mortgages-with-same-rank',
'baunit-has-multiple-mortgages', 'cadastre-redefinition-target-geometries-dont-overlap',
'cadastre-redefinition-union-old-new-the-same', 'current-rrr-for-variation-or-cancellation-check',
'document-supporting-rrr-is-current', 'documents-present', 'mortgage-value-check',
'new-cadastre-objects-present', 'power-of-attorney-owner-check', 'power-of-attorney-service-has-document',
'public-display-check-baunit-has-co', 'public-display-check-complete-status', 'required-sources-are-present',
'rrr-has-pending', 'service-check-no-previous-digital-title-service', 'service-has-person-verification',
'service-on-complete-without-transaction', 'service-title-terminated', 
'source-attach-in-transaction-allowed-type', 'source-attach-in-transaction-no-pendings',
'spatial-unit-group-inside-other-spatial-unit-group', 'spatial-unit-group-name-unique',
'spatial-unit-group-not-overlap', 'survey-points-present', 'target-and-new-union-the-same',
'target-parcels-check-isapolygon', 'target-parcels-check-nopending', 'target-parcels-present');

-- *** New Rules

-- New Rule to validate that parcels have a spatial defn
DELETE FROM system.br_validation WHERE br_id = 'ba-unit-has-spatial-parcels'; 
DELETE FROM system.br_definition WHERE br_id = 'ba-unit-has-spatial-parcels';
DELETE FROM system.br WHERE id = 'ba-unit-has-spatial-parcels'; 

INSERT INTO system.br (id, display_name, technical_type_code, feedback, description, technical_description)
VALUES ('ba-unit-has-spatial-parcels', 'ba-unit-has-spatial-parcels', 'sql', 'Parcels on _$property_name have not been mapped; _$parcel_list',
'State Land BR-7', 'Parameters: #{id} (administrative.ba_unit.id)');

INSERT INTO system.br_definition (br_id, active_from, active_until, body)
VALUES ('ba-unit-has-spatial-parcels', '2014-02-20', 'infinity', 
   'SELECT  FALSE AS vl,
            string_agg(COALESCE(co.name_firstpart, '''') || '' '' || COALESCE(co.name_lastpart, ''''), '', '') AS _$parcel_list,
			administrative.get_property_name(ba.id) AS _$property_name
    FROM    administrative.ba_unit ba,
            administrative.ba_unit_contains_spatial_unit bas,
            cadastre.cadastre_object co
    WHERE   ba.id = #{id}
    AND     ba.type_code= ''stateLand''
    AND     bas.ba_unit_id = ba.id
    AND     co.id = bas.spatial_unit_id
    AND     co.geom_polygon IS NULL
    GROUP BY vl, _$property_name');

INSERT INTO system.br_validation(
            br_id, target_code, target_application_moment, target_service_moment, 
            target_reg_moment, target_request_type_code, target_rrr_type_code, 
            severity_code, order_of_execution)
VALUES ('ba-unit-has-spatial-parcels', 'ba_unit', NULL, NULL, 'current', NULL, NULL, 'medium', 800);

-- New Rule to warn the use there are notes that require action on the property
DELETE FROM system.br_validation WHERE br_id = 'ba-unit-has-notes-to-action'; 
DELETE FROM system.br_definition WHERE br_id = 'ba-unit-has-notes-to-action';
DELETE FROM system.br WHERE id = 'ba-unit-has-notes-to-action'; 

INSERT INTO system.br (id, display_name, technical_type_code, feedback, description, technical_description)
VALUES ('ba-unit-has-notes-to-action', 'ba-unit-has-notes-to-action', 'sql', 'Notes on _$property_name require action; _$notes_list',
'State Land BR-6', 'Parameters: #{id} (administrative.ba_unit.id)');

INSERT INTO system.br_definition (br_id, active_from, active_until, body)
VALUES ('ba-unit-has-notes-to-action', '2014-02-20', 'infinity', 
   'SELECT  FALSE AS vl,
            string_agg(COALESCE(note.reference_nr, ''No Ref.#''), '', '') AS _$notes_list,
            administrative.get_property_name(ba.id) AS _$property_name
	FROM    administrative.ba_unit ba,
			administrative.notation note
	WHERE   ba.id = #{id}
	AND     ba.type_code= ''stateLand''
	AND     note.ba_unit_id = ba.id
	AND     note.status_code IN (''actionReqd'', ''actionReqdUrgent'')
	GROUP BY vl, _$property_name');

INSERT INTO system.br_validation(
            br_id, target_code, target_application_moment, target_service_moment, 
            target_reg_moment, target_request_type_code, target_rrr_type_code, 
            severity_code, order_of_execution)
VALUES ('ba-unit-has-notes-to-action', 'ba_unit', NULL, NULL, 'current', NULL, NULL, 'warning', 810);

-- New Rule to validate parcel identifier has not been duplicated
DELETE FROM system.br_validation WHERE br_id = 'parcel-name-duplicated'; 
DELETE FROM system.br_definition WHERE br_id = 'parcel-name-duplicated';
DELETE FROM system.br WHERE id = 'parcel-name-duplicated'; 

INSERT INTO system.br (id, display_name, technical_type_code, feedback, description, technical_description)
VALUES ('parcel-name-duplicated', 'parcel-name-duplicated', 'sql', '_$rule_count duplicated parcel name(s); _$parcel_list',
'State Land BR-5', 'Parameters: #{id} (transaction.transaction.id)');

INSERT INTO system.br_definition (br_id, active_from, active_until, body)
VALUES ('parcel-name-duplicated', '2014-02-20', 'infinity', 
   'WITH dup_parcels AS (
  SELECT DISTINCT co.id AS dup_id
  FROM   cadastre.cadastre_object co,
         cadastre.cadastre_object co_dup
  WHERE  co.transaction_id = #{id}
  AND    TRIM(co.name_firstpart) = TRIM(co_dup.name_firstpart)
  AND    TRIM(co.name_lastpart) = TRIM(co_dup.name_lastpart)
  AND    co_dup.status_code IN (''current'', ''pending'')
  AND    co_dup.type_code = co.type_code
  AND    co_dup.id != co.id
  AND    co_dup.id NOT IN (SELECT cot.cadastre_object_id
                           FROM   cadastre.cadastre_object_target cot
                           WHERE  cot.transaction_id = co.transaction_id))
SELECT COUNT(dup_id) = 0 AS vl,
       COUNT(dup_id) AS _$rule_count,
       CASE WHEN COUNT(dup_id) = 0 THEN ''''
	      ELSE string_agg(COALESCE(name_firstpart, '''') || '' '' || COALESCE(name_lastpart, ''''), '', '') 
	   END AS _$parcel_list
FROM   dup_parcels
       LEFT OUTER JOIN cadastre.cadastre_object ON id = dup_id');

INSERT INTO system.br_validation(
            br_id, target_code, target_application_moment, target_service_moment, 
            target_reg_moment, target_request_type_code, target_rrr_type_code, 
            severity_code, order_of_execution)
VALUES ('parcel-name-duplicated', 'state_land', NULL, NULL, 'pending', NULL, NULL, 'critical', 668);

INSERT INTO system.br_validation(
            br_id, target_code, target_application_moment, target_service_moment, 
            target_reg_moment, target_request_type_code, target_rrr_type_code, 
            severity_code, order_of_execution)
VALUES ('parcel-name-duplicated', 'state_land', NULL, NULL, 'current', NULL, NULL, 'critical', 608);


-- New Rule to warn the user if the final value agreed for a property is more than x% from the initial value. 
DELETE FROM system.br_validation WHERE br_id = 'property-compenstation-comparison'; 
DELETE FROM system.br_definition WHERE br_id = 'property-compenstation-comparison';
DELETE FROM system.br WHERE id = 'property-compenstation-comparison'; 

INSERT INTO system.br (id, display_name, technical_type_code, feedback, description, technical_description)
VALUES ('property-compenstation-comparison', 'property-compenstation-comparison', 'sql', 'Final compenstation is more than %10 above the initial offer; _$property_list', 'State Land BR-9', 'Parameters: #{id} (application.service.id)');

INSERT INTO system.br_definition (br_id, active_from, active_until, body)
VALUES ('property-compenstation-comparison', '2014-02-20', 'infinity', 
'WITH tmp AS (
SELECT DISTINCT ABS(COALESCE(initial_amount, 0) - COALESCE(final_amount, 0)) 
              < (COALESCE(initial_amount, 0) * 0.1) AS within_tolerance,
       ba_unit_id
FROM   application.negotiate
WHERE  service_id = #{id}
AND    final_amount > initial_amount)
SELECT COUNT(*) = 0 AS vl,
       COALESCE(string_agg(administrative.get_property_name(ba_unit_id), '', ''), '''') AS _$property_list
FROM   tmp
WHERE  within_tolerance = FALSE');

INSERT INTO system.br_validation(
            br_id, target_code, target_application_moment, target_service_moment, 
            target_reg_moment, target_request_type_code, target_rrr_type_code, 
            severity_code, order_of_execution)
VALUES ('property-compenstation-comparison', 'service', NULL, 'complete', NULL, 'slNegotiate', NULL, 'medium', 830);


-- New Rule to warn the user if land use for the property is not indicated.
DELETE FROM system.br_validation WHERE br_id = 'ba-unit-has-land-use'; 
DELETE FROM system.br_definition WHERE br_id = 'ba-unit-has-land-use';
DELETE FROM system.br WHERE id = 'ba-unit-has-land-use'; 

INSERT INTO system.br (id, display_name, technical_type_code, feedback, description, technical_description)
VALUES ('ba-unit-has-land-use', 'ba-unit-has-land-use', 'sql', '_$property_name must be linked to parcels that specify land use',
'State Land BR-11', 'Parameters: #{id} (administrative.ba_unit.id)');

INSERT INTO system.br_definition (br_id, active_from, active_until, body)
VALUES ('ba-unit-has-land-use', '2014-02-20', 'infinity', 
   'SELECT  administrative.get_land_use_code(ba.id) IS NOT NULL AS vl,
            COALESCE(administrative.get_property_name(ba.id), '''') AS _$property_name 
	FROM    administrative.ba_unit ba		
	WHERE   ba.id = #{id}');

INSERT INTO system.br_validation(
            br_id, target_code, target_application_moment, target_service_moment, 
            target_reg_moment, target_request_type_code, target_rrr_type_code, 
            severity_code, order_of_execution)
VALUES ('ba-unit-has-land-use', 'ba_unit', NULL, NULL, 'current', NULL, NULL, 'warning', 840);


-- New Rule to warn the user if a lease or license is missing conditions
DELETE FROM system.br_validation WHERE br_id = 'rrr-has-conditions'; 
DELETE FROM system.br_definition WHERE br_id = 'rrr-has-conditions';
DELETE FROM system.br WHERE id = 'rrr-has-conditions'; 

INSERT INTO system.br (id, display_name, technical_type_code, feedback, description, technical_description)
VALUES ('rrr-has-conditions', 'rrr-has-conditions', 'sql', '_$rrr_type on _$property_name should have conditions recorded',
'State Land BR-19', 'Parameters: #{id} (administrative.ba_unit.id)');

INSERT INTO system.br_definition (br_id, active_from, active_until, body)
VALUES ('rrr-has-conditions', '2014-02-20', 'infinity', 
   ' SELECT  CASE WHEN EXISTS (SELECT rrr_id FROM administrative.condition_for_rrr cond 
                               WHERE cond.rrr_id = r.id) THEN TRUE ELSE FALSE END AS vl,
             COALESCE(administrative.get_property_name(r.ba_unit_id), '''') AS _$property_name,
	         COALESCE(get_translation(rt.display_value, #{sql_param_languageCode}), '''') AS _$rrr_type
	FROM    administrative.rrr r,
            administrative.rrr_type rt	
	WHERE   r.id = #{id}
	AND     rt.code = r.type_code
	AND     r.type_code IN (''lease'', ''license'')');

INSERT INTO system.br_validation(
            br_id, target_code, target_application_moment, target_service_moment, 
            target_reg_moment, target_request_type_code, target_rrr_type_code, 
            severity_code, order_of_execution)
VALUES ('rrr-has-conditions', 'rrr', NULL, NULL, 'current', NULL, NULL, 'warning', 840);


-- Updates to application_status_type
UPDATE application.application_status_type
SET display_value = 'On Hold'
WHERE code = 'requisitioned'; 

UPDATE application.application_action_type
SET display_value = 'Hold'
WHERE code = 'requisition';

UPDATE application.application_action_type
SET display_value = 'Resume'
WHERE code = 'resubmit';


-- Revise the list of tasks and task categories
INSERT INTO application.request_display_group (
 code, display_value, description, status )
SELECT 'lease', 'Leases and Licenses', 'Lease and License display group', 'c'
WHERE NOT EXISTS (SELECT code FROM application.request_display_group WHERE code =  'lease'); 

INSERT INTO application.request_display_group (
 code, display_value, description, status )
SELECT 'interest', 'Interests', 'Interests display group', 'c'
WHERE NOT EXISTS (SELECT code FROM application.request_display_group WHERE code =  'interest');

INSERT INTO application.request_display_group (
 code, display_value, description, status )
SELECT 'claim', 'Claims', 'Claims display group', 'c'
WHERE NOT EXISTS (SELECT code FROM application.request_display_group WHERE code =  'claim');

-- Lease and License
INSERT INTO application.request_type(
            code, request_category_code, display_value, description, status, 
            nr_days_to_complete, nr_properties_required, rrr_type_code, type_action_code, 
            service_panel_code, display_group_code, display_order)
    VALUES ('slLease', 'stateLandServices', 'Record Lease', 'Record a new lease for an existing State Land Property',
	         'c', 5, 1, 'lease', 'new', 'slProperty', 'lease', 70);
INSERT INTO application.request_type(
            code, request_category_code, display_value, description, status, 
            nr_days_to_complete, nr_properties_required, rrr_type_code, type_action_code, 
            service_panel_code, display_group_code, display_order)
    VALUES ('slLicense', 'stateLandServices', 'Record License', 'Record a new license for an existing State Land Property',
	         'c', 5, 1, 'license', 'new', 'slProperty', 'lease', 100);
INSERT INTO application.request_type(
            code, request_category_code, display_value, description, status, 
            nr_days_to_complete, nr_properties_required, rrr_type_code, type_action_code, 
            service_panel_code, display_group_code, display_order)
    VALUES ('slLeaseChange', 'stateLandServices', 'Change Lease', 'Update the details of an existing lease',
	         'c', 5, 1, 'lease', 'vary', 'slProperty', 'lease', 80);
INSERT INTO application.request_type(
            code, request_category_code, display_value, description, status, 
            nr_days_to_complete, nr_properties_required, rrr_type_code, type_action_code, 
            service_panel_code, display_group_code, display_order)
    VALUES ('slLicenseChange', 'stateLandServices', 'Change License', 'Update the details of an existing license',
	         'c', 5, 1, 'license', 'vary', 'slProperty', 'lease', 110);
INSERT INTO application.request_type(
            code, request_category_code, display_value, description, status, 
            nr_days_to_complete, nr_properties_required, rrr_type_code, type_action_code, 
            service_panel_code, display_group_code, display_order)
    VALUES ('slLeaseCancel', 'stateLandServices', 'Cancel Lease', 'Cancel an existing lease.',
	         'c', 5, 1, 'lease', 'cancel', 'slProperty', 'lease', 90);
INSERT INTO application.request_type(
            code, request_category_code, display_value, description, status, 
            nr_days_to_complete, nr_properties_required, rrr_type_code, type_action_code, 
            service_panel_code, display_group_code, display_order)
    VALUES ('slLicenseCancel', 'stateLandServices', 'Cancel License', 'Cancel an existing license',
	         'c', 5, 1, 'license', 'cancel', 'slProperty', 'lease', 120);

-- Interests
INSERT INTO application.request_type(
            code, request_category_code, display_value, description, status, 
            nr_days_to_complete, nr_properties_required, rrr_type_code, type_action_code, 
            service_panel_code, display_group_code, display_order)
    VALUES ('slInterest', 'stateLandServices', 'Record Interest', 'Record a new interest over an existing State Land Property',
	         'c', 5, 1, NULL, 'new', 'slProperty', 'interest', 130);
INSERT INTO application.request_type(
            code, request_category_code, display_value, description, status, 
            nr_days_to_complete, nr_properties_required, rrr_type_code, type_action_code, 
            service_panel_code, display_group_code, display_order)
    VALUES ('slInterestChange', 'stateLandServices', 'Change Interest', 'Update the details of an existing interest',
	         'c', 5, 1, NULL, 'vary', 'slProperty', 'interest', 140);	

UPDATE application.request_type 
SET display_order = 150,
    display_group_code = 'interest'
WHERE code = 'cancelInterest'; 		 

-- Claims
INSERT INTO application.request_type(
            code, request_category_code, display_value, description, status, 
            nr_days_to_complete, nr_properties_required, rrr_type_code, type_action_code, 
            service_panel_code, display_group_code, display_order)
    VALUES ('slClaim', 'stateLandServices', 'Record Claim', 'Record a new claim affecting an existing State Land Property',
	         'c', 5, 1, 'claim', 'new', 'slProperty', 'claim', 160);
INSERT INTO application.request_type(
            code, request_category_code, display_value, description, status, 
            nr_days_to_complete, nr_properties_required, rrr_type_code, type_action_code, 
            service_panel_code, display_group_code, display_order)
    VALUES ('slClaimChange', 'stateLandServices', 'Change Claim', 'Update the details of an existing claim',
	         'c', 5, 1, 'claim', 'vary', 'slProperty', 'claim', 170);	
INSERT INTO application.request_type(
            code, request_category_code, display_value, description, status, 
            nr_days_to_complete, nr_properties_required, rrr_type_code, type_action_code, 
            service_panel_code, display_group_code, display_order)
    VALUES ('slClaimCancel', 'stateLandServices', 'Cancel Claim', 'Cancel an existing claim',
	         'c', 5, 1, 'claim', 'cancel', 'slProperty', 'claim', 180);
			 
			 
UPDATE application.request_type 
SET display_order = display_order + 120 
WHERE display_group_code = 'job';