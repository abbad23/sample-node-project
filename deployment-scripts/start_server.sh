#!/bin/bash
set -e
cd /opt/nodejs-app || exit 1 # Change to the application directory

echo "Logging in to Amazon ECR..."
AWS_REGION=$(curl -s http://169.254.169.254/latest/meta-data/placement/region)
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
ECR_REGISTRY="$ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com"
# Corrected image name to nodejs-app
IMAGE_URI="$ECR_REGISTRY/nodejs-app:latest"

# Login to ECR
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_REGISTRY

echo "Pulling latest image: $IMAGE_URI"
# Pull latest image
docker pull $IMAGE_URI

echo "Starting the application using docker-compose..."
# Run new container using docker-compose
# Ensure your docker-compose.yml maps 3005:3005
docker-compose up -d

echo "Application started successfully"