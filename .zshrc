#!/usr/bin/env bash
# shellcheck disable=2016,1090

export ZSH="$HOME/.oh-my-zsh"

# shellcheck disable=2034
ZSH_THEME="maran"
# shellcheck disable=2034
CASE_SENSITIVE="true"
# shellcheck disable=2034
DISABLE_AUTO_UPDATE="true"
# shellcheck disable=2034
plugins=(
    git
    gitfast
    git-extras
    bundler
    dotenv
    osx
    docker
    shrink-path
)

source "$ZSH/oh-my-zsh.sh"

setopt prompt_subst
# $(git_prompt_info)
USER_PS='%{$fg[cyan]%}%n'
if [ "${USER}" = 'root' ]; then
    USER_PS='%{$fg_bold[red]%}%n'
fi
# shellcheck disable=2154
export PS1=${USER_PS}'%{$reset_color%}@%{$fg[yellow]%}%m:%{$fg[green]%}$(shrink_path -f)%{$reset_color%} %(!.#.$) '

source "$HOME/.profile_default"
source "$HOME/dotfiles/auto-ssh-agent.sh"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
