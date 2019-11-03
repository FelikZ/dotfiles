#!/usr/bin/env bash

sudo bash -c 'cat <<EOF >/etc/wsl.conf
[automount]
options = "metadata"

EOF'

ln -sf /mnt/c/Users/Home/dotfiles ~/dotfiles
ln -sf /mnt/c/Users/Home/dotfiles/scripts/win/mount.sh ~/mount.sh
chmod +x ~/mount.sh

source ~/dotfiles/ubuntu-setup.sh
