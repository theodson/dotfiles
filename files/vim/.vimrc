"
" My dotfiles. Mine, not yours. But you're welcome to borrow them anytime 😃
"

" Load some good defaults that ship with VIM
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" A prefix to easy run commands locally or in a docker container as needed.
" You can override this in a local `.vimrc` file per project.
let g:cli_cmd_prefix = ''

" Take me to your leader!
let mapleader = "\<Space>"

" Helper to source other config files
function! SourceDotFile(file)
  execute 'source ~/Code/dotfiles/files/vim/' . a:file
endfunction

" Helper to determine if we are in a git repo. As a function to not impact
" startup time.
function! InGitRepo()
    if ! exists("g:in_git_repo")
        let g:in_git_repo=! empty(finddir('.git'))
    endif

    return g:in_git_repo
endfunction

" A global autocommand group to utilise thorough my vimrc config
augroup vimrc
  autocmd!
augroup END

" Load up all the extensions
call plug#begin('~/.vim/plugged')
  call SourceDotFile('plugins.vim')
call plug#end()

" Setup my custom config
call SourceDotFile('coding.vim')
call SourceDotFile('defaults.vim')
call SourceDotFile('filetypes.vim')
call SourceDotFile('frontend.vim')
call SourceDotFile('laravel.vim')
call SourceDotFile('linting.vim')
call SourceDotFile('logging.vim')
call SourceDotFile('markdown.vim')
call SourceDotFile('php.vim')
call SourceDotFile('searching.vim')
call SourceDotFile('testing.vim')
call SourceDotFile('visuals.vim')

" Allow a local ".vimrc" for per directory configuration changes
set secure
set exrc
