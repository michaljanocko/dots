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

Plug 'ctrlpvim/ctrlp.vim'
Plug 'docker/docker'
Plug 'editorconfig/editorconfig-vim'
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ngmy/vim-rubocop'
Plug 'preservim/nerdtree'
Plug 'toml-lang/toml'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'voldikss/vim-floaterm'

" Color schemes
Plug 'mhinz/vim-janah'
Plug 'morhetz/gruvbox'
Plug 'sickill/vim-monokai'

call plug#end()

" Install coc.nvim extensions
let g:coc_global_extensions = [
  \'coc-css',
  \'coc-cssmodules',
  \'coc-docker',
  \'coc-elixir',
  \'coc-emmet',
  \'coc-emoji',
  \'coc-eslint',
  \'coc-floatinput',
  \'coc-floaterm',
  \'coc-flutter',
  \'coc-html',
  \'coc-json',
  \'coc-markdownlint',
  \'coc-marketplace',
  \'coc-pairs',
  \'coc-python',
  \'coc-rust-analyzer',
  \'coc-sh',
  \'coc-solargraph',
  \'coc-stylelint',
  \'coc-svg',
  \'coc-vetur',
  \'coc-vimlsp',
  \'coc-webpack',
  \'coc-xml',
  \'coc-yaml',
  \'coc-yank'
  \]
