#!/bin/sh
set -e

echo "[entrypoint] PORT=${PORT}"

envsubst '${PORT}' < /etc/nginx/nginx.conf.template > /etc/nginx/conf.d/default.conf

echo "[entrypoint] Generated nginx config:"
cat /etc/nginx/conf.d/default.conf

echo "[entrypoint] Starting nginx..."
exec nginx -g "daemon off;"
