# auth_events

Authentication events (logins, resets, lockouts).

## Columns
| Column | Type | Null | Default | Description | Crypto |
| --- | --- | --- | --- | --- | --- |
| id | BIGINT | NO |  | Surrogate primary key. |  |
| user_id | BIGINT | YES |  | Related user (FK users.id). |  |
| type | mysql: ENUM('login_success','login_failure','logout','password_reset','lockout','magic_link_request','magic_link_throttled','magic_link_email_queued','device_code_issue','device_code_issue_failure','device_code_activate_success','device_code_activate_failure','device_code_poll_success','device_code_poll_failure','webauthn_register_success','webauthn_register_failure','webauthn_login_success','webauthn_login_failure') / postgres: TEXT | NO |  | Auth event kind. (enum: login_success, login_failure, logout, password_reset, lockout, magic_link_request, magic_link_throttled, magic_link_email_queued, device_code_issue, device_code_issue_failure, device_code_activate_success, device_code_activate_failure, device_code_poll_success, device_code_poll_failure, webauthn_register_success, webauthn_register_failure, webauthn_login_success, webauthn_login_failure) |  |
| ip_hash | mysql: BINARY(32) / postgres: BYTEA | YES |  | Hashed client IP. | `hmac`<br/>ctx: `db.hmac.auth_events.ip_hash`<br/>kv: `ip_hash_key_version` |
| ip_hash_key_version | VARCHAR(64) | YES |  | Key version used for ip_hash. | key version for: `ip_hash` |
| user_agent | VARCHAR(1024) | YES |  | Client user agent. |  |
| occurred_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | When event happened (UTC). |  |
| meta | mysql: JSON / postgres: JSONB | YES |  | Additional JSON metadata (e.g., email used). |  |
| meta_email | mysql: VARCHAR(255) / postgres: TEXT | YES |  | Generated/stored email extracted from meta for indexing/filtering. |  |

## Engine Details

### mysql

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_auth_ip_hash | ip_hash | INDEX idx_auth_ip_hash (ip_hash) |
| idx_auth_meta_email | meta_email | INDEX idx_auth_meta_email (meta_email) |
| idx_auth_time | occurred_at | INDEX idx_auth_time (occurred_at) |
| idx_auth_type_time | type,occurred_at | INDEX idx_auth_type_time (`type`, occurred_at) |
| idx_auth_user | user_id | INDEX idx_auth_user (user_id) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_auth_user | user_id | users(id) | ON DELETE SET |

### postgres

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| gin_auth_events_meta | metajsonb_path_ops | CREATE INDEX IF NOT EXISTS gin_auth_events_meta ON auth_events   USING GIN (meta jsonb_path_ops) |
| idx_auth_ip_hash | ip_hash | CREATE INDEX IF NOT EXISTS idx_auth_ip_hash ON auth_events (ip_hash) |
| idx_auth_meta_email | meta_email | CREATE INDEX IF NOT EXISTS idx_auth_meta_email ON auth_events (meta_email) |
| idx_auth_time | occurred_at | CREATE INDEX IF NOT EXISTS idx_auth_time ON auth_events (occurred_at) |
| idx_auth_type_time | type,occurred_at | CREATE INDEX IF NOT EXISTS idx_auth_type_time ON auth_events (type, occurred_at) |
| idx_auth_user | user_id | CREATE INDEX IF NOT EXISTS idx_auth_user ON auth_events (user_id) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_auth_user | user_id | users(id) | ON DELETE SET |

## Engine differences

## Views
| View | Engine | Flags | File |
| --- | --- | --- | --- |
| vw_auth_events | mysql | algorithm=MERGE, security=INVOKER | [../schema/040_views.mysql.sql](../schema/040_views.mysql.sql) |
| vw_auth_events | postgres |  | [../schema/040_views.postgres.sql](../schema/040_views.postgres.sql) |
