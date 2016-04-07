#!/usr/bin/env bash

set -e
readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${SCRIPT_DIR}/_shared.sh

find ${ROOT_DIR} -mindepth 2 -type f -name update.sh -exec sh -c {} \;

exit 0
