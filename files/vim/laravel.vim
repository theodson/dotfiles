" Run a "php artisan *" command
nmap <expr> <Leader>la ':!'.g:cli_cmd_prefix.' php artisan<Space>'

" Launch a tinker shell
nmap <expr> <Leader>lt ':!'.g:cli_cmd_prefix.' php artisan tinker<CR>'

" Create and open a file via "php artisan make:*"
nmap <leader>lm :ArtisanMake<space>
command! -nargs=+ ArtisanMake call ArtisanMake(<q-args>)
function! ArtisanMake(input)
    let before = system('php -r "echo hrtime(true);"')
    let output = trim(system(g:cli_cmd_prefix.' php artisan make:'.a:input))
    let after = system('php -r "echo hrtime(true);"')

    if v:shell_error != 0
        echo output
        return v:shell_error
    endif

    let within = after - before

    let path = trim(system('fd --changed-within="'.within.' ns" --type f'))

    execute('e '.path)
endfunction
