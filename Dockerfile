FROM python:latest

# install poetry in the container
RUN export POETRY_PATH=/opt/poetry && \
    # create a venv for poetry
    python3 -m venv $POETRY_PATH && \
    # install the requirements of poetry
    $POETRY_PATH/bin/pip install -U pip setuptools && \
    # install poetry itself in the venv
    $POETRY_PATH/bin/pip install poetry && \
    # create a symlink to poetry in /bin
    ln -s $POETRY_PATH/bin/poetry /bin/poetry && \
    # make sure to create the .venv in the project folder
    poetry config virtualenvs.in-project true && \
    # create the needed directories
    mkdir -p /scripts /code;
# TODO: add cleanup of `pip install` here

# copy the content of the scripts directory into the container
COPY scripts/* /scripts

# copy the example project to the container
COPY example_project/* /code

# set the environment default
ENV PYTHON_MAIN_FILE=main.py

# set the workdir and the entrypoint of the container
WORKDIR /code
ENTRYPOINT ["/scripts/run.sh"]
