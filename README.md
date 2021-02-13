# 💬 Dotfiles

## Installation

```bash
alias config='git --git-dir=$HOME/.dots/ --work-tree=$HOME'
echo ".dots" >> .gitignore
git clone --bare https://github.com/michaljanocko/dots.git $HOME/.dots
config checkout
config config --local status.showUntrackedFiles no
```

`config checkout` won't work if you have conflicting files.
