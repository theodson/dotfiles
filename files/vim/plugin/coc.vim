" what is this exactly
set updatetime=500

let g:coc_global_extensions = [
\ 'coc-highlight',
\ 'coc-html',
\ 'coc-json',
\ 'coc-tailwindcss'
\ ]

" don't show welcome message
set shortmess=I
" COC wants this
set shortmess+=c
" COC wants this
set signcolumn=number

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
