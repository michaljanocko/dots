" Enable autocompletion
filetype plugin on
syntax on
set encoding=UTF-8

" Shell to bash
if &shell =~# 'fish$'
  set shell=bash
endif

" Set reasonable split defaults
set splitbelow splitright

" Set this so language servers are not confused
set hidden nobackup nowritebackup

" Set my preferred tab behaviour
set
  \ softtabstop=2
  \ shiftwidth=2
  \ tabstop=4
  \ smarttab
  \ expandtab
  \ shiftround

" Line breaks
set linebreak

" Line numbers
set number

" Configure search
set hlsearch ignorecase smartcase

" Highlight active line
set cursorline

set cmdheight=2
set updatetime=5

" Set colors
autocmd VimEnter * colorscheme gruvbox
autocmd VimEnter * :RainbowParentheses

" Terminal
autocmd TermOpen * set nonumber
autocmd TermOpen * startinsert
autocmd TermClose * stopinsert
