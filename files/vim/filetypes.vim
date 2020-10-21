augroup filetypes
  autocmd!
augroup END

" Remap file types
autocmd filetypes BufNewFile,BufRead *.md set filetype=markdown
autocmd filetypes BufNewFile,BufRead .env.* set filetype=sh
autocmd filetypes BufNewFile,BufRead .php_cs* set filetype=php
autocmd filetypes BufNewFile,BufRead *.json.* set filetype=json
