-- Add Notified status to negotiate_status and delete presented status
DELETE FROM application.negotiate_status WHERE code IN ('presented', 'notified'); 
INSERT INTO application.negotiate_status (code, display_value, description, status)
VALUES ('notified', 'Notified', 'The purchaser has notified or presented an offer to the vendor for their consideration.', 'c'); 
