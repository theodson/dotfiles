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
autocmd vimrc FileType php setlocal commentstring=//\ %s

" Rename file
autocmd vimrc FileType php nmap <leader>rf :PhpactorMoveFile<CR>

" Import namespace
autocmd vimrc FileType php nmap <leader>in :call phpactor#Transform("fix_namespace_class_name")<CR>

" Import class
autocmd vimrc FileType php nmap <leader>ic :PhpactorImportClass<CR>

" Create a new class
autocmd vimrc FileType php nmap <leader>nc :PhpactorClassNew<CR>

" Expand to FQCN
autocmd vimrc FileType php nmap <leader>ec viwb<ESC>i\<ESC>l:PhpactorClassExpand<CR>e
