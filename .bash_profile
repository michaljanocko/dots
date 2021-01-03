#
# ~/.bash_profile
#

[[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] && startx

[[ -f ~/.bashrc ]] && . ~/.bashrc
