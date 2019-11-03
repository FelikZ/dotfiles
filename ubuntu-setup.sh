#!/usr/bin/env bash

# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s "$(command -v zsh)"

sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt-get update -y
sudo apt-get install -y python3-pip \
    golang-go

go get -u mvdan.cc/sh/cmd/shfmt

scversion="v0.6.0" # or "v0.4.7", or "latest"
wget -qO- "https://storage.googleapis.com/shellcheck/shellcheck-${scversion?}.linux.x86_64.tar.xz" | tar -xJv
sudo cp "shellcheck-${scversion}/shellcheck" /usr/local/bin/
sudo chown $USER /usr/local/bin/shellcheck
sudo chmod +x /usr/local/bin/shellcheck
rm -rf shellcheck-*

sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 10
sudo update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 10
#sudo ln -sf "$(which pip3)" /usr/bin/pip
#sudo chmod +x /usr/bin/pip

python -m pip install --upgrade pip

pip install --user pre-commit
(cd ~/dotfiles && pre-commit install)

source links.sh
source mount.sh
