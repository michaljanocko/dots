""" Completion

call deoplete#custom#option('sources', {'_': ['ale']})
let g:deoplete#enable_at_startup = 1

""" editorconfig

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

""" Elixir

let g:mix_format_on_save = 1
let b:coc_root_patterns = ['.git', '.gitignore']

""" HTML

let g:user_emmet_mode='a'
let g:user_emmet_leader_key='<C-e>'

""" NERDtree

nnoremap <leader>n :NERDTreeFocus<CR>

""" Python

let g:ale_python_auto_pipenv = 1

""" Ruby

let g:rufo_auto_formatting = 1
let g:vimrubocop_keymap = 0

""" Rust

let g:rustfmt_autosave = 1

""" Svelte

let g:vim_svelte_plugin_use_sass = 1
let g:vim_svelte_plugin_use_typescript = 1

""" Typescript
let g:import_sort_auto = 1
