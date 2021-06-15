" Run "npm run dev" in a background job
nmap <expr> <Leader>npd ':Dispatch! '.g:cli_cmd_prefix.' npm run dev<CR>'

" Run "npm run watch" in a background tab
nmap <expr> <Leader>npw ':Start! '.g:cli_cmd_prefix.' npm run watch<CR>'

" Use 2 spaces instead of tab characters
autocmd vimrc FileType vue set expandtab tabstop=2 shiftwidth=2 softtabstop=2

" Use "//" instead of "<!-- -->" style comments
autocmd vimrc FileType vue setlocal commentstring=//\ %s
