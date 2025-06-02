#!/bin/bash
set -e
cd /opt/nodejs-app || exit 1 # Change to the application directory

echo "Stopping the application..."
# Stop the application using docker-compose
docker-compose down 2>/dev/null || true

echo "Application stopped"