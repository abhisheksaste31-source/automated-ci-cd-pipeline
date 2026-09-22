#!/bin/bash
set -e

PREVIOUS_WAR="${1:-}"

if [ -z "$PREVIOUS_WAR" ]; then
    echo "Usage: ./scripts/rollback.sh <previous-war-file>"
    exit 1
fi

if [ ! -f "$PREVIOUS_WAR" ]; then
    echo "Previous WAR not found: $PREVIOUS_WAR"
    exit 1
fi

echo "Rollback artifact selected: $PREVIOUS_WAR"
echo "Deploy this known-good artifact through the configured Tomcat deployment method."
