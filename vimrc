set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'Lokaltog/vim-powerline'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'dracula/vim', {'name': 'dracula'}

call vundle#end()
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
