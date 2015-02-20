-- Updates for v19 of SOLA State Land

UPDATE system.language SET active = FALSE
WHERE code NOT IN ('en-US');

INSERT INTO system.version (version_num) VALUES ('1502a SL Release'); 

UPDATE source.administrative_source_type
SET display_value = 'Proof of Identity'
WHERE code = 'idVerification';

UPDATE source.administrative_source_type
SET display_value = 'Objection'
WHERE code = 'objection';

UPDATE source.administrative_source_type
SET display_value = 'Public Notification'
WHERE code = 'publicNotification';

INSERT INTO source.administrative_source_type
(code, display_value, status, description)
VALUES ('valuation', 'Valuation', 'c', 'Extension to LADM'); 

INSERT INTO source.administrative_source_type
(code, display_value, status, description)
VALUES ('notice', 'Notice', 'c', 'Extension to LADM'); 


UPDATE system.br SET display_name = 'AP040' WHERE id = 'application-br8-check-has-services';
UPDATE system.br SET display_name = 'AP160' WHERE id = 'application-br4-check-sources-date-not-in-the-future';
UPDATE system.br SET display_name = 'AP190' WHERE id = 'application-br7-check-sources-have-documents';
UPDATE system.br SET display_name = 'AP240' WHERE id = 'application-baunit-check-area';
UPDATE system.br SET display_name = 'BA030' WHERE id = 'ba_unit-has-cadastre-object';
UPDATE system.br SET display_name = 'BA070' WHERE id = 'ba_unit-has-a-valid-primary-right';
UPDATE system.br SET display_name = 'BA110' WHERE id = 'ba-unit-has-notes-to-action';
UPDATE system.br SET display_name = 'BA120' WHERE id = 'ba-unit-has-spatial-parcels';
UPDATE system.br SET display_name = 'BA130' WHERE id = 'ba-unit-has-land-use';
UPDATE system.br SET display_name = 'BA140' WHERE id = 'cancel-title-check-rrr-cancelled';
UPDATE system.br SET display_name = 'RR040' WHERE id = 'rrr-must-have-parties';
UPDATE system.br SET display_name = 'RR050' WHERE id = 'rrr-shares-total-check';
UPDATE system.br SET display_name = 'CA140' WHERE id = 'area-check-percentage-newofficialarea-calculatednewarea';
UPDATE system.br SET display_name = 'CA150' WHERE id = 'new-cadastre-objects-do-not-overlap';
UPDATE system.br SET display_name = 'CA250' WHERE id = 'cadastre-object-check-name';
UPDATE system.br SET display_name = 'CA260' WHERE id = 'parcel-name-duplicated';
UPDATE system.br SET display_name = 'RR150' WHERE id = 'rrr-has-conditions';
UPDATE system.br SET display_name = 'VA010' WHERE id = 'property-compenstation-comparison';
UPDATE system.br SET description = 'NOT USED BY SOLA STATE LAND' WHERE id = 'newtitle-br24-check-rrr-accounted';

INSERT INTO system.approle (code, display_value, status, description)
SELECT 'slLeaseCancel', 'Service - Cancel Lease', 'c', 'State Land Service. Allows the Cancel Lease task to be started.'
WHERE NOT EXISTS (SELECT code FROM system.approle WHERE code = 'slLeaseCancel'); 
INSERT INTO system.approle (code, display_value, status, description)
SELECT 'slLease', 'Service - Record Lease', 'c', 'State Land Service. Allows the Record Lease task to be started.'
WHERE NOT EXISTS (SELECT code FROM system.approle WHERE code = 'slLease'); 
INSERT INTO system.approle (code, display_value, status, description)
SELECT 'slLicense', 'Service - Record License', 'c', 'State Land Service. Allows the Record License task to be started.'
WHERE NOT EXISTS (SELECT code FROM system.approle WHERE code = 'slLicense'); 
INSERT INTO system.approle (code, display_value, status, description)
SELECT 'slLeaseChange', 'Service - Change Lease', 'c', 'State Land Service. Allows the Change Lease task to be started.'
WHERE NOT EXISTS (SELECT code FROM system.approle WHERE code = 'slLeaseChange'); 
INSERT INTO system.approle (code, display_value, status, description)
SELECT 'slLicenseChange', 'Service - Change License', 'c', 'State Land Service. Allows the Change License task to be started.'
WHERE NOT EXISTS (SELECT code FROM system.approle WHERE code = 'slLicenseChange'); 
INSERT INTO system.approle (code, display_value, status, description)
SELECT 'slLicenseCancel', 'Service - Cancel License', 'c', 'State Land Service. Allows the Cancel License task to be started.'
WHERE NOT EXISTS (SELECT code FROM system.approle WHERE code = 'slLicenseCancel'); 
INSERT INTO system.approle (code, display_value, status, description)
SELECT 'slInterest', 'Service - Record Interest', 'c', 'State Land Service. Allows the Record Interest task to be started.'
WHERE NOT EXISTS (SELECT code FROM system.approle WHERE code = 'slInterest'); 
INSERT INTO system.approle (code, display_value, status, description)
SELECT 'slInterestChange', 'Service - Change Interest', 'c', 'State Land Service. Allows the Change Interest task to be started.'
WHERE NOT EXISTS (SELECT code FROM system.approle WHERE code = 'slInterestChange');
INSERT INTO system.approle (code, display_value, status, description)
SELECT 'slClaim', 'Service - Record Claim', 'c', 'State Land Service. Allows the Record Claim task to be started.'
WHERE NOT EXISTS (SELECT code FROM system.approle WHERE code = 'slClaim'); 
INSERT INTO system.approle (code, display_value, status, description)
SELECT 'slClaimChange', 'Service - Change Claim', 'c', 'State Land Service. Allows the Change Claim task to be started.'
WHERE NOT EXISTS (SELECT code FROM system.approle WHERE code = 'slClaimChange'); 
INSERT INTO system.approle (code, display_value, status, description)
SELECT 'slClaimCancel', 'Service - Cancel Claim', 'c', 'State Land Service. Allows the Cancel Claim task to be started.'
WHERE NOT EXISTS (SELECT code FROM system.approle WHERE code = 'slClaimCancel'); 

