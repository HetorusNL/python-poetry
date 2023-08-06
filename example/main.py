def print_banner() -> None:
    banner = f"""
##############################################################################
#
# Welcome to the Python Poetry image!
#
# Use this docker image by mounting your code or repo in the /code volume,
# and providing a pyproject.toml and $PYTHON_MAIN_FILE (main.py) to run.
#
##############################################################################
"""
    print(banner)


if __name__ == "__main__":
    print_banner()
