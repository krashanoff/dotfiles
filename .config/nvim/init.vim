" l
"

call plug#begin('~/.config/nvim/plugged')

" virgin nerdtree v. chad chadtree
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}

" completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" languages
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

" core settings
set tabstop=4
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" coc
set updatetime=1000
set shortmess+=c
set number
inoremap <silent><expr> <c-space> coc#refresh()

" IDE-style bindings
nnoremap <silent><leader>t <cmd>CHADopen<cr>

" moving lines
nnoremap <A-j> m+<cr>==
nnoremap <A-k> m-2<cr>==
vnoremap <A-j> m '>+1<cr>gv=gv
vnoremap <A-k> m '<-2<cr>gv=gv
