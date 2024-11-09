#!/bin/bash

# Step 1: Build Docker images for frontend and backend
docker-compose build

# Step 2: Tag the images with the latest version
docker tag devops-task_frontend <dhirendrasingh4111814>/frontend:latest
docker tag devops-task_backend <dhirendrasingh4111814>/backend:latest

# Step 3: Push the images to Docker Hub
docker push <dhirendrasingh4111814>/frontend:latest
docker push <dhirendrasingh4111814>/backend:latest

# Step 4: Run the Docker Compose file to start the application
docker-compose up -d
