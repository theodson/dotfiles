" Plugin: tpope/vim-dispatch
" Plugin: janko/vim-test

call EagerlyDetectTestSuite()

" use PHPUnit as the php test runner, not artisan test
let test#php#phpunit#executable = 'vendor/bin/phpunit --colors=always'

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

" Toggle testing strategy
nmap <Leader>tt :TestToggleStrategy<CR>

command! TestToggleStrategy call TestToggleStrategy()

