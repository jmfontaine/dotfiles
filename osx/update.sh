#!/usr/bin/env bash

set -e
readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${SCRIPT_DIR}/../_shared.sh

module_header "OS X"

section_header "Updating Apple Store Applications"
sudo softwareupdate --all --install
echo ""

exit 0
