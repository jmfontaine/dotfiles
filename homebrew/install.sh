#!/usr/bin/env bash

set -e
readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${SCRIPT_DIR}/../_shared.sh

module_header "Homebrew"

section_header "Installing Homebrew"
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "already installed, skipping"
fi
echo ""

section_header "Installing formulas"
brew bundle --file="${SCRIPT_DIR}"/Brewfile
echo ""

section_header "Cleaning up Homebrew temporary files"
brew cleanup
brew cask cleanup
echo ""

exit 0
