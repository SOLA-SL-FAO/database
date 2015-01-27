-- Updates for v19 of SOLA State Land

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