" -----------------------------------------------------------------------------
"  Fixers
" -----------------------------------------------------------------------------

" Automatically fix when a file is saved
let g:ale_fix_on_save = 1

" Don't use PHP Code Sniffer, only php_cs_fixer
autocmd vimrc FileType php let b:ale_fixers = ['php_cs_fixer']

" format (gq) a file (af)
nnoremap gqaf :ALEFix<CR>

" When the current project does not have a php-cs-fixer config, we will fall
" back to a locally defined config file if it exists, otherwise we
" will just use PSR2.
autocmd vimrc FileType php call SetCsFixerFallbackToCustomLocalOrPsr2PhpCsFixerConfig()
function! SetCsFixerFallbackToCustomLocalOrPsr2PhpCsFixerConfig()
  if exists('g:ale_php_cs_fixer_options')
      return
  endif

  if (filereadable('.php-cs-fixer.dist.php') || filereadable('.php-cs-fixer.php') || filereadable('.php_cs.dist') || filereadable('.php_cs'))
      let g:ale_php_cs_fixer_options = ''
  elseif filereadable('.php-cs-fixer.local.php')
    let g:ale_php_cs_fixer_options = '--config=.php-cs-fixer.local.php'
  else
    let g:ale_php_cs_fixer_options = '--rules=@PSR2'
  endif
endfunction

" -----------------------------------------------------------------------------
"  Linters
" -----------------------------------------------------------------------------

" Use the following linters, in this order, when any are available
autocmd vimrc FileType php let b:ale_linters = ['php', 'psalm', 'phpstan']

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
