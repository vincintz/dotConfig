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
set ignorecase
set smartcase

" Use undofile instead of backup
set noswapfile
set nobackup
set undofile

" Allow backspace
set backspace=indent,eol,start

" show invisble characters
set list
set listchars=tab:>-,trail:.,precedes:<,extends:> ",eol:$

" Show marker column
set colorcolumn=120

" automatically load changed files
set autoread

" leader key options
set showcmd
set timeoutlen=3000
map <space> \

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')
    Plug 'junegunn/fzf' | Plug 'junegunn/fzf.vim'
    Plug 'lambdalisue/fern.vim' | Plug 'lambdalisue/fern-git-status.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'mattn/emmet-vim'
    Plug 'mbbill/undotree'
    Plug 'tpope/vim-commentary'
    Plug 'szw/vim-maximizer'
    Plug 'majutsushi/tagbar'
    Plug 'joshdick/onedark.vim'
    Plug 'mattn/emmet-vim'
call plug#end()

let $FZF_DEFAULT_COMMAND = 'fd . --type f --hidden --exclude .git --exclude=log --exclude=node_modules --exclude=bower_components --exclude=vendor'
let $FZF_DEFAULT_OPTS = "--reverse --preview 'bat --theme=TwoDark --style=numbers --color=always --line-range :120 {}'"
let g:undotree_WindowLayout = 4

" Buffer navigation map
map bn :bn<cr>
map bp :bp<cr>
map bb :Buffers<CR>

" Git shortcuts
map gs :Git<CR>
nmap <leader>gs :G<CR>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gd :Gdiffsplit<CR>
nmap <leader>gb :Gblame<CR>

" Other shortcuts
nmap <leader>p  :FZF<CR>
nmap <leader>f  :Rg<CR>
nmap <leader>o  :Fern . -drawer<CR>
nmap <leader>u  :UndotreeShow<CR>:UndotreeFocus<CR>
nmap <F8> :TagbarToggle<CR>

" Color settings
" set t_Co=256
set background=dark
colorscheme onedark

" Enable syntax highlighting
if &diff
    syntax off
else
    syntax on
endif

" Colors
hi LineNr ctermfg=darkgray
hi SpecialKey ctermfg=darkgray guifg=DimGrey
hi ColorColumn ctermbg=darkgray

command! Q q
command! Qa qa

hi DiffAdd      ctermfg=Green         ctermbg=DarkGray
hi DiffChange   ctermfg=Blue          ctermbg=DarkGray
hi DiffDelete   ctermfg=Red           ctermbg=LightRed
hi DiffText     ctermfg=Yellow        ctermbg=DarkGray

" jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
