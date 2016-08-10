#!/usr/bin/env bash

set -e

readonly ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
readonly VENDOR_DIR=${VENDOR_DIR:-$ROOT_DIR/vendor}

readonly BLUE_BOLD="\\033[1;34m"
readonly GREEN="\\033[0;32m"
readonly RED="\\033[0;31m"
readonly RESET="\\033[0m"

module_header () {
  echo -e "${BLUE_BOLD}${1}${RESET}"
}

section_header () {
  echo -e "${GREEN}› ${1}${RESET}"
}

symlink_dotfile () {
  local src=$1 dst="${HOME}/${1##*/}"

  if [ -f "${dst}" -o -d "${dst}" -o -L "${dst}" ]; then
    echo "${src##*/} already exists, skipping"
  else
    ln -s "${src}" "${dst}"
    echo "symlinked ${src##*/}"
  fi
}

unsymlink_dotfile () {
  local file="${HOME}/$1"

  if [ -L "${file}" ]; then
    rm "${file}"
    echo "unsymlinked ${file##*/}"
  else
    echo "${file##*/} doesn't exist, skipping"
  fi
}
