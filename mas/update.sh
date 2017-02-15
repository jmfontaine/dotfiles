#!/usr/bin/env bash

set -e
readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${SCRIPT_DIR}/../scripts/_shared.sh

module_header "mas"

if test $(which mas); then
  section_header "Updating Apple Store applications"
  mas upgrade
  echo ""
else
  echo "mas is not installed, skipping"
fi
echo ""

exit 0
