" l
"

call plug#begin('~/.config/nvim/plugged')

" virgin nerdtree v. chad chadtree
Plug 'ms-jpq/chadtree', { 'branch': 'chad', 'do': ':UpdateRemotePlugins' }

" search
Plug 'https://github.com/kien/ctrlp.vim', { 'branch': '1.79' }

" completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" languages
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

" core settings
set number
set tabstop=4
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" coc
set updatetime=1000
set shortmess+=c
inoremap <silent><expr> <c-space> coc#refresh()

" IDE-style bindings
nnoremap <silent><leader>t <cmd>CHADopen<cr>
nnoremap <leader>f <cmd>CtrlP<cr>

" moving lines
nnoremap <silent><A-j> :m+<cr>==
nnoremap <silent><A-k> :m-2<cr>==
vnoremap <silent><A-j> :m '>+1<cr>gv=gv
vnoremap <silent><A-k> :m '<-2<cr>gv=gv
