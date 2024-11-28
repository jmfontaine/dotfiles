#!/bin/bash

set -eu

###############################################################################
# Finder
###############################################################################

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Set the default view style for folders without custom setting to list view
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Always search current folder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

###############################################################################
# Keyboard
###############################################################################

defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2

###############################################################################
# Mouse & Trackpad
###############################################################################

# Right click for magic mouse
defaults write com.apple.AppleMultitouchMouse MouseButtonMode -string TwoButton
