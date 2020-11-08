" Enable autocompletion
filetype plugin on
syntax on

" Set reasonable split defaults
set splitbelow splitright

" Set this so language servers are not confused
set hidden nobackup nowritebackup

" Set my preferred tab behaviour
set
  \ softtabstop=4
  \ shiftwidth=4
  \ smarttab
  \ expandtab
  \ shiftround

" Line numbers
set number relativenumber

" Configure search
set hlsearch ignorecase smartcase

" Highlight active line
set cursorline

set cmdheight=2
set updatetime=500

" Set gruvbox
autocmd VimEnter * colorscheme gruvbox

" Trailing whitespace and final new-line
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\($\n\s*\)\+\%$/\n/e
