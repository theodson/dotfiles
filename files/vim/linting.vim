" -----------------------------------------------------------------------------
"  Fixers
" -----------------------------------------------------------------------------

" Automatically fix when a file is saved
let g:ale_fix_on_save = 1

" format (gq) a file (af)
nnoremap gqaf :ALEFix<CR>

" See: https://github.com/dense-analysis/ale#5xv-how-can-i-check-vue-files-with-eslint
let g:ale_linter_aliases = {
    \ 'vue': ['vue', 'javascript']
\ }

let g:ale_linters = {
    \ 'json': []
\ }

let g:ale_fixers = {
    \ 'php': ['php_cs_fixer'],
\ }
" -----------------------------------------------------------------------------
"  Linters
" -----------------------------------------------------------------------------

" Only look for a binary once
let g:ale_cache_executable_check_failures = 1

" Lint when a buffer is entered for the first time
let g:ale_lint_on_enter = 1

" Don't lint every time we exit insert mode
let g:ale_lint_on_insert_leave = 0

" Don't lint every time I change text
let g:ale_lint_on_text_changed = 0

" Use this as a marker in the sidebar when an linting error is found
let g:ale_sign_error = '👀'
