#!/usr/bin/env bash

set -e
readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${SCRIPT_DIR}/../scripts/_shared.sh

module_header "OS X"

section_header "Enabling the ‘Last login’ message when opening a new Terminal window"
rm "${HOME}/.hushlogin"
echo ""

exit 0
