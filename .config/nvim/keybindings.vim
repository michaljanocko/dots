let mapleader = ' '
nnoremap <space> <nop>

" Semicolon as a colon
nmap ; :

" Remap 0 to first non-blank character
map 0 ^

" Disable search highlight
nnoremap <Esc> :nohlsearch<CR>

" Reasonable window switching
map <C-j> <Esc><C-w>j
map <C-k> <Esc><C-w>k
map <C-h> <Esc><C-w>h
map <C-l> <Esc><C-w>l

" At least some resizing
map <silent> <M-j> :resize +1<CR>
map <silent> <M-k> :resize -1<CR>
map <silent> <M-h> :vertical resize -1<CR>
map <silent> <M-l> :vertical resize +1<CR>

" Split with new buffer
nnoremap <leader>V :vsplit<CR>
nnoremap <leader>H :split<CR>

" Adding line without insert mode
nnoremap <silent> <leader>o :<C-u>call append(line("."), repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>
" Breaking line without insert mode
nnoremap <leader><CR> i<CR><Esc>

" Go to homescreen
nnoremap <leader>s :Startify<CR>
" Open terminal
nnoremap <leader><leader> :FloatermToggle<CR>
tnoremap <Esc> <C-\><C-n>
tnoremap <S-Esc> <Esc>
" Reload file
nnoremap <leader>R :edit<CR>
" Fix indents
nnoremap <leader>t :retab<CR>
" Apply config
nnoremap <leader>A :source %<CR>
" Install plugins
nnoremap <leader>P :PlugInstall<CR>

command! W SudoWrite
