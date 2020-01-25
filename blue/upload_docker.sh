#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath=geepee2017/blueimage

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login --username geepee2017
docker tag blueimage geepee2017/blueimage
# Step 3:
# Push image to a docker repository
docker push geepee2017/blueimage
