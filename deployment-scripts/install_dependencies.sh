#!/bin/bash
yum update -y
yum install -y docker aws-cli

# Start Docker service
systemctl start docker
systemctl enable docker
usermod -a -G docker ec2-user

# ECR login moved to start_server.sh