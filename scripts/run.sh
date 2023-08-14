#!/bin/bash

# magic options for bash to make scripts safer
set -Eeuxo pipefail

# TODO: add section about cloning a git repo using the environment here

# no environment provided:
# simply run poetry install and poetry run python3 $PYTHON_MAIN_FILE
poetry install
poetry run python3 $PYTHON_MAIN_FILE
