-- 31 July 2014
DROP TABLE IF EXISTS system.appuser_team;
CREATE TABLE system.appuser_team
(
  appuser_id character varying(40) NOT NULL, 
  party_id character varying(40) NOT NULL, 
  rowidentifier character varying(40) NOT NULL DEFAULT uuid_generate_v1(), 
  rowversion integer NOT NULL DEFAULT 0, 
  change_action character(1) NOT NULL DEFAULT 'i'::bpchar,
  change_user character varying(50), 
  change_time timestamp without time zone NOT NULL DEFAULT now(), 
  CONSTRAINT appuser_team_pkey PRIMARY KEY (appuser_id, party_id),
  CONSTRAINT appuser_team_appuser_id_fkey FOREIGN KEY (appuser_id)
      REFERENCES system.appuser (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
);

COMMENT ON TABLE system.appuser_team
  IS 'Associates users to a party (a.k.a. Team). Used to associated users with Property Manager teams. A user can be associated with multiple teams if required. This table omits a foriegn key to the party table to avoid data dependency issues on data load. 
Tags: FLOSS SOLA State Land Extension, User Admin';
COMMENT ON COLUMN system.appuser_team.appuser_id IS 'Identifier for the SOLA user.';
COMMENT ON COLUMN system.appuser_team.party_id IS 'Identifier for the party (a.k.a. Team) the user is associated to.';
COMMENT ON COLUMN system.appuser_team.rowidentifier IS 'Identifies the all change records for the row in the system.appuser_party_historic table';
COMMENT ON COLUMN system.appuser_team.rowversion IS 'Sequential value indicating the number of times this row has been modified.';
COMMENT ON COLUMN system.appuser_team.change_action IS 'Indicates if the last data modification action that occurred to the row was insert (i), update (u) or delete (d).';
COMMENT ON COLUMN system.appuser_team.change_user IS 'The user id of the last person to modify the row.';
COMMENT ON COLUMN system.appuser_team.change_time IS 'The date and time the row was last modified.';


CREATE INDEX appuser_team_party_id_fk_ind
  ON system.appuser_team
  USING btree
  (party_id COLLATE pg_catalog."default");
  
CREATE INDEX appuser_team_appuser_id_fk_ind
  ON system.appuser_team
  USING btree
  (appuser_id COLLATE pg_catalog."default");

CREATE TRIGGER __track_changes
  BEFORE INSERT OR UPDATE
  ON system.appuser_team
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_changes();

CREATE TRIGGER __track_history
  AFTER UPDATE OR DELETE
  ON system.appuser_team
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_history();

  DROP TABLE IF EXISTS system.appuser_team_historic; 
CREATE TABLE system.appuser_team_historic
(
  appuser_id character varying(40),
  party_id character varying(40),
  rowidentifier character varying(40),
  rowversion integer,
  change_action character(1),
  change_user character varying(50),
  change_time timestamp without time zone,
  change_time_valid_until timestamp without time zone NOT NULL DEFAULT now()
);

CREATE INDEX aappuser_team_historic_index_on_rowidentifier
  ON system.appuser_team_historic
  USING btree
  (rowidentifier COLLATE pg_catalog."default");
  
-- Add Team Party Role
INSERT INTO party.party_role_type (code, display_value, status, description)
SELECT 'team', 'Team', 'c', 'Extension to LADM for State Land. Identifies the party as being a team. ' 
WHERE NOT EXISTS (SELECT code FROM party.party_role_type WHERE code = 'team');

INSERT INTO party.party_role (party_id, type_code) 
SELECT 'sl_party_1', 'team'
WHERE NOT EXISTS (SELECT party_id FROM party.party_role
                  WHERE party_id = 'sl_party_1'
				  AND   type_code = 'team'); 
				  
INSERT INTO party.party_role (party_id, type_code) 
SELECT 'sl_party_2', 'team'
WHERE NOT EXISTS (SELECT party_id FROM party.party_role
                  WHERE party_id = 'sl_party_2'
				  AND   type_code = 'team'); 
				  
 INSERT INTO system.appuser_team (appuser_id, party_id)
 SELECT u.id, p.id FROM system.appuser u, party.party p
 WHERE u.username IN ('test', 'demo')
 AND   p.id IN ('sl_party_1', 'sl_party_2')
 AND NOT EXISTS (SELECT appuser_id FROM system.appuser_team 
                 WHERE appuser_id = u.id AND party_id = p.id); 
 
-- Add new roles for the Job Assign and Property Assign tools
INSERT INTO system.approle (code, display_value, status, description)
SELECT 'BaunitTeam', 'Property - Assign Team','c', 'Allows the user to assign a team (e.g. Property Manager) to a property.'
WHERE NOT EXISTS (SELECT code FROM system.approle WHERE code = 'BaunitTeam');

INSERT INTO system.approle_appgroup (approle_code, appgroup_id) 
    (SELECT 'BaunitTeam', ag.id FROM system.appgroup ag WHERE ag."name" = 'Super group'
	 AND NOT EXISTS (SELECT approle_code FROM system.approle_appgroup 
	                 WHERE  approle_code = 'BaunitTeam'
					 AND    appgroup_id = ag.id));				  


-- Add Cemetery to the list of land use types. 					 
INSERT INTO cadastre.land_use_type(code, display_value, status, description)
SELECT 'cemetery', 'Cemetery', 'c', 'The land is used for a cemetery or burial ground.'
WHERE NOT EXISTS (SELECT code FROM cadastre.land_use_type WHERE code = 'cemetery');


   
   
   