" By default "Y" is the same as "yy", but like "D" is makes sense for "Y" to
" just yank from the cursor to the end of the line.
nnoremap Y y$

" "jk" to escape
inoremap <silent> jk <Esc>

" Save buffer
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>

" Disable arrow keys
noremap <Left> <nop>
noremap <Right> <nop>
noremap <Up> <nop>
noremap <Down> <nop>

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

" if an open file changes while loaded in a buffer, update the buffer with the
" file contents
set autoread

" Disable swap files
set noswapfile

" Disable backup write files
set nobackup

" Persistent undo
set undofile
set undodir=$HOME/.vim_undo//

" This is how quickly things can notice changes in a buffer, such as text
" changes or when holding cursor over a word
set updatetime=300

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

" Allow a word to contain a-dash
set iskeyword+=-

set timeoutlen=400

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

set cursorline

set noerrorbells
set visualbell t_vb=

" ----------------------------------------
"  Searching
" ----------------------------------------

" Perform case-insensitive searches
set ignorecase

" When search term contains capitals, use case sensitive searche
set smartcase

" Highlight results matching search query as you type
set hlsearch
