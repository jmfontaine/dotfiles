#!/usr/bin/env bash

set -e
readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${SCRIPT_DIR}/../_shared.sh

module_header "ZSH"

section_header "Installing zgen"
if [ ! -d "${VENDOR_DIR}/zgen" ]; then
  git clone https://github.com/tarjoilija/zgen.git ${VENDOR_DIR}/zgen
else
  echo "already installed, skipping"
fi
echo ""

section_header "Symlinking ZSH configuration file"
symlink_dotfile "${SCRIPT_DIR}/.zshrc"
echo ""

section_header "Reloading ZSH configuration"
echo "run 'source ~/.zshrc' to reload ZSH configuration"
echo ""

exit 0
