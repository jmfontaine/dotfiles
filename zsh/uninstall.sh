#!/usr/bin/env bash

set -e
readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${SCRIPT_DIR}/../_shared.sh

module_header "ZSH"

section_header "Uninstalling zgen"
if [ -d "${VENDOR_DIR}/zgen" ]; then
  rm -rf "${VENDOR_DIR}/zgen"
else
  echo "zgen is not installed, skipping"
fi
echo ""

section_header "Uninstalling zgen dependencies"
if [ -d "${HOME}/.zgen" ]; then
  rm -rf "${HOME}/.zgen"
else
  echo "zgen dependencies are not installed, skipping"
fi
echo ""

section_header "Unsymlinking ZSH configuration file"
unsymlink_dotfile .zshrc
echo ""

exit 0
