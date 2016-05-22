#!/usr/bin/env bash

set -e
readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${SCRIPT_DIR}/../_shared.sh

module_header "Atom"

if test $(which apm); then
  section_header "Updating packages"
  apm upgrade --confirm=false
  echo ""

  section_header "Cleaning up unused packages"
  apm clean
  echo ""
else
  echo "Atom is not installed, skipping"
fi
echo ""

exit 0
