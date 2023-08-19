#!/bin/bash

# magic options for bash to make scripts safer
set -Eeuxo pipefail

# configure some environment variables used later
DOCKER_TAG=test-image

# build the docker image with the configured registry and tag
docker build --build-arg VCS_REF=`git rev-parse --short HEAD` --pull --tag "$CI_REGISTRY:$DOCKER_TAG" .
# push the built image to the registry
docker push "$CI_REGISTRY:$DOCKER_TAG"
