#!/usr/bin/env bash

set -e

echo "› Updating Homebrew"
if test $(which brew)
then
  echo "updating Homebrew and formulas list"
  brew update

  echo "upgrading installed formulas"
  brew upgrade
else
  echo "homebrew is not installed, skipping"
fi
echo ""

exit 0
