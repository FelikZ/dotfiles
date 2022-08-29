#!/usr/bin/env bash
# handle lid open/close

# force sleep
brew install pirj/homebrew-noclamshell/noclamshell
brew services start noclamshell

# disable bluetooth
# https://forums.macrumors.com/threads/monterey-bluetooth-wake-issue.2319613/page-2?post=30819437#post-30819437
brew install sleepwatcher && brew install blueutil
echo "$(which blueutil) -p 0" >~/.sleep
echo "$(which blueutil) -p 1" >~/.wakeup
chmod 755 ~/.sleep
chmod 755 ~/.wakeup
brew services restart sleepwatcher
