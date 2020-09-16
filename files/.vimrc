" Don't try and emulate the Vi editor. This must be first as it changes other
" options as a side-effect
set nocompatible

" use spaces instead of tabs
set expandtab

" size of a tab is 4 spaces
set tabstop=4

" size of an indent is 4 spaces
set shiftwidth=4

set autoindent

" per filetype, e.g. .php, .js, etc
filetype plugin indent on

 "Improvements I'd like to make:
" 1. Pear tree to auto complete matching blade tags, i.e. @if($thing) @endif
" and @auth @endauth, but not @csrf
" 2. Tell vim-test where to find the test suites. Currently you cannot open a
" project, open a /src file, run all tests. You have to visit a test file
" first.
" 3. Would love if when I paste it automatically indents. Probably need to do
" it for lines with not content though.
" 4. Setup vim-test exectuable to make PHPUnit output pretty
" 5. Use --word-diff on git diffs by default?
" 6. Show current git branch in VIM
" 7. Search the help for all instances of PHP related content.
" 8. Lazy load plugins
"

call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tmsvg/pear-tree'
Plug 'tpope/vim-commentary'
Plug 'janko/vim-test'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install' }
Plug 'chrisbra/matchit'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'phpactor/phpactor', {'for': 'php', 'branch': 'master', 'do': 'composer install --no-dev -o'}
Plug 'tpope/vim-vinegar'
Plug 'darfink/vim-plist'
call plug#end()

" MISC =======================================================================
" Set the default character encoding for values
set encoding=utf-8

set spelllang=en_au
autocmd FileType markdown,gitcommit setlocal spell

" don't show welcome message
set shortmess=I


" Store .swp files in a central location so they don't end up in version
" control etc. Double slash ensure unique names across projects.
set directory=$HOME/.vim_swap//

" use a backup when writing files
set writebackup
set backupdir=$HOME/.vim_backup//

" Persistent undo
set undofile
set undodir=$HOME/.vim_undo//

" keep X lines of command history
set history=500

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" DISPLAY ====================================================================

" Always show the status bar
set laststatus=2

" Show all possible results in a tab-able menu in the status bar
set wildmenu
set wildmode=longest,list,full

" Show line length indicators
set colorcolumn=80,120

" show line numbers
set number

" show relative line numbers above and below current line
set relativenumber

" set a consistent width to the line numbers
set numberwidth=5

" splits feel more natural opening to the right / bottom
set splitbelow
set splitright

" EDITING ====================================================================

" if an open file changes while loaded in a buffer, update the buffer with the
" file contents
set autoread

" Allow backspacing like it isn't the 1980's
set backspace=indent,eol,start

" Always keep X lines between the cursor and the top / bottom of the screen
set scrolloff=3

" allow buffers to enter background in an unsaved state
set hidden

" Share the MacOS clipboard
set clipboard=unnamed

" when joining lines, if both lines are commented, delete the comment token
" from the beginning of the line being joined
set formatoptions+=j

" when incrementing and decremeting numbers (Ctrl-A / Ctrl-X), don't assume
" numbers that start with 0 are octal. Treat them as base 10.
set nrformats-=octal

" By default "Y" is the same as "yy", but like "D" is makes sense for "Y" to
" just yank from the cursor to the end of the line.
nmap Y y$


" INDENTING ==================================================================


imap <silent> jk <Esc>
nmap <C-s> :write<CR>
noremap <Left> :echo 'hjkl'<CR>
noremap <Right> :echo 'hjkl'<CR>
noremap <Up> :echo 'hjkl'<CR>
noremap <Down> :echo 'hjkl'<CR>

" Location list. Used for navigating linting errors, mostly
nmap [L :lfirst<cr>
nmap [l :lprevious<cr>
nmap ]l :lnext<cr>
nmap ]L :llast<cr>
nmap [C :cfirst<cr>
nmap [c :cprevious<cr>
nmap ]c :cnext<cr>
nmap ]C :clast<cr>
nmap <leader>rc :vsplit ~/.vimrc<CR>
" format (gq) a file (af)
nmap gqaf :ALEFix<CR>

" Detect if we are in a GIT repo
let inGitRepo=! empty(finddir('.git'))

" Take me to your leader
let mapleader="\<Space>"

" Open the file explorer, you sadistic mofo
" nmap <Leader>- :Explore<CR>

" Launch tinker shell
nmap <Leader>lt :!php artisan tinker<CR>

" Laravel artisan command
nmap <Leader>la :!php artisan<Space>

" Clear and tail laravel logs
nmap <Leader>ll :Start! tail -f -n 0 ./storage/logs/laravel.log<CR>

