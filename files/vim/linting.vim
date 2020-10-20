augroup linting
  autocmd!
augroup END

" -----------------------------------------------------------------------------
"  Fixers
" -----------------------------------------------------------------------------

" format (gq) a file (af)
nmap gqaf :ALEFix<CR>

" Automatically fix when a file is saved
let g:ale_fix_on_save = 1

" Only use PHP-CS-Fixer which removes PHP Code Sniffer
autocmd linting FileType php let b:ale_fixers = ['php_cs_fixer']

" Fallback to my global php-cs-fixer binary if not installed in local project
function! FallbackToGlobalPhpCsFixerBinary()
  if filereadable('vendor/bin/php-cs-fixer')
    let g:ale_php_cs_fixer_executable = 'vendor/bin/php-cs-fixer'
  else
    let g:ale_php_cs_fixer_executable = 'php-cs-fixer'
  endif
endfunction

call FallbackToGlobalPhpCsFixerBinary()

" When the current project does not have a php-cs-fixer config, we will fall
" back to a locally defined `.php_cs.local` file if it exists, otherwise we
" will just use PSR2.
function! FallbackToCustomLocalOrPsr2PhpCsFixerConfig()
  if (filereadable('.php_cs') || filereadable('.php_cs.dist'))
    return
  elseif filereadable('.php_cs.local')
    let g:ale_php_cs_fixer_options = '--using-cache=no --path-mode=override --config=.php_cs.local'
  else
    let g:ale_php_cs_fixer_options = '--using-cache=no --path-mode=override --rules=@PSR2'
  endif
endfunction

call FallbackToCustomLocalOrPsr2PhpCsFixerConfig()

" -----------------------------------------------------------------------------
"  Linters
" -----------------------------------------------------------------------------

let g:ale_cache_executable_check_failures = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_text_changed = 0
let g:ale_php_phpstan_executable = 'vendor/bin/phpstan'
let g:ale_sign_error = '👀'

autocmd linting FileType php let b:ale_linters = ['php', 'psalm', 'phpstan']

