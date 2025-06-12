#!/bin/bash
set -e

echo "Cleaning up previous deployment artifacts..."
# Ensure the target directory exists and is empty
mkdir -p /opt/nodejs-app
rm -rf /opt/nodejs-app/*

echo "Previous artifacts cleaned."

# ECR login moved to start_server.sh
