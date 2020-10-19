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

let mapleader="\<Space>"
let inGitRepo=! empty(finddir('.git'))

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
call SourceDotFile('visuals.vim')
call SourceDotFile('filetypes.vim')
call SourceDotFile('searching.vim')
call SourceDotFile('testing.vim')
call SourceDotFile('linting.vim')
call SourceDotFile('plugin/coc.vim')



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



" automatically source this file when saved
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc nested source %
augroup END

" stop weird highlighting of text inside italic tags
let html_no_rendering=0

