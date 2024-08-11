#!/bin/bash

# Set variables
PORT_NUMBER=1000
DOCKER_IMAGE_NAME="apache"

# Navigate to the httpd-docker directory
cd httpd-docker

# List the contents of the directory
ls

# Check if a container is running on the specified port
EXISTING_CONTAINER=$(docker ps -q -f "publish=${PORT_NUMBER}")

if [ -n "${EXISTING_CONTAINER}" ]; then
    # If a container is running, stop and remove it
    docker stop ${EXISTING_CONTAINER}
    docker rm ${EXISTING_CONTAINER}
    echo "Existing container stopped and removed"
fi

# Build the Docker image with the specified name
docker build -t ${DOCKER_IMAGE_NAME} .

# Run the Docker container on the specified port
docker run -d -p ${PORT_NUMBER}:80 ${DOCKER_IMAGE_NAME}
echo "New Docker container started on port ${PORT_NUMBER} with image ${DOCKER_IMAGE_NAME}"

echo "Done"

