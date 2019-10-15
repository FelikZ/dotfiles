#!/usr/bin/env bash

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="maran"
CASE_SENSITIVE="true"

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
export PS1='%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[yellow]%}%m:%{$fg[green]%}$(shrink_path -f)%{$reset_color%} %(!.#.$) '

source "$HOME/.profile_default"
source "$HOME/dotfiles/auto-ssh-agent.sh"
