#!/usr/bin/env bash

set -e
readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${SCRIPT_DIR}/../scripts/_shared.sh

module_header "OS X"

section_header "Disabling the ‘Last login’ message when opening a new Terminal window:"
symlink_dotfile "${SCRIPT_DIR}/.hushlogin"
echo ""

section_header "Configure Dock"
defaults write com.apple.dock autohide -bool true # Automatically hide and show the Dock
defaults write com.apple.dock mimimize-to-application -bool true # Mimnimize windows into application icon
defaults write com.apple.dock tilesize -int 54 # Make icons bigger
killall Dock
echo ""

section_header "Configure Dock Items"
dockutil --remove all --no-restart
dockutil --add /Applications/Path\ Finder.app --no-restart
dockutil --add /Applications/Google\ Chrome.app --no-restart
dockutil --add /Applications/Microsoft\ Outlook.app --no-restart
dockutil --add /Applications/Evernote.app --no-restart
dockutil --add /Applications/Atom.app --no-restart
dockutil --add /Applications/iTunes.app --no-restart
dockutil --add /Applications --view grid --display folder --sort name --no-restart
killall Dock
echo ""

section_header "Configure Menu Bar"
defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool true # Enable transparency
defaults write NSGlobalDomain AppleInterfaceStyle -string Dark # Use dark Menu Bar and Dock
echo ""

section_header "Configure Windows"
defaults write NSGlobalDomain AppleActionOnDoubleClick -string Maximize # Double-click a window's title bar to zoom
echo ""

section_header "Configure Trackpad"
defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 2 # Enable right-click in the lower right corner
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 0 # Disable "Look up & data detectors" gesture
defaults write NSGlobalDomain com.apple.trackpad.forceClick -int 1 # Enable haptic feedback
defaults write NSGlobalDomain com.apple.trackpad.scaling -int 1 # Set cursor speed when using trackpad
echo ""

section_header "Configure Mouse"
defaults write com.apple.AppleMultitouchMouse MouseButtonMode -string TwoButton # Enable right-click
defaults write NSGlobalDomain com.apple.mouse.scaling -float 1.5 # Increase mouse speed
echo ""

exit 0
