# 📦 Auth Events

![SQL](https://img.shields.io/badge/SQL-MySQL%208.0%2B-4479A1?logo=mysql&logoColor=white) ![License](https://img.shields.io/badge/license-BlackCat%20Proprietary-red) ![Status](https://img.shields.io/badge/status-stable-informational) ![Generated](https://img.shields.io/badge/generated-from%20schema--map-blue)

> Schema package for table **auth_events** (repo: $slug).

## Files
```
schema/
  001_table.sql
  # (no deferred indexes declared in map)
  030_foreign_keys.sql
```

## Quick apply
```bash
# Apply schema (Linux/macOS):
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/001_table.sql
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/030_foreign_keys.sql
```

```powershell
# Apply schema (Windows PowerShell):
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/001_table.sql
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/030_foreign_keys.sql
```

## Docker quickstart
```bash
# Spin up a throwaway MySQL and apply just this package:
docker run --rm -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=app -p 3307:3306 -d mysql:8
sleep 15
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/001_table.sql
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/030_foreign_keys.sql
```

## Columns
| Column | Type | Null | Default | Extra |
|-------:|:-----|:----:|:--------|:------|
| id | BIGINT UNSIGNED | — | — | AUTO_INCREMENT, PK |
| user_id | BIGINT UNSIGNED | YES | — |  |
| type | ENUM(''login_success'',''login_failure'',''logout'',''password_reset'',''lockout'') | NO | — |  |
| ip_hash | BINARY(32) | YES | — |  |
| ip_hash_key_version | VARCHAR(64) | YES | — |  |
| user_agent | VARCHAR(1024) | YES | — |  |
| occurred_at | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) |  |
| meta | JSON | YES | — |  |
| meta_email | VARCHAR(255) | — | — |  |

## Relationships
- FK → **users** via (user_id) (ON DELETE SET NULL).

```mermaid
erDiagram
  AUTH_EVENTS {
    BIGINT id PK
    BIGINT user_id
    ENUM(''login_success'',''login_failure'',''logout'',''password_reset'',''lockout'') type
    BINARY(32) ip_hash
    VARCHAR(64) ip_hash_key_version
    VARCHAR(1024) user_agent
    DATETIME(6) occurred_at
    JSON meta
    VARCHAR(255) meta_email
  }
  AUTH_EVENTS }o--|| USERS : "user_id"
```

## Indexes
- No deferred indexes declared for this table.

## Notes
- Generated from the umbrella repository **blackcat-database** using `scripts/schema-map.psd1`.
- To change the schema, update the map and re-run the generators.

## License
Distributed under the **BlackCat Store Proprietary License v1.0**. See `LICENSE`.

