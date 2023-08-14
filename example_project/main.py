def print_banner() -> None:
    banner = f"""
##############################################################################
#
# Welcome to the Python Poetry image!
#
# Use this docker image by mounting your code or repo, containing a
# pyproject.toml and main.py, in the /code volume in the container.
# Alternatively a different python file can be executed by changing the
# environment variable $PYTHON_MAIN_FILE.
#
##############################################################################
"""
    print(banner)


if __name__ == "__main__":
    print_banner()
