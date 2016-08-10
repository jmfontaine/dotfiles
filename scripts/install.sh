#!/usr/bin/env bash

set -e
readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${SCRIPT_DIR}/_shared.sh

# Install Homebrew first
${ROOT_DIR}/homebrew/install.sh

# Install everything except Homebrew and ZSH
find ${ROOT_DIR} -mindepth 2 -type f -not -path "${ROOT_DIR}/homebrew/*" -not -path "${ROOT_DIR}/scripts/*" -not -path "${ROOT_DIR}/zsh/*" -name install.sh -exec sh -c {} \;

# Install ZSH last
${ROOT_DIR}/zsh/install.sh

exit 0
