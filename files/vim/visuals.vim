" Plugin: dracula

" Use 24-bit colours
set termguicolors

" Set the verical split border character
set fillchars+=vert:·,

" Use the dracula colourscheme
colorscheme dracula

" Personal customisations I've made to Dracula
augroup dracula_customization
  autocmd!
  " This makes variables, like $user, green. Gives variables a bit of spice.
  highlight! link Identifier DraculaGreen

  " The green highlighting is to much for me and doesn't work well with green
  " variables.
  highlight! Search gui=bold guibg=#191A21 guifg=#FFB86C

  " I don't want the status bar a different background colour. And who doesn't
  " want more purple in their lives?
  highlight! link StatusLine DraculaPurpleItalic

  " I prefer a darker background across the board to improve fg bg contrast.
  " Feels easier on the eyes.
  highlight! Normal guibg='#21222C' guifg='#F8F8F2'

  " Make the popup menu selection more obvious and have the background stand
  " out better.
  highlight! Pmenu guibg='#191A21'
  highlight! PmenuSel guibg='#191A21' guifg='#50FA7B'

  " Make the colour columns darker
  highlight! link ColorColumn DraculaBgDarker

  highlight ExtraWhitespace guibg='#FF79C6'
augroup END
