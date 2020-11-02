" Plugin: /usr/local/opt/fzf
" Plugin: junegunn/fzf.vim

" -----------------------------------------------------------------------------
"  Buffer search
" -----------------------------------------------------------------------------

" Clear buffer search highlighting
" See: https://github.com/tpope/vim-sensible/blob/2d9f34c09f548ed4df213389caa2882bfe56db58/plugin/sensible.vim#L35
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" When moving between search results via "n" and "N" I want the search result
" to appear vertically centered
nnoremap <silent>n :call GoToSearchResultAndCenter(1)<CR>
nnoremap <silent>N :call GoToSearchResultAndCenter(0)<CR>

function! GoToSearchResultAndCenter(forward)
    let s:scrollOffToRestore=&scrolloff
    set scrolloff=999
    try
        if a:forward
            silent normal! n
        else
            silent normal! N
        endif
    finally
        let &scrolloff=s:scrollOffToRestore
    endtry
endfunction

" -----------------------------------------------------------------------------
"  Project search
" -----------------------------------------------------------------------------

" Activate local project search
nnoremap <leader>/ :Rg<space>

command! -nargs=* -bang Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --hidden -g !.git -- ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)

" Activate global project search
nnoremap <leader>// :RG<space>

command! -nargs=* -bang RG call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case --no-ignore -g !.git -- '.shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)

" -----------------------------------------------------------------------------
"  Fuzzy file/resultset finder
" -----------------------------------------------------------------------------

" Allow navigating through previous search queries with CTRL-P / CTRL-N
let g:fzf_history_dir='~/.fzf_history'

" Search for global project file
nnoremap <Leader>fg :Files<CR>
" Search for open buffers
nnoremap <Leader>fb :Buffers<CR>
" Search for previously opened files
nnoremap <Leader>fh :History<CR>
" Search for current buffers files
nnoremap <Leader>fl :Lines<CR>
" Search for dirty git files
nnoremap <Leader>fd :GFiles?<CR>

" Search for local project files
" Note: I often reach for "<Leader>ff" in non-git directories as it is my goto
" search. This conditional allows me to use it everywhere, and have it
" fallback to global search in no-Git repos.
if inGitRepo
  nnoremap <Leader>ff :GFiles<CR>
else
  nnoremap <Leader>ff :Files<CR>
endif
