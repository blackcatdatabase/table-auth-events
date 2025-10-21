<!-- Auto-generated from schema-map.psd1 @ 1e83bb6 (2025-10-21T10:18:36+02:00) -->
# Definition – auth_events

Authentication events (logins, resets, lockouts).

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT UNSIGNED | — | — | Surrogate primary key. |  |
| user_id | BIGINT UNSIGNED | YES | — | Related user (FK users.id). |  |
| type | ENUM('login_success','login_failure','logout','password_reset','lockout') | NO | — | Auth event kind. | enum: login_success, login_failure, logout, password_reset, lockout |
| ip_hash | BINARY(32) | YES | — | Hashed client IP. | PII: hashed |
| ip_hash_key_version | VARCHAR(64) | YES | — | Key version used for ip_hash. |  |
| user_agent | VARCHAR(1024) | YES | — | Client user agent. |  |
| occurred_at | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) | When event happened (UTC). |  |
| meta | JSON | YES | — | Additional JSON metadata (e.g., email used). |  |
| meta_email | VARCHAR(255) | — | — | Generated: email extracted from meta (for indexing). |  |
