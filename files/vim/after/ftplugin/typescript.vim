" Wrap visual selection in a `console.log` call
vnoremap L cconsole.log(<ESC>pa);<ESC>

setlocal expandtab
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2

let b:ale_fixers = ['prettier']
