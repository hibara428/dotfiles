#!/bin/bash

if [ "$(uname)" != "Darwin" ] ; then
  echo "Not macOS!"
  exit 1
fi

# ====================
#
# Base
#
# ====================

# Show bluetooth in the menu bar
defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool true

# Disable the "Are you sure you want to open this application?" dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable live conversion
defaults write com.apple.inputmethod.Kotoeri JIMPrefLiveConversionKey -bool false

# Increase keyboard initial delay
defaults write -g InitialKeyRepeat -int 15

# Increase keyboard repeat rate
defaults write -g KeyRepeat -int 2

# Use the Fn key as a standard function key
defaults write -g com.apple.keyboard.fnState -bool true

# Show files with all extensions
defaults write -g AppleShowAllExtensions -bool true

# ====================
#
# DesktopServices
#
# ====================
# Avoid creating `.DS_Store` files on network volumes or USB devices
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# ====================
#
# Dock
#
# ====================
# Automatically hide or show the Dock
defaults write com.apple.dock autohide -bool true

# ====================
#
# Finder
#
# ====================
# Show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show the full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Show path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# Show status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Show Tab bar in Finder
defaults write com.apple.finder ShowTabView -bool true

# ====================
#
# SystemUIServer
#
# ====================
# Display battery level in the menu bar
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Display date, day, and time in the menu bar
defaults write com.apple.menuextra.clock DateFormat -string 'EEE d MMM HH:mm'


for app in "Dock" \
  "Finder" \
  "SystemUIServer"; do
  killall "${app}" &> /dev/null
done