#!/usr/bin/env bash

# Step 1:
# This is your Docker ID/path (Docker Hub image)
dockerpath=sergiopichardo/project-ml-microservice-kubernetes
name=project-ml-microservice-kubernetes

# Step 2
# Run the Docker Hub container with kubernetes
echo "----------------------------------------------------"
echo "      Run Docker Hub Container with Kubernetes      "
echo "----------------------------------------------------"
docker login
kubectl create deployment $name --image=$dockerpath
kubectl run --generator=run-pod/v1 $name --image=$dockerpath --port=80
printf "\n"
printf "\n"

# Step 3:
# List kubernetes pods
echo "----------------------------------------------------"
echo "                List Kubernetes Pods                "
echo "----------------------------------------------------"
kubectl get deployments
kubectl get pods 
printf "\n"
printf "\n"

# wait until pods are running to execute next command
echo "Waiting 10 seconds for pod to be ready..."
sleep 10 & 
wait

# Step 4:
# Forward the container port to a host
echo "----------------------------------------------------"
echo "          Forward Container Port to Host            "
echo "----------------------------------------------------"
kubectl port-forward deployment/$name 8000:80
printf "\n"
printf "\n"
