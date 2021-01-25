""" Completion

call deoplete#custom#option('sources', {'_': ['ale']})
let g:deoplete#enable_at_startup = 1

""" editorconfig

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

""" CHADtree

nnoremap <leader>n <cmd>CHADopen<CR>
let g:chadtree_settings = {
  \ "theme.icon_colour_set": "github"
  \ }
