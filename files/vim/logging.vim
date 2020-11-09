augroup logging
  autocmd!
augroup END

" When visually selecting, "L" to wrap in "print" statements
autocmd logging FileType php vnoremap L cdd(<ESC>pa)<ESC>
autocmd logging FileType js vnoremap L cconsole.log(<ESC>pa);<ESC>
