#!/bin/bash
brew tap discoteq/discoteq
brew install flock \
    git \
    bash-completion
brew cask install osxfuse
brew install encfs

# install software
# http://www.usboverdrive.com/USBOverdrive/Download.html - mouse accel fix
# http://triq.net/articles/mouse-acceleration-download
# defaults write .GlobalPreferences com.apple.mouse.scaling -1
# defaults write -g KeyRepeat -int 1
# defaults write -g InitialKeyRepeat -int 1
# defaults write -g ApplePressAndHoldEnabled -bool false
# Dropbox
# Karabiner elements - ` and caps lock fix
