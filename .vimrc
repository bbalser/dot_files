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
nnoremap <F5> :buffers<CR>:buffer<Space>
call plug#begin('~/.vim/plugged')

Plug 'elixir-lang/vim-elixir'
Plug 'bling/vim-airline'
Plug 'fholgado/minibufexpl.vim'
Plug 'ctrlpvim/ctrlp.vim'


call plug#end()
