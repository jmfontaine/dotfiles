#!/usr/bin/env bash

set -e
readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${SCRIPT_DIR}/../scripts/_shared.sh

module_header "ZSH"

section_header "Symlinking ZSH configuration file"
symlink_dotfile "${SCRIPT_DIR}/.zshrc"
echo ""

section_header "Reloading ZSH configuration"
echo "run 'source ~/.zshrc' to reload ZSH configuration"
echo ""

exit 0
