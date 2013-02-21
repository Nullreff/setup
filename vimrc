set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'jonathanfilip/vim-lucius'
Bundle 'lukerandall/haskellmode-vim'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'paradigm/vim-multicursor'
Bundle 'paradigm/SkyBison'
Bundle 'mattn/gist-vim'
Bundle 'AndrewRadev/linediff.vim'

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
"set relativenumber

colorscheme desert
