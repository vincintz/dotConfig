set nocompatible              " be iMproved, required
filetype off                  " required

filetype plugin indent on    " required

" enable syntax
syntax enable
" set background=dark
" colorscheme solarized

" modelines off to prevent modelines exploints
set modelines=0

" ui settings
set ruler            " show cursor position
set showcmd          " show command in bottom bar
set cursorline
set wildmenu
set lazyredraw

" replace tabs with four spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" show line numbers
set relativenumber
set number
set numberwidth=2

" show invisble characters
set list
set listchars=tab:▸\ ,eol:¬

" search options
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase

" colors for non-visible chars
highlight NonText ctermfg=DarkGrey
highlight LineNr  ctermfg=DarkGrey

" disable arrow 
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>