" Run 'npm run dev' in a background job
nmap <Leader>npd :Dispatch! npm run dev<CR>

" Run 'npm run watch' in a background tab
nmap <Leader>npw :Start! npm run watch<CR>

" Trim trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Coding ====================================================================

" Plugin: pear-tree
" See: https://github.com/tmsvg/pear-tree

" intelligently decide when to add, remove, and skip character pairs
let g:pear_tree_smart_openers=1
let g:pear_tree_smart_closers=1
let g:pear_tree_smart_backspace=1

" Additional pairs to autocomplete
let g:pear_tree_pairs = {
    \ '(': {'closer': ')'},
    \ '[': {'closer': ']'},
    \ '{': {'closer': '}'},
    \ "'": {'closer': "'"},
    \ '"': {'closer': '"'},
    \ '<!--': {'closer': '-->'},
    \ '{{--': {'closer': '--}}'},
\ }


" Plugin: dracula/vim
" See: https://github.com/dracula/vim

" highlight markdown code blocks
autocmd BufNewFile,BufRead *.md set filetype=markdown

let g:markdown_fenced_languages=['php', 'blade']

let g:vim_markdown_strikethrough = 1

" polyglot plugin
let g:vim_markdown_frontmatter = 1

"=======================================================
" COLOUR SCHEME
"=======================================================

syntax enable
set termguicolors
colorscheme dracula

augroup dracula_customization
  autocmd!
  " The green highlighting is to much for me.
  highlight! Search gui=bold guibg=#191A21 guifg=#FFB86C

  " I don't want the status bar a different bg colour. And who doesn't want
  " more purple in their lives?
  highlight! link StatusLine DraculaPurpleItalic

  " This makes variables, like $user, green. Looks prettier IMO
  highlight! link Identifier DraculaGreen

  " I prefer a darker background to improve fg bg contrast. Feels easier on
  " the eyes
  highlight! Normal guibg=#21222C guifg=#F8F8F2
augroup END

" Searching =================================================================
" search everywhere. type :command Rg to see the original definition
command! -nargs=* -bang RG call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case --no-ignore -- '.shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)

nmap <leader>/ :Rg!<space>
nmap <leader>? :RG!<space>



nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" Perform case-insensitive searches
set ignorecase
" Highlight results matching search query
set hlsearch
" Highlight searches as you type
set incsearch

" Plugin: fzf.vim
" See: https://github.com/junegunn/fzf.vim

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

" Testing ===================================================================

" Plugin: vim-test
" See: https://github.com/janko/vim-test

" use PHPUnit, not artisan test
let test#php#phpunit#executable = 'vendor/bin/phpunit --colors=always'
" Run whole test suite in a background job
nmap <Leader>ta :Dispatch! ./vendor/bin/phpunit<CR>
" Run current suite
nmap <Leader>ts :TestFile<CR>
" Run current file
nmap <Leader>tf :TestFile<CR>
" Run last test
nmap <Leader>tl :TestLast<CR>
" Run current test
nmap <Leader>tc :TestNearest<CR>
" Visit the test
nmap <Leader>tv :TestVisit<CR>
" Toggle testing strategy
nmap <Leader>tt :TestToggleStrategy<CR>

" Plugin: vim-dispatch
" See: https://github.com/tpope/vim-dispatch

let g:test#strategy=""

" Allow toggling between tests dispatched in background or fullscreen
function! TestToggleStrategy()
  if exists("g:test#strategy")
    unlet g:test#strategy
    echo "Test Strategy: default"
  else
    let g:test#strategy="dispatch_background"
    echo "Test Strategy: background dispatch"
  endif
endfunction
command! TestToggleStrategy call TestToggleStrategy()

" PHP ======================================================================

" do not auto indent PHP to make arrows match indentation across lines, i.e.
" don't do this....
" $this->thing->and->then()
"                  ->match()
"                  ->arrow()
"                  ->indentation();
let g:PHP_noArrowMatching=1
" Review up to here
" Plugin: phpactor/phpactor
" See: https://github.com/phpactor/phpactor
nmap <Leader>in :call phpactor#Transform("fix_namespace_class_name")<CR>
nmap <Leader>cc :call phpactor#Transform("complete_constructor")<CR>
nmap <Leader>ic :call phpactor#UseAdd()<CR>
nmap <Leader>gd :call phpactor#GotoDefinition()<CR>
nmap <Leader>ec *N:noh<CR>i\<esc>e:call phpactor#ClassExpand()<CR>

