" Fuzzy finder
" See: https://github.com/junegunn/fzf
Plug '/usr/local/opt/fzf'

" FZF vim wrapper
" See: https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf.vim'

" Smart escaping of options when searching
" See: https://github.com/jesseleite/vim-agriculture
Plug 'jesseleite/vim-agriculture'

" Dracula colour scheme
" See: https://github.com/dracula/vim
Plug 'dracula/vim', { 'as': 'dracula' }

" Auto pair characters such as [], (), {}
" See: https://github.com/tmsvg/pear-tree
Plug 'tmsvg/pear-tree'

" Code commenting
" See: https://github.com/tpope/vim-commentary
Plug 'tpope/vim-commentary'

" Test suite runner
" See: https://github.com/vim-test/vim-test
Plug 'janko/vim-test'

" Kickoff async jobs
" See: https://github.com/tpope/vim-dispatch
Plug 'tpope/vim-dispatch'

" Surround stuff with other "stuffs"
" See: https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

" Preview markdown files while you edit them
" See: https://github.com/iamcco/markdown-preview.nvim
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Jump to matches, such as matching HTML tags
" See: https://github.com/chrisbra/matchit
Plug 'chrisbra/matchit'

" Syntax and indenting for languages
" See: https://github.com/sheerun/vim-polyglot
Plug 'sheerun/vim-polyglot'

" Linting
" See: https://github.com/dense-analysis/ale
Plug 'dense-analysis/ale'

" Small tweaks to the netrw file browser
" See: https://github.com/tpope/vim-vinegar
Plug 'tpope/vim-vinegar'

" Repeated keystroke patterns in a plugin
" See: https://github.com/tpope/vim-unimpaired
Plug 'tpope/vim-unimpaired'

" Support plist files
" See: https://github.com/darfink/vim-plist
Plug 'darfink/vim-plist'

" Show and allow stripping whitespace
" See: https://github.com/ntpeters/vim-better-whitespace
Plug 'ntpeters/vim-better-whitespace'

" PHP intellegence and refactoring
Plug 'phpactor/phpactor', {'for': 'php', 'branch': 'master', 'do': 'composer install --no-dev -o'}

" Language server support
" See: https://github.com/neoclide/coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" COC plugins
let g:coc_global_extensions = [
      \ 'coc-phpls',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-tailwindcss',
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-tsserver',
      \ 'coc-vetur',
      \ 'coc-vimlsp',
      \ ]
