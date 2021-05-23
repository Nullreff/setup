set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'terryma/vim-multiple-cursors'
Plugin 'dracula/vim', {'name': 'dracula'}

filetype plugin indent on
syntax enable

set guioptions=

set tabstop=4
set shiftwidth=4
set expandtab
set number
set hidden
set virtualedit=block
set hlsearch
set shell=/bin/sh

set background=dark
if filereadable(expand("~/.vim/bundle/dracula/colors/dracula.vim"))
    colorscheme dracula
endif

" Nerd Tree config
autocmd vimenter * if !argc() | NERDTree | endif
map <C-f> :NERDTreeToggle<CR>

" Tab between buffers
:map <C-tab> :bp<cr>
:map <C-S-tab> :bn<cr>
