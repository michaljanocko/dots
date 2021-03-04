""" Completion

call deoplete#custom#option('sources', {'_': ['ale']})
let g:deoplete#enable_at_startup = 1

""" EasyMotion

map , <Plug>(easymotion-prefix)

""" editorconfig

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

""" CHADtree

nnoremap <leader>n <cmd>NERDTreeFocus<CR>

""" fzf

nnoremap <C-p> <cmd>Files<CR>
