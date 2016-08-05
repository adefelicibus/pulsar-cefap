#!/bin/bash

export PULSAR_LOCAL_ENV=/usr/share/pulsar/env_container.sh
export PULSAR_VIRTUALENV=/usr/share/pulsar/venv
. $PULSAR_LOCAL_ENV

# Run the tests...
export TOX_WORK_DIR=/tmp
export USER=root
export HOME=/tmp

echo "Running pulsar server"
cd /usr/share/pulsar/; pulsar

echo "Running pulsar-check"
cd /usr/share/pulsar/; pulsar-check