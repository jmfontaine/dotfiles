#!/usr/bin/env bash

set -e
readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${SCRIPT_DIR}/../scripts/_shared.sh

module_header "Git"

section_header "Unsymlinking Git configuration files"
unsymlink_dotfile .gitconfig
unsymlink_dotfile .gitignore
echo ""

exit 0
