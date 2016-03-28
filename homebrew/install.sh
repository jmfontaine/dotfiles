#!/usr/bin/env bash

set -e

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "› Installing Homebrew"
if test ! $(which brew)
then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "already installed."
fi
echo ""

echo "› Installing formulas"
brew bundle --file="${CURRENT_DIR}"/Brewfile
echo ""

exit 0
