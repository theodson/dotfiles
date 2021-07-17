" Turn on spell check
setlocal spell

let g:markdown_fenced_languages = [
    \ 'help',
    \ 'vim',
    \ ]

" Support strikethrough in markdown
let g:vim_markdown_strikethrough = 1

" Support frontmatter in markdown
let g:vim_markdown_frontmatter = 1

" Don't indent when "opening" a new line in a list
let g:vim_markdown_new_list_item_indent = 0
