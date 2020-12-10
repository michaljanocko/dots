let g:ale_linters_explicit = 1
let g:ale_linters = {
  \ 'html': ['eslint'],
  \ 'javascript': ['eslint'],
  \ 'json': ['jsonlint'],
  \ 'python': ['bandit', 'flake8', 'mypy', 'pylint', 'pyls'],
  \ 'rust': ['rustc', 'analyzer'],
  \ 'svelte': ['eslint', 'stylelint'],
  \ 'typescript': ['eslint', 'tsserver'],
  \ }

let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'html': ['prettier'],
  \ 'javascript': ['prettier', 'eslint'],
  \ 'json': ['prettier'],
  \ 'python': ['black', 'isort'],
  \ 'svelte': ['eslint', 'prettier'],
  \ 'typescript': ['prettier', 'eslint'],
  \ }

let g:ale_fix_on_save = 1

let g:ale_completion_delay = 0

let g:ale_echo_delay = 0

let g:ale_echo_cursor = 0
"Show error on hover
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_delay = 0
let g:ale_virtualtext_prefix = '▶ '
let g:ale_sign_column_always = 1

let g:ale_echo_msg_error_str = '🚨'
let g:ale_sign_error = '🚨'
let g:ale_echo_msg_warning_str = '⚠️'
let g:ale_sign_warning = '⚠️'
let g:ale_echo_msg_format = '[%linter%] %severity% %s'

nnoremap <leader>l :ALELint<CR>
nnoremap gd :ALEGoToDefinition<CR>
nnoremap gr :ALEFindReferences<CR>
nnoremap <leader>f :ALEFix<CR>
nnoremap <leader>r :ALERename<CR>

nnoremap <leader>ai :ALEInfo<CR>
nnoremap <leader>ad :ALEDetail<CR>

" Error navigation
nmap <silent> <leader>j :lnext<CR>
nmap <silent> <leader>k :lprev<CR>

let g:ale_completion_symbols = {
  \ 'text': '🔤',
  \ 'method': '🔨',
  \ 'function': '🇫',
  \ 'constructor': '🏗',
  \ 'field': '🪧',
  \ 'variable': '📥',
  \ 'class': '🇨',
  \ 'interface': '🔌',
  \ 'module': '📦',
  \ 'property': '🧬',
  \ 'unit': '📏',
  \ 'value': '🔢',
  \ 'enum': '🗒',
  \ 'keyword': '🗝',
  \ 'snippet': '⏩',
  \ 'color': '🌈',
  \ 'file': '📄',
  \ 'reference': '🔗',
  \ 'folder': '📁',
  \ 'enum_member': '📍',
  \ 'constant': '⛔',
  \ 'struct': '🗄',
  \ 'event': '📟',
  \ 'operator': '🍴',
  \ 'type_parameter': '👣',
  \ '<default>': '·'
  \ }
