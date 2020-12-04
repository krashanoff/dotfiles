" l
"

" hot reload
:nnoremap <leader>src :source $HOME/.config/nvim/init.vim<C-r><RET>

"""""""""""
" PLUGINS "
"""""""""""
call plug#begin('~/.config/nvim/plugged')
    " colors
    Plug 'cormacrelf/vim-colors-github'

    " virgin nerdtree v. chad chadtree
    Plug 'ms-jpq/chadtree', { 'branch': 'chad', 'do': ':UpdateRemotePlugins' }

    " git
    Plug 'tpope/vim-fugitive', { 'branch': 'v3.2' }

    " completion, language analysis, linting
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'dense-analysis/ale'

    " tags, navigation
    Plug 'liuchengxu/vista.vim'

    " fuzzy find
    Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

    " completely unnecessary
    Plug 'psliwka/vim-smoothie'
    Plug 'justinmk/vim-sneak'
call plug#end()

""""""""
" CORE "
""""""""
let &shortmess = 'filnxtToOFI'
let &showbreak = '\'
set shada = '2000,f1,<500'
set hidden
set nobackup
set nowritebackup
set number

set background=dark
let g:github_colors_soft = 1
let g:github_colors_block_diffmark = 0
colorscheme github

" default width to wrap to.
set textwidth=80

" indent with spaces.
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

""""""""""""
" MOVEMENT "
""""""""""""
:nnoremap GG G$

" moving lines
nnoremap <silent><A-j> :m+<cr>==
nnoremap <silent><A-k> :m-2<cr>==
vnoremap <silent><A-j> :m '>+1<cr>gv=gv
vnoremap <silent><A-k> :m '<-2<cr>gv=gv

" movement from within insert mode
:inoremap <C-h> <silent><ESC>h i
:inoremap <C-j> <silent><ESC>j i
:inoremap <C-k> <silent><ESC>k i
:inoremap <C-l> <silent><ESC>l i

" window switching
:tnoremap <C-h> <C-\><C-n><C-w>h
:tnoremap <C-j> <C-\><C-n><C-w>j
:tnoremap <C-k> <C-\><C-n><C-w>k
:tnoremap <C-l> <C-\><C-n><C-w>l
:inoremap <C-h> <C-\><C-n><C-w>h
:inoremap <C-j> <C-\><C-n><C-w>j
:inoremap <C-k> <C-\><C-n><C-w>k
:inoremap <C-l> <C-\><C-n><C-w>l
:nnoremap <C-h> <C-w>h
:nnoremap <C-j> <C-w>j
:nnoremap <C-k> <C-w>k
:nnoremap <C-l> <C-w>l

" tab creation
:inoremap <leader>t <silent><Esc>:tabnew<C-r><RET>
:nnoremap <C-w>t <silent>:tabnew<C-r><RET>

""""""""""""""
" COMPLETION "
""""""""""""""
let g:deoplete#enable_at_startup = 1

let g:ale_fix_on_save = 1
let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'go': ['gofmt'],
\ }

call deoplete#custom#option({
    \ 'smart_case': v:true,
    \ 'sources': {
    \   '_': ['ale'],
    \ },
\ })

""""""""
" TERM "
""""""""
:autocmd TermOpen * setlocal statusline=%{b:term_title}
:tnoremap <Esc> <C-\><C-n>

"""""""""""""""
" PROJECT NAV "
"""""""""""""""
nnoremap <silent><leader>f <cmd>CHADopen<cr>
nnoremap <leader>v <cmd>Vista<cr>

"""""""
" GUI "
"""""""
let g:neovide_cursor_antialiasing=v:true
let g:neovide_cursor_animation_length=0.13
let g:neovide_cursor_vfx_mode = "railgun"
let g:neovide_cursor_vfx_opacity=200.0
let g:neovide_cursor_vfx_particle_lifetime=1.2
let g:neovide_cursor_vfx_particle_density=7.0
let g:neovide_cursor_vfx_particle_speed=10.0
