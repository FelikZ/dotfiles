#!/bin/bash
brew tap discoteq/discoteq
brew install flock \
    git \
    bash-completion
brew cask install osxfuse
brew install encfs

# install software
# http://triq.net/articles/mouse-acceleration-download
# https://pilotmoon.com/scrollreverser/
# https://pqrs.org/osx/karabiner/complex_modifications/#mouse_button
# defaults write .GlobalPreferences com.apple.mouse.scaling -1
# defaults write -g KeyRepeat -int 1
# defaults write -g InitialKeyRepeat -int 1
# defaults write -g ApplePressAndHoldEnabled -bool false
# Dropbox
# Karabiner elements - ` and caps lock fix
