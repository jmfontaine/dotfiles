#!/bin/sh

set -e

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install 1Password and chezmoi
brew install 1password 1password-cli chezmoi

# Log into 1Password
eval $(op signin)

# Setup local machine
exec chezmoi init --apply --keep-going jmfontaine
