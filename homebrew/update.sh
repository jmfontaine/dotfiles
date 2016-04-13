#!/usr/bin/env bash

set -e
readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${SCRIPT_DIR}/../_shared.sh

module_header "Homebrew"

if test $(which brew); then
  section_header "Updating Homebrew and formulas list"
  brew update
  echo ""

  section_header "Upgrading installed Homebrew formulas"
  brew upgrade
  echo ""

  section_header "Cleaning up Homebrew temporary files"
  brew cleanup
  brew cask cleanup
  echo ""
else
  echo "homebrew is not installed, skipping"
fi
echo ""

exit 0
