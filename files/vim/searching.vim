" -----------------------------------------------------------------------------
"  Buffer search
" -----------------------------------------------------------------------------

" Perform case-insensitive searches
set ignorecase

" When search term contains capitals, use case sensitive searche
set smartcase

" Highlight results matching search query as you type
set hlsearch

" nnoremap / :BLines<CR>

" Clear buffer search highlighting
" See: https://github.com/tpope/vim-sensible/blob/2d9f34c09f548ed4df213389caa2882bfe56db58/plugin/sensible.vim#L35
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" -----------------------------------------------------------------------------
"  Project search
" -----------------------------------------------------------------------------

" Activate local project search
let g:base_project_search_command = 'rg --column --line-number --no-heading --color=always --smart-case --hidden -g !.git'
nnoremap <leader>/ :call ProjectPlainSearch()<CR>
function! ProjectPlainSearch()
  let plain_command = g:base_project_search_command.' --fixed-strings -- %s || true'

  let initial_command = printf(plain_command, '')

  let plain_reload_command = printf(plain_command, '{q}')

  let spec = {'options': [
      \ '--phony',
      \ '--prompt',
      \ 'Project plain search: ',
      \ '--bind',
      \ 'change:reload:'.plain_reload_command,
      \ '--bind',
      \ 'ctrl-f:unbind(change)+change-prompt(Result filter: )+enable-search+clear-query',
      \ ]}

  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec))
endfunction

nnoremap <leader>/* :call ProjectRegexSearch()<CR>
function! ProjectRegexSearch()
  let regex_command = g:base_project_search_command.' -- %s || true'

  let regex_reload_command = printf(regex_command, '{q}')

  let initial_command = printf(regex_command, '')

  call Search(initial_command, regex_reload_command, 'Project regex search')
endfunction

function! Search(initial, reload, prompt)
  let spec = {'options': [
      \ '--phony',
      \ '--prompt',
      \ 'Project regex search: ',
      \ '--bind',
      \ 'change:reload:'.a:reload,
      \ '--bind',
      \ 'ctrl-f:unbind(change)+change-prompt('.a:prompt.': )+enable-search+clear-query',
      \ ]}

  call fzf#vim#grep(a:initial, 1, fzf#vim#with_preview(spec))
endfunction

" Activate global project search
nnoremap <leader>// :call GlobalPlainSearch()<CR>
function! GlobalPlainSearch()
  let search_command = 'rg --column --line-number --no-heading --color=always --smart-case --no-ignore -g !.git -- %s || true'

  let initial_command = printf(search_command, '')

  let reload_command = printf(search_command, '{q}')

  let spec = {'options': [
      \ '--phony',
      \ '--prompt',
      \ 'Global search: ',
      \ '--bind',
      \ 'change:reload:'.reload_command,
      \ ]}

  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec))
endfunction

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
nnoremap <Leader>ff :call FindFiles()<CR>
function! FindFiles()
    if InGitRepo()
        execute ':GFiles'
    else
        execute ':Files'
    endif
endfunction
