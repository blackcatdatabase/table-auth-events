-- Auto-generated from schema-map-postgres.psd1 (map@mtime:2025-10-24T09:46:38Z)
-- engine: postgres
-- table:  auth_events
CREATE INDEX idx_auth_meta_email ON auth_events (meta_email);

CREATE INDEX idx_auth_user ON auth_events (user_id);

CREATE INDEX idx_auth_time ON auth_events (occurred_at);

CREATE INDEX idx_auth_type_time ON auth_events (type, occurred_at);

CREATE INDEX idx_auth_ip_hash ON auth_events (ip_hash);
