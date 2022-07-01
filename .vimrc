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

" line number
set number relativenumber
set nowrap

" menu behaviour
set wildmenu

" search settings
set incsearch
set ignorecase
set smartcase
set shortmess-=S

" use undofile instead of backup
set noswapfile
set nobackup
set undofile
set undodir=~/.vim/undo/

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

" split window to bottom
set splitbelow

" allow backspace
set backspace=indent,eol,start

" show invisble characters
set list
set listchars=tab:>-,trail:.,precedes:<,extends:> ",eol:$

" show marker column
let &colorcolumn=join(range(121,999),",")

" show cursor position
set ruler

" set scroll offset
set scrolloff=2

" Install vim-plug if not found
let vim_plug_just_installed = 0
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

call plug#begin('~/.vim/plugged')
    Plug 'https://github.com/chr4/nginx.vim'
    Plug 'https://github.com/editorconfig/editorconfig-vim'
    Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'https://github.com/junegunn/fzf.vim'
    Plug 'https://github.com/lambdalisue/fern.vim'
    Plug 'https://github.com/leafOfTree/vim-vue-plugin'
    Plug 'https://github.com/majutsushi/tagbar'
    Plug 'https://github.com/mattn/emmet-vim'
    Plug 'https://github.com/mhinz/vim-signify'  " similar to vim-gitgutter
    Plug 'https://github.com/thaerkh/vim-workspace'
    Plug 'https://github.com/tpope/vim-commentary'
    Plug 'https://github.com/tpope/vim-fugitive'
    Plug 'https://github.com/tpope/vim-unimpaired'
    Plug 'https://github.com/tpope/vim-surround'
    Plug 'https://github.com/vimwiki/vimwiki'
    " colors and themes
    Plug 'https://github.com/rafi/awesome-vim-colorschemes'
    Plug 'https://github.com/vim-airline/vim-airline'
    Plug 'https://github.com/vim-airline/vim-airline-themes'
    " install new plugins
    if version >= 802
        Plug 'https://github.com/chengzeyi/multiterm.vim'
        Plug 'https://github.com/diepm/vim-rest-console'
        Plug 'https://github.com/psliwka/vim-smoothie'
        Plug 'https://github.com/tpope/vim-dadbod'
        Plug 'https://github.com/tpope/vim-dispatch'
        Plug 'https://github.com/ycm-core/YouCompleteMe'
    endif
call plug#end()

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

" fuzzy finder options
let $FZF_DEFAULT_COMMAND = 'fd . --type f --hidden --exclude .git --exclude=log --exclude=node_modules --exclude=bower_components --exclude=vendor'
let $FZF_DEFAULT_OPTS = "--reverse --preview 'bat --theme=TwoDark --style=header,numbers --color=always --line-range :120 {}'"

" config for new plugins
if version >= 802
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
    let g:vrc_trigger = '<C-k>'
    let g:vrc_syntax_highlight_response = 1
    let g:vrc_auto_format_response_enabled = 1
    let b:vrc_response_default_content_type = 'application/json'
    let g:vrc_curl_opts = {
                \   '--silent': ''
                \}
    let g:vrc_auto_format_response_patterns = {
                \   'json': 'python3 -mjson.tool --indent=2',
                \}

endif

" vim-signify async update
set updatetime=500

" diffsplit vertical
set diffopt+=vertical

" Color settings
" set t_Co=256
set background=dark
colorscheme apprentice
let g:airline_theme='lucius'

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

" workspace
let g:workspace_autocreate = 1
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_persist_undo_history = 0

" Colors
hi LineNr       ctermfg=darkgray    ctermbg=black
hi SpecialKey   ctermfg=darkgray
hi ColorColumn  ctermbg=black

command! Q q
command! Qa qa
command! Wq wq

" diff colors
hi DiffAdd      term=bold       ctermfg=235     ctermbg=114
hi DiffDelete   term=bold       ctermfg=9       ctermbg=224
hi DiffChange   term=bold       cterm=underline ctermfg=180
hi DiffText     term=reverse    ctermfg=235     ctermbg=180

" jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        Copen
    else
        cclose
    endif
endfunction

" project search shortcuts
nmap <C-p>          :FZF!<CR>
nmap <C-s>          :Rg!<CR>

" more shortcuts
nmap <leader>\      :TagbarToggle<CR>
nmap <leader>]      :Buffers!<CR>
nmap <leader>p      :set invpaste paste?<CR>
nmap <leader>q      :call ToggleQuickFix()<CR>
nmap <leader>e      :Fern . -drawer -toggle -reveal=%<CR>
nmap <leader>r      :source ~/.vimrc<CR>
nmap <leader>d      :YcmCompleter GoToDefinition<CR>

" hide the line width warning line
nmap <leader>;      :execute "set cc=" . (&cc == "" ? "120" : "")<CR>

" window resize
nmap <leader>=      :resize +5<CR>
nmap <leader>-      :resize -5<CR>

" Git shortcuts
nmap <silent>gf     :GitFiles!?<CR>
nmap <silent>gs     :Git<CR>:resize 10<CR>
nmap <silent>gl     :Gclog<CR>
nmap <silent>gb     :Git blame<CR>
nmap <silent>gd     :Gdiffsplit<CR>

" Lint commands
nmap <silent>lp     :compiler pylint<CR>:Make! %<CR>
nmap <silent>lP     :compiler pylint<CR>:Make! $(git diff --name-only -- "*.py")<CR>
nmap <silent>lj     :compiler eslint<CR>:Make! %<CR>
nmap <silent>lJ     :compiler eslint<CR>:Make! $(git diff --name-only -- "*.vue" "*.js")<CR>

" ctrl-j format json
xmap <C-j>      :!python3 -mjson.tool --indent=2<CR>

" ctrl-c yank to os clipboard
xmap <C-c>      :OSCYank<CR>
let g:clipboard = {
    \   'name': 'osc52',
    \   'copy': {
    \     '+': {lines, regtype -> OSCYankString(join(lines, "\n"))},
    \     '*': {lines, regtype -> OSCYankString(join(lines, "\n"))},
    \   },
    \   'paste': {
    \     '+': {-> [split(getreg(''), '\n'), getregtype('')]},
    \     '*': {-> [split(getreg(''), '\n'), getregtype('')]},
    \   },
    \ }
set clipboard=unnamed

" keyboard shortcuts based on installed plugins
if version >= 802
    " ctrl-t to toggle terminal
    nmap <C-t>      :1Multiterm<CR>
    tmap <C-t>      <Plug>(Multiterm)

    " ctrl-j for NodeJS
    nmap <C-j>      :2Multiterm node<CR>
    tmap <C-j>      <Plug>(Multiterm)

    " ctrl-n for python3
    nmap <C-n>      :3Multiterm python3<CR>
    tmap <C-n>      <Plug>(Multiterm)

else
    " ctrl-t to run terminal
    nmap <C-t>      :terminal<CR>
    xmap <C-t>      :terminal<CR>

endif
