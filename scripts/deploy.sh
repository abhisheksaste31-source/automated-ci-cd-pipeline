#!/bin/bash
set -e

# This script is a deployment template.
# Configure the approved deployment method for your Tomcat server.

WAR_FILE="${WAR_FILE:-target/myapp.war}"
TOMCAT_WEBAPPS="${TOMCAT_WEBAPPS:-/opt/tomcat/webapps}"

if [ ! -f "$WAR_FILE" ]; then
    echo "WAR file not found: $WAR_FILE"
    exit 1
fi

echo "WAR artifact: $WAR_FILE"
echo "Tomcat webapps directory: $TOMCAT_WEBAPPS"
echo "Configure SSH/SCP or your Jenkins Tomcat deployment plugin for the actual deployment."
