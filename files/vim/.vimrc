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

" Load some good defaults that ship with VIM
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

function! SourceDotFile(file)
  execute 'source ~/Code/dotfiles/files/vim/' . a:file
endfunction

call plug#begin('~/.vim/plugged')
  call SourceDotFile('plugins.vim')
call plug#end()

call SourceDotFile('defaults.vim')
call SourceDotFile('pretty.vim')
call SourceDotFile('filetype.vim')
call SourceDotFile('search.vim')
call SourceDotFile('plugin/coc.vim')


" Take me to your leader
let mapleader="\<Space>"
" By default "Y" is the same as "yy", but like "D" is makes sense for "Y" to
" just yank from the cursor to the end of the line.
nmap Y y$
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

let g:markdown_fenced_languages=['php', 'blade']

let g:vim_markdown_strikethrough = 1

" polyglot plugin
let g:vim_markdown_frontmatter = 1




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
" nmap <Leader>in :call phpactor#Transform("fix_namespace_class_name")<CR>
" nmap <Leader>cc :call phpactor#Transform("complete_constructor")<CR>
" nmap <Leader>ic :call phpactor#UseAdd()<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>qf <Plug>(coc-fix-current)
nmap <leader>ac <Plug>(coc-codeaction)
" nmap <Leader>ec *N:noh<CR>i\<esc>e:call phpactor#ClassExpand()<CR>

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
