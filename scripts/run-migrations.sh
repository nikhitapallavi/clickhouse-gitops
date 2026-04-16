#!/bin/sh
set -e

echo "============================================"
echo "  Goose ClickHouse Migration Runner"
echo "  Time: $(date -u)"
echo "============================================"

CH_HOST="${CLICKHOUSE_HOST:-localhost}"
CH_PORT="${CLICKHOUSE_PORT:-9000}"
CH_USER="${CLICKHOUSE_USER:-default}"
CH_PASSWORD="${CLICKHOUSE_PASSWORD:-}"
CH_DATABASE="${CLICKHOUSE_DATABASE:-analytics}"
MIGRATIONS_DIR="/migrations"

DSN="clickhouse://${CH_USER}:${CH_PASSWORD}@${CH_HOST}:${CH_PORT}/${CH_DATABASE}?x-multi-statement=true"

echo "[INFO] Host     : ${CH_HOST}:${CH_PORT}"
echo "[INFO] Database : ${CH_DATABASE}"
echo ""

echo "--- Current Migration Status ---"
goose -dir "${MIGRATIONS_DIR}" clickhouse "${DSN}" status || true

echo ""
echo "--- Running Pending Migrations ---"
goose -dir "${MIGRATIONS_DIR}" clickhouse "${DSN}" up

echo ""
echo "--- Final Status After Run ---"
goose -dir "${MIGRATIONS_DIR}" clickhouse "${DSN}" status

echo ""
echo "[DONE] Completed at $(date -u)"
