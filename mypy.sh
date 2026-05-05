#! /usr/bin/env bash
#
# this script runs flake8 on all clean files.

set -e
echo "Executing mypy..."

# Activate the virtual environment. 
source .venv/bin/activate

python -m mypy \
    blockies/ \
    test/ \
    "$@"
