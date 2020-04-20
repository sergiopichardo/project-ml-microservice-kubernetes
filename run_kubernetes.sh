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
# Create a deployment 
kubectl create deployment $name --image=$dockerpath
# List deployments
kubectl get deployments
# NOTE: kubectl run --generator=deployment/apps.v1 is DEPRECATED and will be removed in a future version. 
#   Use kubectl run --generator=run-pod/v1
kubectl run --generator=run-pod/v1 $name --image=$dockerpath --port=80

# wait until pods are running to execute next command
sleep 3 & 
wait
printf "\n"
printf "\n"


# Step 3:
# List kubernetes pods
echo "----------------------------------------------------"
echo "                List Kubernetes Pods                "
echo "----------------------------------------------------"
kubectl get pods
printf "\n"
printf "\n"


# Step 4:
# Forward the container port to a host
echo "----------------------------------------------------"
echo "          Forward Container Port to Host            "
echo "----------------------------------------------------"
kubectl port-forward deployment/$name 8000:80
printf "\n"
printf "\n"
