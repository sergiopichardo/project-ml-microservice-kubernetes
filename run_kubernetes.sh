#!/usr/bin/env bash

# Step 1:
# This is your Docker ID/path (Docker Hub image)
name=project-ml-microservice-kubernetes
dockerpath=sergiopichardo/project-ml-microservice-kubernetes

# Step 2
# Run the Docker Hub container with kubernetes
# NOTE: kubectl run --generator=deployment/apps.v1 is DEPRECATED and will be removed in a future version. 
#   Use kubectl run --generator=run-pod/v1
docker apply -f $dockerpath
kubectl run --generator=run-pod/v1 $name --image=$dockerpath --port=80


# Step 3:
# List kubernetes pods
kubectl get pods


# Step 4:
# Forward the container port to a host
kubectl port-forward $name 8000:80
