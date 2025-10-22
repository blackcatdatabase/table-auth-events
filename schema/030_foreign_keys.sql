-- Auto-generated from schema-map.psd1 (map@1e83bb6)
-- table: auth_events
ALTER TABLE auth_events ADD CONSTRAINT fk_auth_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL;
