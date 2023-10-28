FROM python:3.11

# install poetry in the container
RUN export POETRY_PATH=/opt/poetry && \
    # create a venv for poetry
    python3 -m venv $POETRY_PATH && \
    # install the requirements of poetry
    $POETRY_PATH/bin/pip install --no-cache-dir -U pip setuptools && \
    # install poetry itself in the venv
    $POETRY_PATH/bin/pip install --no-cache-dir poetry && \
    # create a symlink to poetry in /bin
    ln -s $POETRY_PATH/bin/poetry /bin/poetry && \
    # make sure to create the .venv in the project folder
    poetry config virtualenvs.in-project true && \
    # create the needed directories
    mkdir -p /scripts /code;

# copy the content of the scripts directory into the container
COPY scripts/* /scripts

# copy the example project to the container
COPY example_project/* /code

# set the environment default
ENV PYTHON_MAIN_FILE=main.py
ENV REPO_URL=
ENV REPO_BRANCH=master
ENV REPO_CLONE_PATH=repo
ENV REPO_PREPARE_SCRIPT=

# add the container labels
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vcs-url=https://github.com/HetorusNL/python-poetry
LABEL org.opencontainers.image.authors=tim@hetorus.nl
LABEL org.opencontainers.image.source=https://github.com/HetorusNL/python-poetry
LABEL org.opencontainers.image.description="Python docker image with poetry pre-installed"
LABEL org.opencontainers.image.licenses=MIT

# set the workdir and the entrypoint of the container
WORKDIR /code
ENTRYPOINT ["/scripts/run.sh"]
