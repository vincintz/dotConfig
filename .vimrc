set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Fuzzy find
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

" snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" SilverSurfer-ap
Plugin 'rking/ag.vim'

" Hardmode on
" Plugin 'wikitopian/hardmode'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

colorscheme koehler

syntax enable        " syntax processing
set modelines=0      " modelines off
set tabstop=4        " space per visual TAB
set softtabstop=4    " replace TAB with 4 spaces
set expandtab        " turn TAB into SPACES
set ruler            " show cursor position
set number           " line numbers
set relativenumber
set showcmd          " show command in bottom bar
set cursorline
set wildmenu
set lazyredraw
set showmatch
set incsearch
set hlsearch

" disable arrow 
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
