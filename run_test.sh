#! /usr/bin/env bash
#
# this script should pass before committing. It executes flake8 and pytest
# and has a non-zero exit code if one fails.
#
# The script will forward any command line arguments to pytest, e.g.:
#
#   $ ./run_test.sh -k test_blender_rending
#
# will only test the ``test_blender_rending`` function.
#


Color_Off='\033[0m'
Red='\033[0;31m'
Green='\033[0;32m'

function fail {
    echo -e "${Red}FLAKE8 Sanity FAILED!!!$Color_Off"
    exit 1
}

# Activate the virtual environment. 
source .venv/bin/activate

# Early stop the test if there are Python syntax errors or undefined names.
echo "Executing flake sanity checks..."
flake8 ./blockies \
       ./test  \
       ./examples \
       --select=E9,F63,F7,F82 \
       --show-source \
       --statistics || \
       fail

export COVERAGE_PROCESS_START="`pwd`/.coveragerc"
echo "Executing pytest..."
python -m pytest -v -s test/  \
    -m "not slow" \
    "$@"
pytest_ret=$?

./mypy.sh
mypy_ret=$?

./run_flake8.sh
flake_ret=$?

# if one is non-zero the sum is non-zero
exit_code=$((flake_ret + pytest_ret + mypy_ret))

Color_Off='\033[0m'
Red='\033[0;31m'
Green='\033[0;32m'

if [[ "$flake_ret" != "0" ]]; then
    echo -e "${Red}Flake8 Checks FAILED :($Color_Off"
else
    echo -e "${Green}Flake8 Checks PASSED :)$Color_Off"
fi

if [[ "$mypy_ret" != "0" ]]; then
    echo -e "${Red}MyPy Checks FAILED :($Color_Off"
else
    echo -e "${Green}MyPy Checks PASSED :)$Color_Off"
fi

if [[ "$pytest_ret" != "0" ]]; then
    echo -e "${Red}PyTest Unit Tests FAILED :($Color_Off"
else
    echo -e "${Green}PyTest Unit Tests PASSED :)$Color_Off"
fi

if [[ "$exit_code" != "0" ]]; then
    echo -e "${Red}Overall Checks FAILED :($Color_Off"
    exit 1
else
    echo -e "${Green}Overall Checks PASSED :)$Color_Off"
fi
