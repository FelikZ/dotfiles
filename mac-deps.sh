#!/bin/bash
brew tap discoteq/discoteq
brew install flock \
    bash \
    tree \
    git \
    bash-completion \
    shellcheck \
    shfmt \
    jq \
    gifsicle \
    ncdu \
    encfs \
    gettext \
    terraform \
    kubectx \
    watch
brew reinstall git
brew cask install osxfuse
brew link --force gettext

pip install pre-commit

# DNS
# https://developers.cloudflare.com/argo-tunnel/downloads/
# less /Library/Logs/com.cloudflare.cloudflared.err.log
mkdir -p /usr/local/etc/cloudflared
cat <<EOF >/usr/local/etc/cloudflared/config.yml
metrics: localhost:11111
no-autoupdate: true
proxy-dns: true
logfile: /usr/local/etc/cloudflared/cloudflared.log
proxy-dns-upstream:
  - https://1.1.1.1/dns-query
  - https://1.0.0.1/dns-query
  - https://2606:4700:4700::1111/dns-query
  - https://2606:4700:4700::1001/dns-query
EOF
sudo cloudflared --config /usr/local/etc/cloudflared/config.yml service install
sudo launchctl start com.cloudflare.cloudflared
dig +short @127.0.0.1 cloudflare.com AAAA

echo "Please install Docker and then:"
read -n 1 -s -r -p "Press any key to continue"
echo

find /Applications/Docker.app \
    -type f -name "*.bash-completion" \
    -exec ln -sf "{}" "$(brew --prefix)/etc/bash_completion.d/" \;

# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s "$(command -v zsh)"

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
