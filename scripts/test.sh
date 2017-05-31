#!/bin/bash -e

cd $(dirname $(dirname $0))  # Return to root
. scripts/_check_environment.sh
################################################################################


. $VIRTUALENV_ROOT/bin/activate


nosetests --with-coverage --cover-erase --cover-package=bftideprediction
coverage xml -o report/coverage/coverage.xml
coverage html -d report/coverage/html


if [ "$1" == '--with-integration' ]; then
    remote_host="${2:-http://localhost:5000}"
    echo -e "\nRunning integration test against '$remote_host'...\n"

    curl -f "$remote_host/tides" -XPOST -d@test/fixtures/api_test_data.json -H'Content-Type: application/json' > report/integration_test_result.json

    echo "OK"
fi