" Plugin: StanAngeloff/php.vim
" See: https://github.com/StanAngeloff/php.vim
" Don't highlight html in PHP files. Performance improvement.
let php_html_load=0
" Don't highlight html in SQL in PHP files. Performance improvement.
let php_sql_query=0
" Don't highlight docs
let php_ignore_phpdoc=1
" Dont highlight any of the php native / extension functions
let g:php_syntax_extensions_enabled=[]
" highlight $ with variable
let php_var_selector_is_identifier=1



" Vue ========================================================================

" Plugin: posva/vim-vue
" See: https://github.com/posva/vim-vue
" Don't autodetect the prerocessor languages in Vue files. Helps with
" performance, and hopefully some syntax highlighting issues
let g:vue_pre_processors=[]

" Occassionaly vim will screw up Vue highlighting. This refreshes the
" highlighting whenever a Vue file is opened
autocmd FileType vue syntax sync fromstart

nmap <leader>lm :ArtisanMake<space>
command! -nargs=+ ArtisanMake call s:ArtisanMake(<q-args>)

function <SID>ArtisanMake(input)
    let before = system('php -r "echo hrtime(true);"')
    let output = trim(system('php artisan make:'.a:input))
    let after = system('php -r "echo hrtime(true);"')

    if v:shell_error != 0
        echo output
        return v:shell_error
    endif

    let within = after - before

    let path = trim(system('fd --changed-within="'.within.' ns" --type f'))

    execute('e '.path)
endfunction

" function <SID>MakeFile(path)
"     if empty(match) && empty(currentFileExtension)
"         let fullPath = a:path
"     else if empty(match) && ! empty(currentFileExtension)
"         let extension =
"         et fullPath = a:path.'.'.expand('%:e')
"     endif

"     let result = system('touch '.fullPath)

"     if v:shell_error != 0
"         echo output
"         return v:shell_error
"     endif

"     execute('e '.fullPath)
" endfunction

" function <SID>MakeFileExtension(path)
"     let match = matchstr(a:path, '[^\.]\.[^\.].*')

"     if ! empty(match)
"         return substitute(match, '.\.', '.', '')
"     endif

"     let currentFileExtension = expand('%:e')

"     if empty(currentFileExtension)
"         return ''
"     else
"         return '.'.currentFileExtension
"     endif
" endfunction

" command! -nargs=+ MakeFile call s:MakeFile(<q-args>)

" Create a new class in the current directory
nmap <Leader>n :e %:h/.php<Left><Left><Left><Left>


" fixing...
let g:ale_fixers = { 'php': ['php_cs_fixer'] }
let g:ale_fix_on_save = 1

" fallback to global binary if not installed on local project
if filereadable('vendor/bin/php-cs-fixer')
    let g:ale_php_cs_fixer_executable = 'vendor/bin/php-cs-fixer'
else
    let g:ale_php_cs_fixer_executable = 'php-cs-fixer'
endif

if (filereadable('.php_cs') || filereadable('.php_cs.dist'))
    " great. just let the tool find the right config to use
elseif filereadable('.php_cs.local')
    if match(readfile('.php_cs.local'), '\S') == -1
        " .php_cs.local is empty, indicating we should just use the global
        " laravel rules
        let s:php_cs_config = $HOME.'/.php_cs.laravel'
    else
        let s:php_cs_config = '.php_cs.local'
    endif
    let g:ale_php_cs_fixer_options = '--using-cache=no --path-mode=override --config="'.s:php_cs_config.'"'
else
    " no config information is present, so we'll use the global laravel config
    " and only fix when called manually with `gqaf`
    let g:ale_php_cs_fixer_options = '--using-cache=no --path-mode=override --config='.$HOME.'/.php_cs.laravel'
    let g:ale_fix_on_save = 0
endif

" Linting
let g:ale_cache_executable_check_failures = 1
let g:ale_php_phpstan_executable = 'vendor/bin/phpstan'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 0
let g:ale_sign_error = '👀'
autocmd FileType php let b:ale_linters = ['php', 'psalm', 'phpstan']

" automatically source this file when saved
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc nested source %
augroup END

autocmd BufNewFile,BufRead .php_cs* set filetype=php
" autocmd FileType html let b:match_words = substitute(b:match_words, '<:>,', '', '').',<:>'


" stop weird highlighting of text inside italic tags
let html_no_rendering=0

" try infer the test suite, so that :TestSuite works without opening a test
" file

if exists('g:test#last_position')
  finish
endif

let s:patterns = [{'dir': 'tests', 'pattern': 'Test.php'}]

for s:p in s:patterns
    let s:path = trim(system('fd '.shellescape(s:p.pattern).' '.shellescape(s:p.dir).' -s | sed -n 1p'))
    if s:path !=# ''
        let g:test#last_position = {
          \ 'file': s:path,
          \ 'col': 1,
          \ 'line': 1,
          \}
    finish
  endif
endfor
