""" PLUGINS

" Install vim-plug if not installed
if ! filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.local/share/nvim/site/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.local/share/nvim/site/autoload/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Install new plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

call plug#begin(stdpath('data') . '/plugged')
Plug 'editorconfig/editorconfig-vim'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
call plug#end()

" Install coc.nvim extensions
let g:coc_global_extensions = [
  \'coc-css',
  \'coc-cssmodules',
  \'coc-elixir',
  \'coc-emmet',
  \'coc-emoji',
  \'coc-eslint',
  \'coc-flutter',
  \'coc-json',
  \'coc-markdownlint',
  \'coc-marketplace',
  \'coc-python',
  \'coc-rust-analyzer',
  \'coc-sh',
  \'coc-stylelint',
  \'coc-vetur',
  \'coc-vimlsp',
  \'coc-xml',
  \'coc-yaml',
  \'coc-yank'
  \]
