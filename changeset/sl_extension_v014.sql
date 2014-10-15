-- 14 Oct 2015
-- Add example Land Banks for Land Bank Interest
INSERT INTO administrative.rrr_sub_type(code, rrr_type_code, display_value, status, description)
SELECT 'bank1', 'landbank', 'Oneroa Settlement', 'c', 'Land allocated for housing in and around the settlement of Oneroa.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_sub_type WHERE code = 'bank1');

INSERT INTO administrative.rrr_sub_type(code, rrr_type_code, display_value, status, description)
SELECT 'bank2', 'landbank', 'Hooks Bay', 'c', 'Land allocated for farming in and around the Hooks Bay.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_sub_type WHERE code = 'bank2');

INSERT INTO administrative.rrr_type(code, rrr_group_type_code, display_value, is_primary, share_check, party_required, status, rrr_panel_code, description)
SELECT 'ppp', 'rights', 'Public Private Partnership', FALSE, FALSE, TRUE, 'c', 'simpleRholdConPanel', 'Indicates that the state has entered into a public private partnership along with any coniditions relating to that partnership.'
WHERE NOT EXISTS (SELECT code FROM administrative.rrr_type WHERE code = 'ppp');


CREATE OR REPLACE FUNCTION system.has_security_clearance(user_name CHARACTER VARYING,
  classification_code CHARACTER VARYING)
  RETURNS BOOLEAN AS
$BODY$
declare
  has_clearance BOOLEAN; 
BEGIN
    IF classification_code IS NULL OR classification_code = '01SEC_Unrestricted' THEN
        RETURN TRUE; 
    END IF;  

    has_clearance = FALSE;
    IF SUBSTRING(classification_code FROM 1 FOR 5) > '05SEC' THEN
	    -- This is a custom security classification so check the user 
		-- has this exact classification or the Top Secret classification
        IF EXISTS (
            SELECT u.id
            FROM   system.appuser u,
                   system.appuser_appgroup ug,
                   system.approle_appgroup rg
            WHERE  u.username = user_name
            AND	   ug.appuser_id = u.id
            AND    rg.appgroup_id = ug.appgroup_id
            AND    rg.approle_code IN (classification_code, '05SEC_TopSecret')) THEN
			    has_clearance = TRUE; 
        END IF;
    ELSE 
	    -- General security classification, check the user has
		-- this classification or a higher one. 
        IF EXISTS (
            SELECT u.id
            FROM   system.appuser u,
                   system.appuser_appgroup ug,
                   system.approle_appgroup rg
            WHERE  u.username = user_name
            AND	   ug.appuser_id = u.id
            AND    rg.appgroup_id = ug.appgroup_id
			AND    SUBSTRING(rg.approle_code FROM 3 FOR 3) = 'SEC' 
			AND    SUBSTRING(rg.approle_code FROM 1 FOR 5) <= '05SEC' 
			AND    SUBSTRING(rg.approle_code FROM 1 FOR 5) >= SUBSTRING(classification_code FROM 1 FOR 5)) THEN
			    has_clearance = TRUE; 
        END IF;
    END IF;  	
    RETURN  has_clearance ;
END;

$BODY$
LANGUAGE plpgsql VOLATILE; 

COMMENT ON FUNCTION system.has_security_clearance(CHARACTER VARYING, CHARACTER VARYING) IS 'Determines if the user has the appropriate security classification to view access the record.';


