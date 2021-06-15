" use PHPUnit as the php test runner, not artisan test
autocmd vimrc FileType php let test#php#phpunit#executable = g:cli_cmd_prefix.' ./vendor/bin/phpunit --colors=always'

" open a VIM terminal for test suite
let g:test#strategy = "vimterminal"

" Run whole test suite in a background job
" TODO: Make this call a function that checks which strategy to use so that is
" can run sync or async like all the other commands
nnoremap <Leader>ta :Dispatch! ./vendor/bin/phpunit<CR>

" Run the entire test suite for the current file
nnoremap <Leader>ts :TestFile<CR>

" Run all tests in the current file
nnoremap <Leader>tf :TestFile<CR>

" Rerun the last run test
nnoremap <Leader>tl :TestLast<CR>

" Run the current test
nnoremap <Leader>tc :TestNearest<CR>

" Visit the last run test
nnoremap <Leader>tv :TestVisit<CR>

" Allow toggling between the test suite being dispatched in background or
" fullscreen
nnoremap <Leader>tt :TestToggleStrategy<CR>
command! TestToggleStrategy call TestToggleStrategy()
function! TestToggleStrategy()
  if g:test#strategy != "vimterminal"
    let g:test#strategy = "vimterminal"

    echo "Test strategy now: popup terminal"

    return
  endif

  let g:test#strategy="dispatch_background"

  echo "Test strategy now: dispatch background"
endfunction
