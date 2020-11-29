" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

set nobackup		" do not keep a backup file, use versions instead

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else
  set autoindent		" always set autoindenting on

endif " has("autocmd")

" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
if has('syntax') && has('eval')
  packadd matchit
endif

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
set number
set relativenumber
set numberwidth=2

" show invisble characters
set list
set listchars=tab:>-,trail:.,precedes:<,extends:>,eol:$

" search options
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase

" colors for non-visible chars
highlight NonText ctermfg=DarkGrey
highlight LineNr  ctermfg=Grey

" Set colorscheme
colorscheme industry

" disable arrow 
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>
