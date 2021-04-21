augroup frontend
  autocmd!
augroup END
d
" Run "npm run dev" in a background job
nmap <Leader>npd :Dispatch! npm run dev<CR>

" Run "npm run watch" in a background tab
nmap <Leader>npw :Start! npm run watch<CR>

" Use 2 spaces instead of tab characters
autocmd frontend FileType vue set expandtab tabstop=2 shiftwidth=2 softtabstop=2

" Use "//" instead of "<!-- -->" style comments
autocmd frontend FileType vue setlocal commentstring=//\ %s
