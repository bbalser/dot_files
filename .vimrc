set hidden
set ts=2
set sw=2
set ai
set nu
set expandtab
set nobackup
set noswapfile
autocmd BufWritePre * %s/\s\+$//e
nnoremap <F5> :CtrlPBuffer<CR>
call plug#begin('~/.vim/plugged')

Plug 'elixir-lang/vim-elixir'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'weynhamz/vim-plugin-minibufexpl'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'NLKNguyen/papercolor-theme'


call plug#end()

set background=dark
colorscheme PaperColor
let g:airline_theme='papercolor'
