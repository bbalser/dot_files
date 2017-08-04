set hidden
set ts=2
set sw=2
set ai
set nu
set expandtab
set nobackup
set noswapfile
colorscheme slate
autocmd BufWritePre * %s/\s\+$//e
call plug#begin('~/.vim/plugged')

Plug 'elixir-lang/vim-elixir'
Plug 'scrooloose/nerdtree'



call plug#end()
