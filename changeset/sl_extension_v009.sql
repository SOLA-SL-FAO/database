-- 3 Sep 2014

-- Update the get_land_use_code function to use DESC order for the area size. 
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
            ORDER BY area DESC LIMIT 1);
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION administrative.get_land_use_code(character varying)
  OWNER TO postgres;
COMMENT ON FUNCTION administrative.get_land_use_code(character varying) IS 'Returns the land use code for a ba unit based on the land use code of the largest combined parcel by area';

-- Create function to determine the state land status of the property
CREATE OR REPLACE FUNCTION administrative.get_state_land_status(prop_id character varying)
  RETURNS character varying AS
$BODY$ 
BEGIN
    RETURN 
	   (WITH sl_status AS 
           (SELECT  co.state_land_status_code, 
		            CASE  co.state_land_status_code 
					   WHEN 'current' THEN 1
					   WHEN 'surplus' THEN 2
					   WHEN 'dormant' THEN 3
					   WHEN 'proposed' THEN 4
					   ELSE 5 END AS status_order
            FROM administrative.ba_unit_contains_spatial_unit bas, 
			     cadastre.cadastre_object co
            WHERE bas.ba_unit_id = prop_id 
			AND   co.id = bas.spatial_unit_id 
            AND   co.state_land_status_code IS NOT NULL)
			
            SELECT state_land_status_code FROM sl_status 
            ORDER BY status_order LIMIT 1);
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION administrative.get_state_land_status(character varying)
  OWNER TO postgres;
COMMENT ON FUNCTION administrative.get_state_land_status(character varying) IS 'Returns the state land status for the property based on the status of the parcels linked to the property';



-- Data fix
UPDATE cadastre.cadastre_object 
SET type_code = 'stateLand'
WHERE name_lastpart = 'DP 34562';