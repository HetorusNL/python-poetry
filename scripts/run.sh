#!/bin/bash

# magic options for bash to make scripts safer
set -Eeuxo pipefail

# if a REPO_URL is provided, clone the repo and enter the directory
if [[ -n $REPO_URL ]]; then
    # make sure the REPO_CLONE_PATH is empty before cloning the repo
    rm -rf $REPO_CLONE_PATH
    # clone the repo as a 'shallow clone' and a 'single branch' to save space and time
    git clone --filter=tree:0 --single-branch --branch=$REPO_BRANCH $REPO_URL $REPO_CLONE_PATH
    # enter the cloned repo folder
    pushd $REPO_CLONE_PATH
fi

# if a REPO_PREPARE_SCRIPT is provided, execute that script before running python
if [[ -n $REPO_PREPARE_SCRIPT ]]; then
    $REPO_PREPARE_SCRIPT
fi

# run poetry install and run the PYTHON_MAIN_FILE script
poetry install
poetry run python3 $PYTHON_MAIN_FILE

if [[ -z $REPO_URL ]]; then
    # transition out of the REPO_URL folder
    popd
fi
