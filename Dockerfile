FROM python:latest

# install poetry in the container
RUN export POETRY_PATH=/opt/poetry; \
    # create a venv for poetry
    python3 -m venv $POETRY_PATH; \
    # install the requirements of poetry
    $POETRY_PATH/bin/pip install -U pip setuptools; \
    # install poetry itself in the venv
    $POETRY_PATH/bin/pip install poetry; \
    # create a symlink to poetry in /bin
    ln -s $POETRY_PATH/bin/poetry /bin/poetry;

# make sure to create the .venv in the project folder
RUN poetry config virtualenvs.in-project true

# copy some files into the container
RUN mkdir -p /scripts
COPY scripts/* scripts/

# add the example project to the container
RUN mkdir -p /code
COPY example_project/* /code

# set the environment default
ENV PYTHON_MAIN_FILE=main.py

WORKDIR /code
ENTRYPOINT ["/scripts/run.sh"]
