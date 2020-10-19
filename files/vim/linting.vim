augroup linting
  autocmd!
augroup END

" -----------------------------------------------------------------------------
"  Fixers
" -----------------------------------------------------------------------------

" Automatically fix when a file is saved
let g:ale_fix_on_save = 1

" Only use PHP-CS-Fixer which removes PHP Code Sniffer
autocmd linting FileType php let b:ale_fixers = ['php_cs_fixer']

" Fallback to my global php-cs-fixer binary if not installed in local project
function! FallbackToGlobalPhpCsFixerBinary
  if filereadable('vendor/bin/php-cs-fixer')
    let g:ale_php_cs_fixer_executable = 'vendor/bin/php-cs-fixer'
  else
    let g:ale_php_cs_fixer_executable = 'php-cs-fixer'
  endif
endfunction

call FallbackToGlobalPhpCsFixerBinary()

" Fallback to global Laravel style rules if local project does not have a
" PHP-CS-Fixer config. This allows us to fix project files that don't use
" CS-Fixer. We can also place a `.php_cs.local` in a specific project if we
" want to custom rules for the project.
function! FallbackToGlobalPhpCsFixerConfig()
  if (filereadable('.php_cs') || filereadable('.php_cs.dist'))
    return
  elseif filereadable('.php_cs.local')
    let g:ale_php_cs_fixer_options = '--using-cache=no --path-mode=override --config=".php_cs.local"'
  else
    let g:ale_php_cs_fixer_options = '--using-cache=no --path-mode=override --config='.$HOME.'/.php_cs.laravel'
  endif
endfunction

call FallbackToGlobalPhpCsFixerConfig()

" -----------------------------------------------------------------------------
"  Linters
" -----------------------------------------------------------------------------

let g:ale_cache_executable_check_failures = 1
let g:ale_php_phpstan_executable = 'vendor/bin/phpstan'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 0
let g:ale_sign_error = '👀'

autocmd linting FileType php let b:ale_linters = ['php', 'psalm', 'phpstan']

