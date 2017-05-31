#!/bin/bash -e

cd $(dirname $(dirname $0))  # Return to root
. scripts/_check_environment.sh
################################################################################


. $VIRTUALENV_ROOT/bin/activate

FLASK_APP=bftideprediction/__init__.py FLASK_DEBUG=1 flask run
