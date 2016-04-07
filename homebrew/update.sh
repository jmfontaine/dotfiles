#!/usr/bin/env bash

set -e
readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${SCRIPT_DIR}/../_shared.sh

header "Homebrew"
if test $(which brew); then
  echo "Updating Homebrew and formulas list"
  brew update

  echo "Upgrading installed Homebrew formulas"
  brew upgrade

  echo "Cleaning up Homebrew temporary files"
  brew cleanup
  brew cask cleanup
else
  echo "homebrew is not installed, skipping"
fi
echo ""

exit 0
