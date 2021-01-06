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

" Caddyfile
Plug 'isobit/vim-caddyfile'

" Dart
Plug 'dart-lang/dart-vim-plugin'

" EditorConfig
Plug 'editorconfig/editorconfig-vim'

" Elixir
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'slashmili/alchemist.vim'

" GraphQL
Plug 'jparise/vim-graphql'

" Haskell
Plug 'neovimhaskell/haskell-vim'

" HTML
Plug 'mattn/emmet-vim'

" JSON
Plug 'elzr/vim-json'
Plug 'tpope/vim-jdaddy'

" Liquid
Plug 'tpope/vim-liquid'

" Python
Plug 'vim-python/python-syntax'

" Ruby
Plug 'ngmy/vim-rubocop'
Plug 'ruby-formatter/rufo-vim'
Plug 'tpope/vim-bundler'
Plug 'vim-ruby/vim-ruby'

" Rust
Plug 'rust-lang/rust.vim'

" Svelte
Plug 'leafOfTree/vim-svelte-plugin'

" TOML
Plug 'cespare/vim-toml'

" Typescript
Plug 'herringtondarkholme/yats.vim'
" Plug 'leafgarland/typescript-vim'

" Editor support
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-emoji'
Plug 'mhinz/vim-startify'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/auto-pairs-gentle'
Plug 'voldikss/vim-floaterm'
Plug 'Xuyuanp/nerdtree-git-plugin'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Color schemes
Plug 'joshdick/onedark.vim'
Plug 'mhinz/vim-janah'
Plug 'morhetz/gruvbox'
Plug 'sickill/vim-monokai'

call plug#end()
