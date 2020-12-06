" My dotfiles. Mine, not yours. But you're welcome to borrow them anytime 😃

" Load some good defaults that ship with VIM
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" Helper to source other config files
function! SourceDotFile(file)
  execute 'source ~/Code/dotfiles/files/vim/' . a:file
endfunction

" Some initial vars we want setup early
let mapleader = "\<Space>"
let inGitRepo = ! empty(finddir('.git'))

" Load up all the extensions
call plug#begin('~/.vim/plugged')
  call SourceDotFile('plugins.vim')
call plug#end()

" Setup my custom config
call SourceDotFile('defaults.vim')
call SourceDotFile('visuals.vim')
call SourceDotFile('filetypes.vim')
call SourceDotFile('searching.vim')
call SourceDotFile('coding.vim')
call SourceDotFile('testing.vim')
call SourceDotFile('linting.vim')
call SourceDotFile('logging.vim')
call SourceDotFile('frontend.vim')
call SourceDotFile('php.vim')
call SourceDotFile('laravel.vim')
call SourceDotFile('markdown.vim')

" Allow a local ".vimrc" for per directory configuration changes
set secure
set exrc
