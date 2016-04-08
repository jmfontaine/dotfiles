#!/usr/bin/env bash

set -e
readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${SCRIPT_DIR}/../_shared.sh

module_header "Homebrew"

read -p "Are you sure you want to uninstall Homebrew? " -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo ""

  section_header "Uninstalling Homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)" -- --force
  echo ""

  section_header "Deleting Casks"
  rm -rf /opt/homebrew-cask/Caskroom
  echo ""

  section_header "Restoring /usr/local original permissions"
  sudo chmod 0755 /usr/local
  sudo chgrp wheel /usr/local
  echo ""
else
  echo "skipping"
fi

exit 0
