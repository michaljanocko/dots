let mapleader = ' '
nnoremap <space> <nop>

" Fix indents
nnoremap <leader>t retab

" Remap 0 to first non-blank character
map 0 ^

" Reasonable window switching
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" Adding line without insert mode
nnoremap <silent> <leader>o :<C-u>call append(line("."), repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>
