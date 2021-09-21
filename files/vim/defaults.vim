" ----------------------------------------
"  Fixes to default behaviour
" ----------------------------------------

" By default "Y" is the same as "yy", but like "D" is makes sense for "Y" to
" just yank from the cursor to the end of the line.
nnoremap Y y$

nnoremap gx :call OpenURLUnderCursor()<CR>
function! OpenURLUnderCursor()
  let s:uri = expand('<cWORD>')
  let s:uri = substitute(s:uri, '?', '\\?', '')
  let s:uri = shellescape(s:uri, 1)
  if s:uri != ''
    silent exec "!open '".s:uri."'"
    :redraw!
  endif
endfunction

" ----------------------------------------
"  Files & Buffers
" ----------------------------------------

" Set file encoding
set encoding=utf-8

" splits feel more natural opening to the right / bottom
set splitright
set splitbelow

" allow buffers to enter background in an unsaved state
set hidden

" Prompt to save modified buffers when quiting
set confirm

" Disable swap files
set noswapfile

" Persistent undo
set undofile
set undodir=$HOME/.vim/undo_history//

" ----------------------------------------
"  Editing
" ----------------------------------------

" Use the Australian dictionary
set spelllang=en_au

" Share the MacOS clipboard
set clipboard=unnamed

" When joining lines, if both lines are commented, delete the comment token
" from the beginning of the line being joined
set formatoptions+=j

" Use 4 spaces instead of tab characters
set expandtab tabstop=4 shiftwidth=4 softtabstop=4

set timeoutlen=400

" don't add a new line at the end of files automatically
set nofixendofline

" Kick the bad habits
let g:hardtime_default_on = 1
let g:list_of_normal_keys = ["h", "j", "k", "l", "+"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "-", "+"]
let g:list_of_insert_keys = []
let g:list_of_disabled_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]


" ----------------------------------------
"  Presentation
" ----------------------------------------

" Show current and relative line numbers
set number
set relativenumber

" set a consistent width to the line numbers column
set numberwidth=4

" Always show the current filename in the status bar
set laststatus=2

" Show line length indicators
set colorcolumn=80,120

" Highlight the current active line
set cursorline

" Remove noise when an error occurs
set noerrorbells
set visualbell t_vb=

set scrolloff=2
