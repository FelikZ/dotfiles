#/bin/bash

if [ "$BASH_SOURCE" != "" ]
then
    DIR="$( cd "$( dirname "$BASH_SOURCE" )" && pwd )"
elif [ "$DASH_SOURCE" != "" ]
then
    DIR="$( cd "$( dirname "$DASH_SOURCE" )" && pwd )"
else
    DIR="$( cd "$( dirname "$0" )" && pwd )"
fi

ln -sf "$DIR/.bash_profile_default" "$HOME/.bash_profile_default"
ln -sf "$DIR/.dircolors" "$HOME/.dircolors"
ln -sf "$DIR/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$DIR/.ideavimrc" "$HOME/.ideavimrc"

cat $HOME/.bashrc | grep -q "source\ ${HOME}/.bash_profile_default"
NOT_FOUND=$?

if [ $NOT_FOUND = 1 ]; then
    echo '[[ $- == *i* ]] || return' >> "$HOME/.bashrc"
    echo "source $HOME/.bash_profile_default" >> "$HOME/.bashrc"
fi

cat $HOME/.bashrc | grep -q "source\ ${DIR}/light-setup.sh"
NOT_FOUND=$?

if [ $NOT_FOUND = 1 ]; then
    echo "source ${DIR}/light-setup.sh" >> "$HOME/.bashrc"
fi
