<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->
# Definition – auth_events

Authentication events (logins, resets, lockouts).

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT | — | AS | Surrogate primary key. |  |
| user_id | BIGINT | YES | — | Related user (FK users.id). |  |
| type | TEXT | NO | — | Auth event kind. | enum: login_success, login_failure, logout, password_reset, lockout |
| ip_hash | BYTEA | YES | — | Hashed client IP. | PII: hashed |
| ip_hash_key_version | VARCHAR(64) | YES | — | Key version used for ip_hash. |  |
| user_agent | VARCHAR(1024) | YES | — | Client user agent. |  |
| occurred_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | When event happened (UTC). |  |
| meta | JSONB | YES | — | Additional JSON metadata (e.g., email used). |  |
| meta_email | TEXT | — | — | Generated/stored email extracted from meta for indexing/filtering. |  |