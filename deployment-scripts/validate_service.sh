#!/bin/bash
set -e
cd /opt/nodejs-app || exit 1 # Change to the application directory

echo "Validating application deployment..."

# Wait for application to start
sleep 30

# Check if container is running (using docker-compose ps)
if ! docker-compose ps | grep -q "Up"; then
    echo "ERROR: docker-compose containers are not running"
    docker-compose logs || true
    exit 1
fi

# Check application health
echo "Checking application health on port 3005..."
for i in {1..10}; do
    # Corrected health check port to 3005
    if curl -f http://localhost:3005/health 2>/dev/null; then
        echo "✅ Application is healthy and responding on port 3005"
        exit 0
    fi
    echo "Attempt $i: Application not ready on port 3005, waiting 10 seconds..."
    sleep 10
done

echo "❌ Application health check failed on port 3005"
docker-compose logs || true
exit 1