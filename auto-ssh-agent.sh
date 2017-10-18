#!/bin/bash

HOSTNAME=$(hostname)
SHARED_AUTH_SOCK="$(cd ~ && pwd)/ssh-auth-sock.$HOSTNAME"

if [ ! -S "$SHARED_AUTH_SOCK" ] || [ `ps aux | grep ssh-agent | wc -l` = 0 ]; then
    eval `ssh-agent`
    ln -sf "$SSH_AUTH_SOCK" "$SHARED_AUTH_SOCK"
fi
export SSH_AUTH_SOCK=$SHARED_AUTH_SOCK
ssh-add -l > /dev/null || ssh-add
