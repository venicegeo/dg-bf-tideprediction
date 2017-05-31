#!/bin/bash -e

cd $(dirname $(dirname $0))  # Return to root
################################################################################


export VIRTUALENV_ROOT=venv
export HISTORICAL_DATA_FILE=bftideprediction/data/fdh.sqlite
export HISTORICAL_DATA_ARCHIVE=fdh.sqlite.tar.gz


################################################################################

if [ ! -d "$VIRTUALENV_ROOT" -o ! -f "$HISTORICAL_DATA_FILE" ]; then
    echo -e "It looks like your development environment is not properly set up.\n"
    read -p "Would you like to set it up now (y/N)? " -r

    if [[ ! "$REPLY" =~ ^[Yy] ]]; then
        echo -e "\nExiting...\n"
        exit 1
    fi

    echo
    printf '=%.0s' {1..80}
    echo

    ############################################################################

    echo -e "\nCreating virtual Python environment at '$VIRTUALENV_ROOT'\n"

    rm -rf $VIRTUALENV_ROOT

    if ! (which python2.7 && python2.7 -c 'import sys; assert (3, 0) > sys.version_info >= (2, 7) ') >/dev/null 2>&1; then
        echo -e "\nPython 2.7 or higher must be installed first"
        exit 1
    fi

    virtualenv --python=python2.7 $VIRTUALENV_ROOT

    . $VIRTUALENV_ROOT/bin/activate

    echo -e "\nInstalling Python dependencies\n"

    pip install $(grep numpy requirements.txt)
    pip install $(grep -v numpy requirements.txt)


    ############################################################################

    echo -e "\nExtracting historical tide data into '$VIRTUALENV_ROOT'\n"

    rm -rf $HISTORICAL_DATA_FILE

    tar -xzvf "$HISTORICAL_DATA_ARCHIVE" -C $(dirname $HISTORICAL_DATA_FILE)


    ############################################################################

    echo
    printf '=%.0s' {1..80}
    echo
fi
