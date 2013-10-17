set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'jonathanfilip/vim-lucius'
Bundle 'lukerandall/haskellmode-vim'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'paradigm/SkyBison'
Bundle 'mattn/gist-vim'
Bundle 'AndrewRadev/linediff.vim'
Bundle 'puppetlabs/puppet-syntax-vim'
Bundle 'sukima/xmledit'
Bundle 'tpope/vim-surround'
Bundle 'kchmck/vim-coffee-script'
Bundle 'altercation/vim-colors-solarized'
Bundle 'airblade/vim-gitgutter'
Bundle 'vim-scripts/DirDiff.vim'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'

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

set background=dark
let g:solarized_termtrans=1
if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
    colorscheme solarized
endif

" Nerd Tree config
autocmd vimenter * if !argc() | NERDTree | endif
map <C-f> :NERDTreeToggle<CR>

command FormatTag :normal ^Whr<CR>:s/" /"\r/g<CR>V/><CR>=
au FileType ruby setl sw=2 sts=2 et
au FileType puppet setl sw=2 sts=2 et
au FileType html setl sw=2 sts=2 et
