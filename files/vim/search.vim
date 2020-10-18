" search everywhere. type :command Rg to see the original definition
command! -nargs=* -bang RG call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case --no-ignore -g !.git -- '.shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
" include hidden files. type :command Rg to see the original definition
command! -nargs=* -bang Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --hidden -g !.git -- ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)

nmap <leader>/ :Rg!<space>
nmap <leader>? :RG!<space>



nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
" Allow navigating through previous search queries with CTRL-P / CTRL-N
let g:fzf_history_dir='~/.fzf_history'

" Find file globally
nmap <Leader>fg :Files!<CR>
" Find open buffers
nmap <Leader>fb :Buffers!<CR>
" Find file history
nmap <Leader>fh :History!<CR>
" Find 'locally' / Lines
nmap <Leader>fl :Lines!<CR>
" Find dirty fit giles
nmap <Leader>fd :GFiles?<CR>
" Plugin: fzf.vim
" See: https://github.com/junegunn/fzf.vim


" I often reach for `ff` in non-git repos as it is my goto search. This allows
" me to use it everywhere, and have it fallback to global search in no-Git
" repos.
if inGitRepo
    " Find files
    nmap <Leader>ff :GFiles!<CR>
else
    " Find files
    nmap <Leader>ff :Files!<CR>
endif
