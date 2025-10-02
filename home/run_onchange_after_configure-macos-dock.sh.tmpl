#!/bin/bash

set -eu

trap 'killall Dock' EXIT

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Don’t show recent applications in the Dock
defaults write com.apple.dock show-recents -bool false

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Remove all applications from the Dock
dockutil --no-restart --remove all

# Add applications to the Dock
declare -a applications=(
    "/Applications/Akiflow.app"
    "/System/Applications/Calendar.app"
    "/System/Volumes/Preboot/Cryptexes/App/System/Applications/Safari.app"
    "/Applications/Notion.app"
)
for application in "${applications[@]}"; do
	dockutil --no-restart --add "${application}"
done
