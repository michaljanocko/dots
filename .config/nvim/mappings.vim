let mapleader = ' '
nnoremap <space> <nop>

nnoremap ; :
nnoremap 0 ^

" Reasonable window switching
map <C-j> <Esc><C-w>j
map <C-k> <Esc><C-w>k
map <C-h> <Esc><C-w>h
map <C-l> <Esc><C-w>l

" Split with new buffer
nnoremap <leader>V :vsplit<CR>
nnoremap <leader>H :split<CR>

" Cancel search
nnoremap <Esc> :nohlsearch<CR>
" Adding line without insert mode
nnoremap <silent> <leader>o :<C-u>call append(line("."), repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>
" Breaking line without insert mode
nnoremap <leader><CR> i<CR><Esc>
nnoremap <leader><S-CR> s<CR><Esc>
" Reload file
nnoremap <leader>R :edit<CR>
" Apply config
nnoremap <leader>A :source %<CR>
" Install plugins
nnoremap <leader>P :PlugInstall<CR>

nnoremap <leader>n :CHADopen --always-focus<CR>

" LSP
nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap gr :lua vim.lsp.buf.rename()<CR>
nnoremap gh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>f :lua vim.lsp.buf.formatting()<CR>
