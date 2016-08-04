#!/bin/bash

export PULSAR_LOCAL_ENV=/usr/share/pulsar/env_container.sh
export PULSAR_VIRTUALENV=/usr/share/pulsar/venv
. $PULSAR_LOCAL_ENV

# Run the tests...
export TOX_WORK_DIR=/tmp
export USER=root
export HOME=/tmp

# Old hard-coded tests.
#cd /pulsar; pyflakes pulsar test && flake8 --exclude test_tool_deps.py --max-complexity 9 pulsar test && nosetests

echo "Running pulsar server"
cd /usr/share/pulsar/; pulsar

echo "Running pulsar-check"
cd /usr/share/pulsar/; pulsar-check