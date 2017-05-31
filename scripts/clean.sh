#!/bin/bash -e

cd $(dirname $(dirname $0))  # Return to root
################################################################################


echo
echo "Cleaning up"
rm -rfv \
    vendor \
    report \
    .coverage \
    bf-tideprediction.zip \
    | sed 's/^/    - /'
