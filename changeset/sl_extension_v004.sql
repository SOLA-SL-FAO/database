-- 22 July 2014
-- SOLA Database extensions for v004 of the State Land application
CREATE OR REPLACE FUNCTION administrative.get_land_use_code(prop_id character varying)
  RETURNS character varying AS
$BODY$ 
BEGIN
    RETURN 
	   (WITH use_area AS 
           (SELECT  co3.land_use_code, 
		            SUM(sva3.size) AS area 
            FROM administrative.ba_unit_contains_spatial_unit bas3, 
			     cadastre.cadastre_object co3 LEFT OUTER JOIN
                 cadastre.spatial_value_area sva3 ON sva3.spatial_unit_id = co3.id 
				                                  AND sva3.type_code = 'officialArea'
            WHERE bas3.ba_unit_id = prop_id 
			AND   co3.id = bas3.spatial_unit_id 
            AND co3.land_use_code IS NOT NULL      
            GROUP BY co3.land_use_code)
			
            SELECT land_use_code FROM use_area 
            ORDER BY area LIMIT 1);
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION administrative.get_land_use_code(character varying)
  OWNER TO postgres;
COMMENT ON FUNCTION administrative.get_land_use_code(character varying) IS 'Returns the land use code for a ba unit based on the land use code of the largest combined parcel by area';

CREATE OR REPLACE FUNCTION administrative.is_linked_document(prop_id character varying, doc_ref character varying)
  RETURNS BOOLEAN AS
$BODY$ 
BEGIN
    RETURN EXISTS (WITH docs AS 
	       (SELECT s.reference_nr 
            FROM   administrative.source_describes_ba_unit sbu, 
			       source.source s
            WHERE  sbu.ba_unit_id = prop_id
			AND    s.id = sbu.source_id
			AND    s.reference_nr IS NOT NULL
			UNION
			SELECT s.reference_nr 
            FROM   administrative.rrr r,
			       administrative.source_describes_rrr srr, 
			       source.source s
            WHERE  r.ba_unit_id = prop_id
			AND    srr.rrr_id = r.id
			AND    s.id = srr.source_id
			AND    s.reference_nr IS NOT NULL
			UNION
			SELECT s.reference_nr 
            FROM   administrative.notation n,
			       administrative.source_describes_notation sn, 
			       source.source s
            WHERE  n.ba_unit_id = prop_id
			AND    sn.notation_id = n.id
			AND    s.id = sn.source_id
			AND    s.reference_nr IS NOT NULL)			
            SELECT reference_nr FROM docs 
            WHERE compare_strings(doc_ref, docs.reference_nr));
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION administrative.is_linked_document(character varying, character varying)
  OWNER TO postgres;
COMMENT ON FUNCTION administrative.is_linked_document(character varying, character varying) IS 'Returns true if any documents associated with the property match the document reference speicfied.';


UPDATE administrative.ba_unit_rel_type
SET status = 'x'
WHERE code IN ('priorTitle', 'rootTitle');

INSERT INTO administrative.ba_unit_rel_type(code, display_value, status, description)
SELECT 'underlyingTitle', 'Underlying Title', 'c', 'The title from which the state land was taken.'
WHERE NOT EXISTS (SELECT code FROM administrative.ba_unit_rel_type WHERE code = 'underlyingTitle');

UPDATE administrative.ba_unit_type
SET display_value = 'Property'
WHERE code = 'basicPropertyUnit';

