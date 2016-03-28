#!/usr/bin/env bash

set -e

readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

find ${SCRIPT_DIR} -mindepth 2 -type f -name upgrade.sh -exec sh -c {} \;

exit 0
