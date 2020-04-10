#!/usr/bin/env bash

sudo unlink "$HOME/.ssh" 2>/dev/null || true
sudo umount /z || true
sudo mkdir -p /z
sudo mount -t drvfs -o metadata,uid=1000,gid=1000,umask=22,fmask=155 'Z:\' /z
sudo ln -sf /z/.ssh "$HOME/.ssh"
