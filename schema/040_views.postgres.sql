-- Auto-generated from schema-views-postgres.psd1 (map@9d3471b)
-- engine: postgres
-- table:  auth_events
-- Contract view for [auth_events]
CREATE OR REPLACE VIEW vw_auth_events AS
SELECT
  id,
  user_id,
  type,
  ip_hash,
  UPPER(encode(ip_hash,'hex'))::char(32) AS ip_hash_hex,
  ip_hash_key_version,
  user_agent,
  occurred_at,
  meta,
  meta_email
FROM auth_events;
