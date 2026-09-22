#!/bin/bash
set -e

URL="${HEALTH_CHECK_URL:-http://localhost:8080/mywebapp/}"

echo "Checking application: $URL"

if ! command -v curl >/dev/null 2>&1; then
    echo "curl is required for the health check."
    exit 1
fi

curl --fail --silent --show-error "$URL" >/dev/null

echo "Health check passed."
