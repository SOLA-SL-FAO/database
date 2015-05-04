-- Updates for Web Admin

INSERT INTO system.version VALUES ('sl1505a'); 

ALTER TABLE system.language ADD COLUMN ltr boolean NOT NULL DEFAULT 't';
COMMENT ON COLUMN system.language.ltr IS 'Indicates text direction. If true, then left to right should applied, otherwise right to left.';
UPDATE system.language SET ltr = 'f' WHERE code = 'ar-JO';

INSERT INTO system.setting (name, vl, active, description) VALUES ('product-name', 'SOLA State Land', 't', 'SOLA product name');
INSERT INTO system.setting (name, vl, active, description) VALUES ('product-code', 'ssl', 't', 'SOLA product code. sr - SOLA Registry, ssr - SOLA Systematic Registration, ssl - SOLA State Land, scs - SOLA Community Server');
INSERT INTO system.setting (name, vl, active, description) VALUES ('email-mailer-jndi-name', 'mail/sola', 't', 'Configured mailer service JNDI name');
INSERT INTO system.setting (name, vl, active, description) VALUES ('network-scan-folder', '', 'f', 'Scan folder path, used by digital archive service. This setting is disabled by default. It has to be specified only if specific folder path is required (e.g. network drive). By default, system will use user''s home folder + /sola/scan');

delete from system.setting where name like 'email-msg-claim%';
delete from system.setting where name like 'email-msg-reg%';
delete from system.setting where name like 'email-msg-user%';
delete from system.setting where name like 'email-msg-pswd-%';
delete from system.config_map_layer_metadata where name_layer = 'claims-orthophoto';
delete from system.config_map_layer where name = 'claims-orthophoto';
delete from system.approle where code in ('AccessCS','ModerateClaim','RecordClaim','ReviewClaim');
delete from system.appuser where id in ('claim-moderator','claim-recorder','claim-reviewer');
delete from system.appgroup where id in ('claim-moderators','claim-reviewers','CommunityMembers','CommunityRecorders');
drop schema opentenure cascade;
