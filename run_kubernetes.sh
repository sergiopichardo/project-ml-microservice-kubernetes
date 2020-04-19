#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path (Docker Hub image)
dockerpath=sergiopichardo/project-ml-microservice-kubernetes
name=project-ml-microservice-kubernetes

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run --image=$dockerpath --port=80

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward $name 8000:80
