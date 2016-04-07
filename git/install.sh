#!/usr/bin/env bash

set -e
readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${SCRIPT_DIR}/../_shared.sh

header "Symlinking Git configuration files"
symlink_dotfile "${SCRIPT_DIR}/.gitconfig"
symlink_dotfile "${SCRIPT_DIR}/.gitignore"
echo ""

exit 0
