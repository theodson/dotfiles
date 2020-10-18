" Allow toggling between the test suite being dispatched in background or
" fullscreen
function! TestToggleStrategy()
  if exists("g:test#strategy")
    unlet g:test#strategy
    echo "Test Strategy: default"
  else
    let g:test#strategy="dispatch_background"
    echo "Test Strategy: background dispatch"
  endif
endfunction

" When you first open VIM the vim-test plugin does not know about the test
" files, so you cannot run commands. This infers the last_postition to
" autoload the test suite.
function! EagerlyDetectTestSuite()
  if exists('g:test#last_position')
    return
  else
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
        finish
      endif
    endfor
  endif
endfunction
