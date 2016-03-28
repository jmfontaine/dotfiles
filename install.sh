#!/usr/bin/env bash

set -e

readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Install Homebrew first
${SCRIPT_DIR}/homebrew/install.sh

# Install everything else
find ${SCRIPT_DIR} -mindepth 2 -type f -not -path "${SCRIPT_DIR}/homebrew/*" -name install.sh -exec sh -c {} \;

exit 0
