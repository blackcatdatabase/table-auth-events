-- Auto-generated from schema-map-mysql.yaml (map@4ae85c5)
-- engine: mysql
-- table:  auth_events

ALTER TABLE auth_events ADD CONSTRAINT fk_auth_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL;
