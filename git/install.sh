#!/usr/bin/env bash

set -e
readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${SCRIPT_DIR}/../scripts/_shared.sh

module_header "Git"

section_header "Symlinking Git configuration files"
symlink_dotfile "${SCRIPT_DIR}/.gitconfig"
symlink_dotfile "${SCRIPT_DIR}/.gitignore"
echo ""

exit 0