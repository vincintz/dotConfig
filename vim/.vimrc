set nocompatible
set encoding=utf-8
set hidden              " allow hidden buffers

" tab key settings
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" line number
set number
set relativenumber
set nowrap

" menu behaviour
set wildmenu

" search settings
set incsearch
set ignorecase
set smartcase
set shortmess-=S
set hlsearch

" use undofile instead of backup
set noswapfile
set nobackup
set undofile
set undodir=~/.vim/undo/

" use system clipboard
" set clipboard=unnamedplus

" spit window to bottom
set splitbelow splitright

" allow backspace
set backspace=indent,eol,start

" show invisble characters
set list
set listchars=tab:>-,trail:.,precedes:<,extends:> ",eol:$

" show marker column
set colorcolumn=120

" show cursor position
set ruler

" set scroll offset
set scrolloff=2

" misc settings
set diffopt+=vertical               " diffsplit vertical
set wildignore+=**/.git/**,**/node_modules/**   " exclude these dirs

" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

" Accept common typos
command! Q q
command! Qa qa
command! W w
command! Wq wq

" ----------------------------------------------------------
" Plugins
" ----------------------------------------------------------

" Install vim-plug if not found
let vim_plug_just_installed = 0
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

call plug#begin('~/.vim/plugged')
    Plug 'https://github.com/chr4/nginx.vim'
    Plug 'https://github.com/editorconfig/editorconfig-vim'
    Plug 'https://github.com/mattn/emmet-vim'
    Plug 'https://github.com/mhinz/vim-signify'     " similar to vim-gitgutter
    Plug 'https://github.com/ojroques/vim-oscyank'  " Copy to clipboard from ssh session
    Plug 'https://github.com/rafi/awesome-vim-colorschemes'
    Plug 'https://github.com/tpope/vim-commentary'
    Plug 'https://github.com/tpope/vim-fugitive'
    Plug 'https://github.com/tpope/vim-unimpaired'
    Plug 'https://github.com/tpope/vim-surround'
    Plug 'https://github.com/vim-airline/vim-airline'
    Plug 'https://github.com/christianrondeau/vim-base64'

    " plugins for vim 9.0+
    Plug 'https://github.com/psliwka/vim-smoothie'
    Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'https://github.com/junegunn/fzf.vim'
    Plug 'https://github.com/preservim/tagbar'
    Plug 'https://github.com/lambdalisue/fern.vim'
    Plug 'https://github.com/lambdalisue/fern-renderer-nerdfont.vim'
    Plug 'https://github.com/tpope/vim-dispatch'
    Plug 'https://github.com/dense-analysis/ale'

    " plugins we only need on local machine
    Plug 'https://github.com/christoomey/vim-tmux-navigator'
    Plug 'https://github.com/diepm/vim-rest-console'
    Plug 'https://github.com/lambdalisue/nerdfont.vim'
    Plug 'https://github.com/mechatroner/rainbow_csv'
    Plug 'https://github.com/tpope/vim-dadbod'
    Plug 'https://github.com/kristijanhusak/vim-dadbod-completion'
    Plug 'https://github.com/kristijanhusak/vim-dadbod-ui'
    Plug 'https://github.com/vimwiki/vimwiki'
    Plug 'https://github.com/voldikss/vim-floaterm'

call plug#end()

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

" editor config
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" osc52 yank
let g:oscyank_term = 'default'

" fuzzy finder options
let $FZF_DEFAULT_OPTS = "--reverse --preview 'bat --theme=Nord --color=always --line-range :120 {}'"
nmap <silent>ff     :FZF<CR>
nmap <silent>fg     :FZF<CR>
nmap <silent>fb     :Buffers<CR>
nmap <silent>fs     :Rg<CR>

" vimwiki url folding
let g:vimwiki_url_maxsave=0
let g:indentLine_concealcursor=""
let g:indentLine_conceallevel=2

" fern.vim drawer settings
let g:fern#renderer = "nerdfont"
augroup FernGroup
  autocmd!
  autocmd FileType fern setlocal norelativenumber | setlocal nonumber
augroup END

" ale settings
let g:ale_fixers = {
    \ 'python': ['black', 'isort'],
    \ }
let g:ale_fix_on_save = 0

" smooth scroll
let g:smoothie_speed_constant_factor = 100
let g:smoothie_speed_linear_factor = 30

" extra config
" vim-rest-console settings
let g:vrc_output_buffer_name = '_localhost_out.json'
let g:vrc_syntax_highlight_response = 1
let g:vrc_auto_format_response_enabled = 1
let g:vrc_response_default_content_type = 'application/json'
let g:vrc_curl_opts = {
    \   '--silent': ''
    \}
let g:vrc_auto_format_response_patterns = {
    \   'json': 'jq',
    \}
" vim-signify async update
set updatetime=500

" TODO: generalize
set wildignore+=client/dist/**
set wildignore+=client/dist-staging/**
set wildignore+=*.xz,*.txz,*.tbz

" ----------------------------------------------------------
" Keyboard remaps
" ----------------------------------------------------------
" toggle quick fix window
function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction

" toggle quick fix window
function! ToggleDispatchQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        Copen
    else
        cclose
    endif
endfunction

" toggle git status
function! ToggleGitStatus()
    echo &l:filetype
    if &l:filetype == 'fugitive'
        close
    else
        Git
        resize 10
    endif
endfunction

" toggle git blame
function! ToggleGitBlame()
    if &l:filetype == 'fugitiveblame'
        close
    else
        G blame
    endif
endfunction


" Hanlder for overloaded super-key (c-x)
function! HandleSuperKey()
    if &filetype == 'rest'
        set filetype=rest
        call VrcQuery()
    elseif &filetype == 'vimwiki' && match(expand('%'), ".rest") != -1
        set filetype=rest
        call VrcQuery()
    elseif &filetype == 'vimwiki' && match(expand('%'), ".sql") != -1
        set filetype=sql
    endif
endfunction

" change leader key to space
let mapleader = " "

nmap <leader>r      :source ~/.vimrc<CR>
nmap <leader>;      :set invrelativenumber relativenumber?<CR>
nmap <leader>=      :resize +5<CR>
nmap <leader>-      :resize -5<CR>
nmap <leader>/      :set hls!<CR>
nmap <leader>s      :setlocal invspell spell?<CR>
nmap <leader>p      :set invpaste paste?<CR>

" tab shortcuts
nmap <silent>tt     :tabnew<CR>
nmap <silent>tq     :tabclose<CR>
nmap <silent>tn     :tabnext<CR>
nmap <silent>tp     :tabprevious<CR>

" buffer shortcuts
nmap <silent>K      :bprevious<CR>
nmap <silent>J      :bnext<CR>
nmap <silent>X      :bdelete<CR>

" re-center screen on big jumps
nmap <C-d>      <C-d>zz
nmap <C-u>      <C-u>zz
nmap <silent>n  nzz
nmap <silent>N  Nzz

" Plugin shortcuts
nmap <leader>\      :TagbarToggle<CR>
nmap <leader>c      :call ToggleQuickFix()<CR>
nmap <leader>C      :call ToggleDispatchQuickFix()<CR>
nmap <leader>e      :Fern . -drawer -toggle -reveal=%<CR>
nmap <leader>d      :tabnew<CR>:DBUI<CR>

" Git shortcuts
nmap <leader>g      :call ToggleGitStatus()<CR>
nmap <silent>gb     :call ToggleGitBlame()<CR>

" Lint commands
nmap <silent>Lp     :compiler pylint<CR>:make %<CR>
nmap <silent>Lu     :set makeprg=ruff<CR>:Make! %<CR>
nmap <silent>LU     :set makeprg=ruff<CR>:Make! $(git ls-files "*.py")<CR>
nmap <silent>Lj     :compiler eslint<CR>:Make! %<CR>
nmap <silent>LJ     :compiler eslint<CR>:Make! $(git diff --name-only -- "*.vue" "*.js")<CR>
nmap <silent>Ls     :compiler shellcheck<CR>:Make! %<CR>

" ctrl-c yank to clipboard
xmap <C-c>          :OSCYankVisual<CR>

" ctrl-j format json on visual mode
xmap <leader>j      :!python3 -mjson.tool --indent=2<CR>

" floaterm shortcuts
nmap <leader>t      :FloatermNew --autoclose=2 --width=0.8 --height=0.8<CR>
nmap <C-t>          :FloatermToggle<CR>
tmap <C-t>          <C-\><C-n>:FloatermToggle<CR>
tmap <C-x>          <C-\><C-n>:FloatermKill<CR>
tmap <C-w>          <C-\><C-n>:FloatermNext<CR>

" ctrl-x to switch filetype if in vimwiki
nmap <C-x>          :call HandleSuperKey()<CR>

" ----------------------------------------------------------
" Standard actions based on filetype
" ----------------------------------------------------------
autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni
autocmd FileType python setlocal ts=4 sts=4 sw=4
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType * set formatoptions-=cro  " don't auto-comment next line
" jump to the last position when reopening a file
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
" automatically open the quickfix window
augroup myvimrc
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    lwindow
augroup END

" ----------------------------------------------------------
" Theme
" ----------------------------------------------------------
set background=dark
silent! colorscheme tender

if exists("colors_name") || colors_name == 'default'
    hi Normal guibg=NONE ctermbg=NONE
endif
