#!/usr/bin/env bash

set -e
readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${SCRIPT_DIR}/../_shared.sh

module_header "OS X"

section_header "Disabling the ‘Last login’ message when opening a new Terminal window:"
symlink_dotfile "${SCRIPT_DIR}/.hushlogin"
echo ""

exit 0
