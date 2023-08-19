# Python Poetry

Run your python code easily using this docker image with the latest version of Python3 and Poetry pre-installed.

// TODO: add badges here

## Usage

Use this docker image by mounting your code or repo, containing a `pyproject.toml` and `main.py`, in the `/code` volume in the container.
Alternatively a different python file can be executed by changing the environment variable `PYTHON_MAIN_FILE`.

The docker image is available at the following container registries:

- Docker hub: `hetorusnl/python-poetry`
- Github container registry: `ghcr.io/hetorusnl/python-poetry`

### Examples

To help you getting started, several examples using the docker cli and docker-compose are provided below.

### Docker Run

The simplest example runs the container with the included example project:

```bash
docker run -it --rm hetorusnl/python-poetry
```

To run your own python file and stop the container after the script finishes, use the following snippet.  
Supplying the `PYTHON_MAIN_FILE` environment variable is optional and it defaults to `main.py`.  
Whether to supply a port to forward to the container depends on the functionality of your script, and can be added by adding this line to the docker run command above the image name: `-p <external>:<internal> \` .
This will expose port `<internal>` from inside the container to `<external>` on the host.

```bash
docker run -it --rm \
  -e PYTHON_MAIN_FILE=main.py \
  -v /path/to/project:/code \
  hetorusnl/python-poetry
```

To run a python file in the background and detach it from the terminal, use the following.

```bash
docker run -d --name=python-poetry \
  -e PYTHON_MAIN_FILE=main.py \
  -v /path/to/project:/code \
  hetorusnl/python-poetry
```

### Docker Compose

Run this example docker compose file using `docker compose up` to attach it to the terminal, or `docker compose up -d` to run in the background and detach it from the terminal. This will run the example project, and is also available in the repository as `docker-compose.yml`

```docker-compose
version: "3"

services:
  python-poetry:
    image: hetorusnl/python-poetry
    container_name: python-poetry
```

A more advanced docker compose example is shown below. Modify the environment, ports and volumes according to your application.

```docker-compose
version: "3"

services:
  python-poetry:
    image: hetorusnl/python-poetry
    container_name: python-poetry
    environment:
      - PYTHON_MAIN_FILE=main.py # optional to run a different file
    ports:
      - 80:80 # optional, exposes port 80 from inside the container to the host
    volumes:
      - /path/to/project:/code # if not provided, runs the included example project
```

## FAQ

## License

MIT License, Copyright (c) 2023 Tim Klein Nijenhuis <tim@hetorus.nl>
