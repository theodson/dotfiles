" Use 2 spaces instead of tab characters
setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

" Use "//" instead of "<!-- -->" style comments
setlocal commentstring=//\ %s

let b:ale_fixers = ['prettier', 'eslint']
