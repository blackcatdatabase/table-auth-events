-- Auto-generated from schema-map-postgres.yaml (map@4ae85c5)
-- engine: postgres
-- table:  auth_events

CREATE INDEX IF NOT EXISTS idx_auth_meta_email ON auth_events (meta_email);

CREATE INDEX IF NOT EXISTS idx_auth_user ON auth_events (user_id);

CREATE INDEX IF NOT EXISTS idx_auth_time ON auth_events (occurred_at);

CREATE INDEX IF NOT EXISTS idx_auth_type_time ON auth_events (type, occurred_at);

CREATE INDEX IF NOT EXISTS idx_auth_ip_hash ON auth_events (ip_hash);

CREATE INDEX IF NOT EXISTS gin_auth_events_meta ON auth_events   USING GIN (meta jsonb_path_ops);
