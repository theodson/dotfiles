" Run a "php artisan *" command
nmap <Leader>la :!php artisan<Space>

" Launch a tinker shell
nmap <Leader>lt :!php artisan tinker<CR>

" Clear and tail laravel logs
" TODO: Not working correctly at the moment. Need to investigate.
nmap <Leader>ll :Start! tail -f -n 0 ./storage/logs/laravel.log<CR>

" Create and open a file via "php artisan make:*"
nmap <leader>lm :ArtisanMake<space>

" format (gq) a file (af)
nmap gqaf :ALEFix<CR>

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
