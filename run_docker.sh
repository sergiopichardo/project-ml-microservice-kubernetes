#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
echo "----------------------------------------------------"
echo "                  Building Image                    "
echo "----------------------------------------------------"
docker build -t sergiopichardo/project-ml-microservice-kubernetes . 
printf "\n"
printf "\n"

# Step 2: 
# List docker images
# List the last created image
echo "----------------------------------------------------"
echo "                  Last Created Image                "
echo "----------------------------------------------------"
docker images | awk '{print $1}' | awk 'NR==2'
printf "\n"
printf "\n"
# Step 3: 
# Run flask app
echo "----------------------------------------------------"
echo "                  Running Image                     "
echo "----------------------------------------------------"
docker run -p 8000:80 sergiopichardo/project-ml-microservice-kubernetes
