set nocompatible

" allow hidden buffers
set hidden

" Tab key settings
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Show relative line numbers
set number relativenumber

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

" split window to bottom
set splitbelow

" Allow backspace
set backspace=indent,eol,start

" show invisble characters
set list
set listchars=tab:>-,trail:.,precedes:<,extends:> ",eol:$

" Show marker column
set colorcolumn=120

" Set scroll offset
set scrolloff=2

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')
    Plug 'editorconfig/editorconfig-vim'
    Plug 'joshdick/onedark.vim'
    Plug 'junegunn/fzf' | Plug 'junegunn/fzf.vim'
    Plug 'lambdalisue/fern.vim' " | Plug 'lambdalisue/fern-git-status.vim'
    Plug 'leafOfTree/vim-vue-plugin'
    Plug 'majutsushi/tagbar'
    Plug 'mattn/emmet-vim'
    Plug 'mbbill/undotree'
    Plug 'ojroques/vim-oscyank'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-commentary'
    Plug 'vim-airline/vim-airline'
    Plug 'vimwiki/vimwiki'
call plug#end()

let $FZF_DEFAULT_COMMAND = 'fd . --type f --hidden --exclude .git --exclude=log --exclude=node_modules --exclude=bower_components --exclude=vendor'
let $FZF_DEFAULT_OPTS = "--reverse --preview 'bat --theme=TwoDark --style=numbers --color=always --line-range :120 {}'"
let g:undotree_WindowLayout = 4
let g:oscyank_term = 'tmux'

" Shortcuts
nmap <leader>\      :FZF<cr>
nmap <leader>]      :Buffers<cr>
nmap <leader>[      :Rg<cr>
nmap <leader>q      :Fern . -drawer -toggle -reveal=%<cr>
" nmap <leader>w      :TagbarToggle<cr>
nmap <leader>e      :UndotreeToggle<cr>
nmap <leader>r      :source ~/.vimrc<cr>
nmap <leader>t      :TagbarToggle<cr>
nmap <leader>;      :execute "set cc=" . (&cc == "" ? "120" : "")<cr>
nmap <leader>=      :resize +5<cr>
nmap <leader>-      :resize -5<cr>

" Git shortcuts
nmap <silent> gf    :GFiles?<cr>
nmap <silent> gs    :Git<cr>
nmap <silent> gb    :Git blame<cr>
nmap <silent> gd    :Gdiffsplit<cr>
nmap <silent> gh    :diffget //3<cr>
nmap <silent> gu    :diffget //2<cr>

" Ctrl shortcuts

" yank to os clipboard
vnoremap <C-c> :OSCYank<CR>

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
command! Wq wq

hi DiffAdd      ctermfg=Green         ctermbg=DarkGray
hi DiffChange   ctermfg=Blue          ctermbg=DarkGray
hi DiffDelete   ctermfg=Red           ctermbg=LightRed
hi DiffText     ctermfg=Yellow        ctermbg=DarkGray

" jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  " autocmd FileType nginx setlocal commentstring=#\ %s
  " autocmd FileType vue setlocal commentstring=//\ %s
endif

" Detect vue subtype
function! OnChangeVueSubtype(subtype)
  if a:subtype == 'html'
    setlocal commentstring=<!--\ %s\ -->
    setlocal comments=s:<!--,m:\ \ \ \ ,e:-->
  elseif a:subtype =~ 'css'
    setlocal comments=s1:/*,mb:*,ex:*/ commentstring&
  else
    setlocal commentstring=//\ %s
    setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
  endif
endfunction

