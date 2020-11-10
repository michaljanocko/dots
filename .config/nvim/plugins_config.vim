""" editorconfig

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

""" Elixir

let g:mix_format_on_save = 1

""" NERDtree

nnoremap <leader>n :NERDTreeFocus<CR>

""" Ruby

let g:rufo_auto_formatting = 1
let g:vimrubocop_keymap = 0
nnoremap <leader>R :RuboCop<CR>
