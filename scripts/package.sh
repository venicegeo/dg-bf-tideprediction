#!/bin/bash -e

cd $(dirname $(dirname $0))  # Return to root
. scripts/_check_environment.sh
################################################################################

ARCHIVE_FILENAME='bf-tideprediction.zip'
FILE_LIST='
    bftideprediction
    Procfile
    environment.yml
'

################################################################################


echo -e "\nBuilding archive\n"

rm -f $ARCHIVE_FILENAME

zip -r $ARCHIVE_FILENAME $FILE_LIST -x "*/__pycache__/*" "*.pyc" "*.pyo" "*."
