" Run "npm run dev" in a background job
nmap <expr> <Leader>npd ':Dispatch! '.g:cli_cmd_prefix.' npm run dev<CR>'

" Run "npm run watch" in a background tab
nmap <expr> <Leader>npw ':Start! '.g:cli_cmd_prefix.' npm run watch<CR>'
