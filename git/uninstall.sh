#!/usr/bin/env bash

set -e
readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${SCRIPT_DIR}/../_shared.sh

header "Unsymlinking Git configuration files"
unsymlink_dotfile .gitconfig
unsymlink_dotfile .gitignore
echo ""

exit 0
