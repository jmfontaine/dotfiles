#!/bin/bash

set -eufo pipefail

echo ""
echo "🤚  This script will set up your local machine."
read -n 1 -r -s -p $'    Press any key to continue or Ctrl+C to abort...\n\n'

if command -v brew &>/dev/null; then
  echo "🍺  Homebrew already installed. Skipping installation."
else
  echo "🍺  Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if command -v chezmoi &>/dev/null; then
  echo "🏠  chezmoi already installed. Skipping installation."
else
  echo "🏠  Installing chezmoi"
  brew install chezmoi
fi

if [ -d "$HOME/.local/share/chezmoi/.git" ]; then
  echo "🚀  chezmoi already initialized. Skipping initialization."
else
  echo "🚀  Bootstrapping machine"
  exec chezmoi init --apply --keep-going jmfontaine
fi