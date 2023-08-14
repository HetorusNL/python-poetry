#!/bin/bash

# magic options for bash to make scripts safer
set -Eeuxo pipefail

# build the docker container
sudo docker build --progress=plain -t python-poetry-latest-test .
