" Install vim-plug if not installed
if ! filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins…"
  silent !mkdir -p ~/.local/share/nvim/site/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    \ > ~/.local/share/nvim/site/autoload/plug.vim
endif

" Install new plugins
autocmd VimEnter *
  \ if len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) |
  \   PlugInstall --sync | q |
  \ endif

" Run some stuff
autocmd VimEnter * COQnow

call plug#begin('~/.vim/plugged')

" Pimp my Vim
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'

Plug 'kyazdani42/nvim-web-devicons'

Plug 'folke/lsp-colors.nvim'
Plug 'folke/trouble.nvim'
Plug 'folke/which-key.nvim'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'

Plug 'mattn/emmet-vim'

Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'

Plug 'ellisonleao/glow.nvim', {'do': ':GlowInstall', 'branch': 'main'}

Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'

" Rust
Plug 'simrat39/rust-tools.nvim'

" Colors
Plug 'EdenEast/nightfox.nvim'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/sonokai'
Plug 'savq/melange'

call plug#end()

colorscheme gruvbox

set
  \ softtabstop=2
  \ shiftwidth=2
  \ tabstop=4
  \ smarttab
  \ expandtab
  \ shiftround

let g:markdown_fenced_languages = ['bash=sh', 'elm', 'python']

luafile $HOME/.config/nvim/lua/init.lua
"""
runtime! plugins.vim
runtime! mappings.vim
