" Don't use PHP Code Sniffer, only php_cs_fixer
let b:ale_fixers = ['php_cs_fixer']

" When the current project does not have a php-cs-fixer config, we will fall
" back to a locally defined config file if it exists, otherwise we
" will just use PSR2.
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
call SetCsFixerFallbackToCustomLocalOrPsr2PhpCsFixerConfig()

" Use the following linters, in this order, when any are available
let b:ale_linters = ['php', 'psalm', 'phpstan']

" Wrap visual selection in a `dd` call
vnoremap L cdd(<ESC>pa)<ESC>

" Highlighting for native functions should not be different for highlighting
" of local functions / methods.
let g:php_syntax_extensions_enabled = []

" Highlight $ with variable
let g:php_var_selector_is_identifier = 1

" do not auto indent PHP to make arrows match indentation across lines, i.e.
" don't do this....
" $this->thing->and->then()
"                  ->match()
"                  ->arrow()
"                  ->indentation();
let g:PHP_noArrowMatching = 1

" Use "//" instead of "/* ... */" style comments
setlocal commentstring=//\ %s

" Rename file
nmap <leader>rf :PhpactorMoveFile<CR>

" Import namespace
nmap <leader>in :call phpactor#Transform("fix_namespace_class_name")<CR>

" Import class
nmap <leader>ic :PhpactorImportClass<CR>

" Create a new class
nmap <leader>nc :PhpactorClassNew<CR>

" Expand to FQCN
nmap <leader>ec viwb<ESC>i\<ESC>l:PhpactorClassExpand<CR>e

" use PHPUnit as the php test runner, not artisan test
let test#php#phpunit#executable = g:cli_cmd_prefix.' ./vendor/bin/phpunit --colors=always'
