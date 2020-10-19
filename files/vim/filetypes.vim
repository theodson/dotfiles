augroup filetypes
  autocmd!

  " File type remappings
  autocmd BufNewFile,BufRead *.md set filetype=markdown
  autocmd BufNewFile,BufRead .env.* set filetype=sh
  autocmd BufNewFile,BufRead .php_cs* set filetype=php

  " Indentation sizing
  autocmd FileType vim setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
  autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
  autocmd FileType html setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
  autocmd FileType css setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
  autocmd FileType scss setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
  autocmd FileType javascript setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
  autocmd FileType json setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
  autocmd FileType vue setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

  " Comment string
  autocmd FileType php setlocal commentstring=//\ %s
  autocmd FileType vue setlocal commentstring=//\ %s

  " Add $ to the php $variable keyword
  autocmd FileType php setlocal iskeyword+=$

  " Turn on spell check
  autocmd FileType markdown,gitcommit setlocal spell
augroup END
