" Run a "php artisan *" command
nmap <Leader>la :!php artisan<Space>

" Launch a tinker shell
nmap <Leader>lt :!php artisan tinker<CR>

" Clear and tail laravel logs
" TODO: Not working correctly at the moment. Need to investigate.
nmap <Leader>ll :Start! tail -f -n 0 ./storage/logs/laravel.log<CR>

" Create and open a file via "php artisan make:*"
nmap <leader>lm :ArtisanMake<space>

command! -nargs=+ ArtisanMake call ArtisanMake(<q-args>)

function! ArtisanMake(input)
    let before = system('php -r "echo hrtime(true);"')
    let output = trim(system('php artisan make:'.a:input))
    let after = system('php -r "echo hrtime(true);"')

    if v:shell_error != 0
        echo output
        return v:shell_error
    endif

    let within = after - before

    let path = trim(system('fd --changed-within="'.within.' ns" --type f'))

    execute('e '.path)
endfunction
