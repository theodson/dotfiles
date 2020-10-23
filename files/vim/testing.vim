" Plugin: tpope/vim-dispatch
" Plugin: janko/vim-test

" use PHPUnit as the php test runner, not artisan test
let test#php#phpunit#executable = 'vendor/bin/phpunit --colors=always'

" open a VIM terminal for test suite
let g:test#strategy = "vimterminal"

" Run whole test suite in a background job
" TODO: Make this call a function that checks which strategy to use so that is
" can run sync or async like all the other commands
nmap <Leader>ta :Dispatch! ./vendor/bin/phpunit<CR>

" Run the entire test suite for the current file
nmap <Leader>ts :TestFile<CR>

" Run all tests in the current file
nmap <Leader>tf :TestFile<CR>

" Rerun the last run test
nmap <Leader>tl :TestLast<CR>

" Run the current test
nmap <Leader>tc :TestNearest<CR>

" Visit the last run test
nmap <Leader>tv :TestVisit<CR>

" Allow toggling between the test suite being dispatched in background or
" fullscreen
nmap <Leader>tt :TestToggleStrategy<CR>

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


" When you first open VIM the vim-test plugin does not know about the test
" files, so you cannot run commands. This infers the last_postition to
" autoload the test suite.
function! EagerlyDetectTestSuite()
  if exists('g:test#last_position')
    return
  endif

  " only supports PHP at the moment. Able to be extended to other languages
  " and tools though.
  let s:patterns = [{'dir': 'tests','pattern': 'Test.php'}]

  for s:p in s:patterns
    let s:path = trim(system('fd '.shellescape(s:p.pattern).' '.shellescape(s:p.dir).' -s | sed -n 1p'))

    if s:path !=# ''
      let g:test#last_position = {
            \ 'file': s:path,
            \ 'col': 1,
            \ 'line': 1,
            \}
      return
    endif
  endfor
endfunction

" TODO: this should probably be in an autocommand
call EagerlyDetectTestSuite()
