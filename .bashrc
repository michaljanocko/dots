#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias sudo='sudo '
alias ls='exa'
alias vim='nvim'
alias venv='source venv/bin/activate'
alias config='git --git-dir=$HOME/.dots/ --work-tree=$HOME'

export PATH=$PATH:$HOME/.local/bin/:/usr/local/go/bin

eval "$(starship init bash)"
