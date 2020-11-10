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

Plug 'alx741/vim-rustfmt'
Plug 'cespare/vim-toml'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'elixir-editors/vim-elixir'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/goyo.vim'
Plug 'mhinz/vim-mix-format'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neomake/neomake'
Plug 'ngmy/vim-rubocop'
Plug 'preservim/nerdtree'
Plug 'ruby-formatter/rufo-vim'
Plug 'slashmili/alchemist.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'voldikss/vim-floaterm'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Color schemes
Plug 'mhinz/vim-janah'
Plug 'morhetz/gruvbox'
Plug 'sickill/vim-monokai'

call plug#end()

" Install coc.nvim extensions
let g:coc_global_extensions = [
  \'coc-css',
  \'coc-cssmodules',
  \'coc-emmet',
  \'coc-emoji',
  \'coc-eslint',
  \'coc-flutter',
  \'coc-html',
  \'coc-json',
  \'coc-markdownlint',
  \'coc-marketplace',
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
