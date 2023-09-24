set nocompatible
filetype off

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'gmarik/vundle'
Plug 'Lokaltog/vim-powerline'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'terryma/vim-multiple-cursors'
Plug 'dracula/vim', {'name': 'dracula'}

" JS Dev
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

call plug#end()
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
