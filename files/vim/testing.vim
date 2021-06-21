" open a VIM terminal for test suite
let g:test#strategy = "vimterminal"

" Run whole test suite in a background job
nnoremap <expr> <Leader>ta ':Dispatch! '.g:cli_cmd_prefix.' ./vendor/bin/phpunit<CR>'

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
nnoremap <Leader>tt :call TestToggleStrategy()<CR>
function! TestToggleStrategy()
    if g:test#strategy != "vimterminal"
        let g:test#strategy = "vimterminal"

        echo "Test strategy now: popup terminal"
    else
        let g:test#strategy="dispatch_background"

        echo "Test strategy now: dispatch background"
    endif
endfunction
