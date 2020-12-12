set nocompatible

" Tab key settings
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Show relative line numbers
set number
set relativenumber

set ruler
set wildmenu

" Search settings
set incsearch
set nowrap
set smartcase

" Use undofile instead of backup
set noswapfile
set nobackup
set undofile

" Allow backspace
set backspace=indent,eol,start
set clipboard=unnamed

" show invisble characters
set list
set listchars=tab:>-,trail:.,precedes:<,extends:>,eol:$
highlight SpecialKey ctermfg=8 guifg=DimGrey

" Show marker column
set colorcolumn=120
highlight ColorColumn ctermbg=gray

" automatically load changed files
set autoread

highlight LineNr ctermfg=gray


" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'lambdalisue/fern.vim' | Plug 'lambdalisue/fern-git-status.vim'
    Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-fugitive'
    Plug 'ycm-core/YouCompleteMe',{ 'do': './install.py' }
    Plug 'mattn/emmet-vim'
    Plug 'gruvbox-community/gruvbox'
    Plug 'mbbill/undotree'
call plug#end()

let $FZF_DEFAULT_COMMAND = 'fd . --type f --hidden --exclude .git --exclude=log --exclude=node_modules --exclude=bower_components --exclude=vendo'
let $FZF_DEFAULT_OPTS = "--reverse --preview 'bat --theme=TwoDark --style=numbers --color=always --line-range :120 {}'"

let g:undotree_WindowLayout = 4

nmap ; :
nmap <leader>f  :FZF<CR>
nmap <leader>o  :Fern . -drawer<CR>
nmap <leader>u  :UndotreeShow<CR>:UndotreeFocus<CR>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>
nmap <silent> <leader>j :YcmCompleter GoTo<CR>

" Color settings
set t_Co=256
set background=dark

" Enable syntax highlighting
if &diff
    syntax off
else
    syntax on
endif

