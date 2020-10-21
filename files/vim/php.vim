" Plugin: sheerun/vim-polyglot > StanAngeloff/php.vim

augroup php
  autocmd!
augroup END

" Highlighting for native functions should not be different for highlighting
" of local functions / methods.
let g:php_syntax_extensions_enabled = []

" Highlight $ with variable
let g:php_var_selector_is_identifier = 1
autocmd php FileType php setlocal iskeyword+=$

" do not auto indent PHP to make arrows match indentation across lines, i.e.
" don't do this....
" $this->thing->and->then()
"                  ->match()
"                  ->arrow()
"                  ->indentation();
let g:PHP_noArrowMatching = 1

" Use "//" instead of "/* ... */" style comments
autocmd php FileType php setlocal commentstring=//\ %s
