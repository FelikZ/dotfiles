#!/bin/bash
brew tap discoteq/discoteq
brew install flock \
    bash \
    tree \
    git \
    bash-completion \
    jq \
    gifsicle \
    watch
brew cask install osxfuse
brew install encfs
brew install gettext
brew link --force gettext
brew install flock
brew install terraform

echo "Please install Docker and then:"
read -n 1 -s -r -p "Press any key to continue"
echo

find /Applications/Docker.app \
    -type f -name "*.bash-completion" \
    -exec ln -sf "{}" "$(brew --prefix)/etc/bash_completion.d/" \;

# tricks

## Disable app sleep for specific app
# defaults write com.google.Chrome NSAppSleepDisabled -bool YES

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
