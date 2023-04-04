" do not require full VI compatability
set nocompatible

" set file encoding
set encoding=utf-8

" allow hidden buffers
set hidden

" tab key settings
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" don't auto-comment next line
set formatoptions-=cro

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

" better backup, swap and undos storage for vim
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo

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

" Install vim-plug if not found
let vim_plug_just_installed = 0
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

call plug#begin('~/.vim/plugged')
    Plug 'https://github.com/chengzeyi/multiterm.vim'
    Plug 'https://github.com/chr4/nginx.vim'
    Plug 'https://github.com/editorconfig/editorconfig-vim'
    Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'https://github.com/junegunn/fzf.vim'
    Plug 'https://github.com/lambdalisue/fern.vim'
    Plug 'https://github.com/majutsushi/tagbar'
    Plug 'https://github.com/mattn/emmet-vim'
    Plug 'https://github.com/mhinz/vim-signify'     " similar to vim-gitgutter
    Plug 'https://github.com/ojroques/vim-oscyank'  " Copy to clipboard from ssh session
    Plug 'https://github.com/rafi/awesome-vim-colorschemes'
    Plug 'https://github.com/tpope/vim-commentary'
    Plug 'https://github.com/tpope/vim-dispatch'
    Plug 'https://github.com/tpope/vim-fugitive'
    Plug 'https://github.com/tpope/vim-unimpaired'
    Plug 'https://github.com/tpope/vim-surround'
    Plug 'https://github.com/vim-airline/vim-airline'
    " plugins we only need on local machine
    if empty($SSH_CLIENT)
        Plug 'https://github.com/christoomey/vim-tmux-navigator'
        Plug 'https://github.com/diepm/vim-rest-console'
        Plug 'https://github.com/lambdalisue/nerdfont.vim'
        Plug 'https://github.com/lambdalisue/fern-renderer-nerdfont.vim'
        Plug 'https://github.com/leafOfTree/vim-vue-plugin'
        Plug 'https://github.com/psliwka/vim-smoothie'
        Plug 'https://github.com/tpope/vim-dadbod'
        Plug 'https://github.com/vimwiki/vimwiki'
        Plug 'https://github.com/ycm-core/YouCompleteMe'
        " Plug 'https://github.com/Exafunction/codeium.vim'
    endif
call plug#end()

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

" fuzzy finder options
let $FZF_DEFAULT_COMMAND = 'fd . --type=f --hidden --exclude=.git --exclude=log --exclude=node_modules --exclude=bower_components --exclude=vendor'
let $FZF_DEFAULT_OPTS = "--reverse --preview 'bat --theme=Nord --style=numbers --color=always --line-range :120 {}'"

" osc52 yank
let g:oscyank_term = 'default'

" config for new plugins
if empty($SSH_CLIENT)
    let g:fern#renderer = "nerdfont"
    " YouCompleteMe config
    let g:ycm_autoclose_preview_window_after_completion = 1
    let g:ycm_autoclose_preview_window_after_insertion = 1
    let g:ycm_auto_hover=''
    let g:ycm_auto_trigger = 0
    let g:ycm_complete_in_strings = 0

    " smooth scroll
    let g:smoothie_speed_constant_factor = 100
    let g:smoothie_speed_linear_factor = 30

    " vim-rest-console settings
    let g:vrc_output_buffer_name = '_localhost_out.json'
    let g:vrc_syntax_highlight_response = 1
    let g:vrc_auto_format_response_enabled = 1
    let b:vrc_response_default_content_type = 'application/json'
    let g:vrc_curl_opts = {
                \   '--silent': ''
                \}
    let g:vrc_auto_format_response_patterns = {
                \   'json': 'python3 -mjson.tool --indent=2',
                \}
    if !exists('g:multiterm_opts')
        let g:multiterm_opts = {}
    endif
    let g:multiterm_opts.height = '&lines - 2'
    let g:multiterm_opts.width = '&columns - 2'

endif

" vim-signify async update
set updatetime=500

" diffsplit vertical
set diffopt+=vertical

" Color settings
" set t_Co=256
set background=dark
silent! colorscheme tender

" Enable syntax highlighting
if &diff
    syntax off
else
    syntax on
endif

" vimwiki url folding
let g:vimwiki_url_maxsave=0
let g:indentLine_concealcursor=""
let g:indentLine_conceallevel=2

