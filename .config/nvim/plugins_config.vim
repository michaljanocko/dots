""" Completion

call deoplete#custom#option('sources', {'_': ['ale']})
let g:deoplete#enable_at_startup = 1

""" editorconfig

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

""" NERDtree

nnoremap <leader>n :NERDTreeFocus<CR>
