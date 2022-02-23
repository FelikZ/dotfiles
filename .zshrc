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
ZSH_DOTENV_PROMPT="true"
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
setopt no_share_history
# $(git_prompt_info)
USER_PS='%{$fg[cyan]%}%n'
if [ "${USER}" = 'root' ]; then
    USER_PS='%{$fg_bold[red]%}%n'
fi
# shellcheck disable=2154
export PS1=${USER_PS}'%{$reset_color%}@%{$fg[yellow]%}%m:%{$fg[green]%}$(shrink_path -f)%{$reset_color%} %(!.#.$) '

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"

source "$HOME/.profile_default"
source "$HOME/dotfiles/auto-ssh-agent.sh"
