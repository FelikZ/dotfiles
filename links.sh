#!/usr/bin/env bash

DIR="$(cd "$(dirname "$0")" && pwd)"

ln -sf "$DIR/.zshrc" "$HOME/.zshrc"
ln -sf "$DIR/.zprofile" "$HOME/.zprofile"
ln -sf "$DIR/.bash_profile_default" "$HOME/.bash_profile_default"
ln -sf "$DIR/.profile_default" "$HOME/.profile_default"
ln -sf "$DIR/.dircolors" "$HOME/.dircolors"
ln -sf "$DIR/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$DIR/.ideavimrc" "$HOME/.ideavimrc"
ln -sf "$DIR/.gitconfig" "$HOME/.gitconfig"

# bash

grep -q "source\ ${HOME}/.bash_profile_default" <"$HOME/.bashrc"
NOT_FOUND=$?

if [ $NOT_FOUND = 1 ]; then
    echo '[[ $- == *i* ]] || return' >>"$HOME/.bashrc"
    echo "source $HOME/.bash_profile_default" >>"$HOME/.bashrc"
fi

grep -q "source\ ${DIR}/light-setup.sh" <"$HOME/.bashrc"
NOT_FOUND=$?

if [ $NOT_FOUND = 1 ]; then
    echo "source ${DIR}/light-setup.sh" >>"$HOME/.bashrc"
fi

grep -q "source\ ${DIR}/auto-ssh-agent.sh" <"$HOME/.bashrc"
NOT_FOUND=$?

if [ $NOT_FOUND = 1 ]; then
    echo "source ${DIR}/auto-ssh-agent.sh" >>"$HOME/.bashrc"
fi
