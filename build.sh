#!/bin/bash

IMAGE_NAME="archtest"

# Delete old image if it exists
if docker image inspect "$IMAGE_NAME" >/dev/null 2>&1; then
    echo "Removing existing image: $IMAGE_NAME"
    docker rmi -f "$IMAGE_NAME"
fi

# Build new image without cache
echo "Building new image: $IMAGE_NAME (no cache)"
docker build --no-cache -t "$IMAGE_NAME" .
