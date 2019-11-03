#!/usr/bin/env bash

sudo unlink "$HOME/.ssh" 2>/dev/null || true
sudo umount /mnt/z || true
sudo mkdir -p /mnt/z
sudo mount -t drvfs -o metadata,uid=1000,gid=1000,umask=22,fmask=155 'Z:\' /mnt/z
sudo ln -sf /mnt/z/.ssh "$HOME/.ssh"
