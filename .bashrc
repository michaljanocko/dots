#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias sudo='sudo '
alias ls='exa'
alias vim='nvim'
alias config='git --git-dir=$HOME/.dots/ --work-tree=$HOME'

export PATH=$PATH:$HOME/.local/bin/

export PS1="\[$(tput setaf 4)\][\[$(tput setaf 3)\]\u\[$(tput setaf 1)\]@\[$(tput setaf 6)\]\h\[$(tput setaf 4)\]] \[$(tput setaf 7)\]\w\[$(tput setaf 2)\]\\$ \[$(tput sgr0)\]"
