#!/usr/bin/env bash

set -e
readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${SCRIPT_DIR}/../_shared.sh

module_header "Atom"

section_header "Unsymlinking configuration folder"
unsymlink_dotfile .atom
echo ""

exit 0
