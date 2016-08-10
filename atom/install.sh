#!/usr/bin/env bash

set -e
readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${SCRIPT_DIR}/../scripts/_shared.sh

module_header "Atom"

section_header "Symlinking configuration folder"
symlink_dotfile "${SCRIPT_DIR}/.atom"
echo ""

section_header "Installing themes"
themes=( monokai-seti seti-ui )
for theme in "${themes[@]}"; do
  apm install ${theme}
done
echo ""

section_header "Installing packages"
packages=( autoclose-html colorful-json dash editorconfig highlight-line
  highlight-selected language-docker linter markdown-preview pigments todo-show )
for package in "${packages[@]}"; do
  apm install ${package}
done
echo ""

exit 0
