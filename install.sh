#!/usr/bin/env bash

set -e
readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${SCRIPT_DIR}/_shared.sh

# Install Homebrew first
${ROOT_DIR}/homebrew/install.sh

# Install everything else
find ${ROOT_DIR} -mindepth 2 -type f -not -path "${ROOT_DIR}/homebrew/*" -name install.sh -exec sh -c {} \;

exit 0