INSERT INTO system.approle_appgroup (approle_code, appgroup_id)
    (SELECT 'slLeaseCancel', ag.id FROM system.appgroup ag WHERE ag."name" = 'Super group'
                AND NOT EXISTS (SELECT approle_code FROM system.approle_appgroup
                                 WHERE  approle_code = 'slLeaseCancel' AND appgroup_id = ag.id));
INSERT INTO system.approle_appgroup (approle_code, appgroup_id)
    (SELECT 'slLease', ag.id FROM system.appgroup ag WHERE ag."name" = 'Super group'
                AND NOT EXISTS (SELECT approle_code FROM system.approle_appgroup
                                 WHERE  approle_code = 'slLease' AND appgroup_id = ag.id));
INSERT INTO system.approle_appgroup (approle_code, appgroup_id)
    (SELECT 'slLicense', ag.id FROM system.appgroup ag WHERE ag."name" = 'Super group'
                AND NOT EXISTS (SELECT approle_code FROM system.approle_appgroup
                                 WHERE  approle_code = 'slLicense' AND appgroup_id = ag.id));
INSERT INTO system.approle_appgroup (approle_code, appgroup_id)
    (SELECT 'slLeaseChange', ag.id FROM system.appgroup ag WHERE ag."name" = 'Super group'
                AND NOT EXISTS (SELECT approle_code FROM system.approle_appgroup
                                 WHERE  approle_code = 'slLeaseChange' AND appgroup_id = ag.id));
INSERT INTO system.approle_appgroup (approle_code, appgroup_id)
    (SELECT 'slLicenseChange', ag.id FROM system.appgroup ag WHERE ag."name" = 'Super group'
                AND NOT EXISTS (SELECT approle_code FROM system.approle_appgroup
                                 WHERE  approle_code = 'slLicenseChange' AND appgroup_id = ag.id));
INSERT INTO system.approle_appgroup (approle_code, appgroup_id)
    (SELECT 'slLicenseCancel', ag.id FROM system.appgroup ag WHERE ag."name" = 'Super group'
                AND NOT EXISTS (SELECT approle_code FROM system.approle_appgroup
                                 WHERE  approle_code = 'slLicenseCancel' AND appgroup_id = ag.id));
INSERT INTO system.approle_appgroup (approle_code, appgroup_id)
    (SELECT 'slInterest', ag.id FROM system.appgroup ag WHERE ag."name" = 'Super group'
                AND NOT EXISTS (SELECT approle_code FROM system.approle_appgroup
                                 WHERE  approle_code = 'slInterest' AND appgroup_id = ag.id));
INSERT INTO system.approle_appgroup (approle_code, appgroup_id)
    (SELECT 'slInterestChange', ag.id FROM system.appgroup ag WHERE ag."name" = 'Super group'
                AND NOT EXISTS (SELECT approle_code FROM system.approle_appgroup
                                 WHERE  approle_code = 'slInterestChange' AND appgroup_id = ag.id));
INSERT INTO system.approle_appgroup (approle_code, appgroup_id)
    (SELECT 'slClaim', ag.id FROM system.appgroup ag WHERE ag."name" = 'Super group'
                AND NOT EXISTS (SELECT approle_code FROM system.approle_appgroup
                                 WHERE  approle_code = 'slClaim' AND appgroup_id = ag.id));
INSERT INTO system.approle_appgroup (approle_code, appgroup_id)
    (SELECT 'slClaimChange', ag.id FROM system.appgroup ag WHERE ag."name" = 'Super group'
                AND NOT EXISTS (SELECT approle_code FROM system.approle_appgroup
                                 WHERE  approle_code = 'slClaimChange' AND appgroup_id = ag.id));
INSERT INTO system.approle_appgroup (approle_code, appgroup_id)
    (SELECT 'slClaimCancel', ag.id FROM system.appgroup ag WHERE ag."name" = 'Super group'
                AND NOT EXISTS (SELECT approle_code FROM system.approle_appgroup
                                 WHERE  approle_code = 'slClaimCancel' AND appgroup_id = ag.id));
								 
								 
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
				AND sv3.request_type_code IN ( ''cancelProperty'', ''disposeSLProperty'')
				AND sv3.status_code != ''cancelled''),
					
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