" Accept common typos
command! Q q
command! Qa qa
command! W w
command! Wq wq

if !exists("colors_name") || colors_name == 'default'
    " some colors
    hi LineNr       ctermfg=darkgray    ctermbg=black
    hi SpecialKey   ctermfg=darkgray
    hi ColorColumn  ctermbg=black

    " diff colors
    hi DiffAdd      term=bold       ctermfg=235     ctermbg=114
    hi DiffDelete   term=bold       ctermfg=9       ctermbg=224
    hi DiffText     term=reverse    ctermfg=235     ctermbg=180

    " search result
    hi Search       ctermbg=239     ctermfg=white

    " visual mode
    hi Visual       ctermbg=239     ctermfg=245

endif

" jump to the last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" toggle quick fix window
function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        Copen
    else
        cclose
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

" reload vimrc
nmap <leader>r      :source ~/.vimrc<CR>

" set relative number
nmap <leader>;      :set invrelativenumber relativenumber?<CR>

" window resize
nmap <leader>=      :resize +5<CR>
nmap <leader>-      :resize -5<CR>

" toggle highlight search
nmap <leader>h      :set hls!<CR>

" toggle spellcheck
nmap <leader>s      :setlocal invspell spell?<CR>

" toggle paste
nmap <leader>p      :set invpaste paste?<CR>

" project search shortcuts
nmap <C-p>          :FZF<CR>
nmap <C-b>          :Buffers<CR>
nmap <C-s>          :Rg<CR>

" Plugin shortcuts
nmap <leader>\      :TagbarToggle<CR>
nmap <leader>q      :call ToggleQuickFix()<CR>
nmap <leader>e      :Fern . -drawer -toggle -reveal=%<CR>

" Git shortcuts
nmap <silent>gf     :GitFiles?<CR>
nmap <silent>gs     :Git<CR>:resize 10<CR>
nmap <silent>gb     :Git blame<CR><C-w><C-w>
nmap <silent>gd     :Gdiffsplit<CR><C-w><C-w>
nmap <silent>gh     :Commits!<CR>
nmap <silent>gh     :0GcLog<CR>

" Lint commands
nmap <silent>lp     :compiler pylint<CR>:Make! %<CR>
nmap <silent>lP     :compiler pylint<CR>:Make! $(git diff --name-only -- "*.py")<CR>
nmap <silent>lu     :set makeprg=ruff<CR>:Make! %<CR>
nmap <silent>lU     :set makeprg=ruff<CR>:Make! $(git ls-files "*.py")<CR>
nmap <silent>lj     :compiler eslint<CR>:Make! %<CR>
nmap <silent>lJ     :compiler eslint<CR>:Make! $(git diff --name-only -- "*.vue" "*.js")<CR>
nmap <silent>ls     :compiler shellcheck<CR>:Make! %<CR>

" Window navigation
nmap <C-j> <C-w><C-j>
nmap <C-k> <C-w><C-k>
nmap <C-l> <C-w><C-l>
nmap <C-h> <C-w><C-h>

" ctrl-c yank to clipboard
xmap <C-c>          :OSCYank<CR>

" ctrl-j format json on visual mode
xmap <leader>j      :!python3 -mjson.tool --indent=2<CR>

" keyboard shortcuts based on installed plugins
if empty($SSH_CLIENT)
    " ctrl-t/t to toggle terminal
    nmap <C-t>t     :9Multiterm<CR>
    imap <C-t>t     <Plug>(Multiterm)
    nmap <C-t>      :9Multiterm<CR>

    " ctrl-t/1 for htop
    nmap <C-t>1     :1Multiterm htop<CR>

    " ctrl-t/2 for python
    nmap <C-t>2     :2Multiterm python3<CR>

    " ctrl-t/3 for NodeJS
    nmap <C-t>3     :3Multiterm node<CR>

    " ycm goto definition
    nmap <leader>d  :YcmCompleter GoToDefinition<CR>

    " hide terminal
    tmap <C-t>      <Plug>(Multiterm)

    " ctrl-x to switch filetype if in vimwiki
    nmap <C-x>      :call HandleSuperKey()<CR>

else
    " ctrl-t to run terminal
    nmap <C-t>      :terminal<CR>

endif
