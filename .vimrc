let mapleader = "\<space>"
set encoding=utf-8
set so=999
set foldmethod=indent
"Disable compatibility with vi which can cause unexpected issues
set nocompatible
" Enable mouse
set mouse=a
" Turn syntax highlight on
syntax enable
" Enable type file detection. Vim will be able to try to detect the type of
" file in use
filetype on
" Enable plugins and load plugin for the detected file type
filetype plugin on
" Load an indent file for the detected file type
filetype indent on
" Add numbers to each line on the left-hand side.
set number

set directory=$HOME/.vim/swap//

" Hightlight cursor line underneath the cursor horizontally
set cursorline
" Hightlight cursor line underneath the cursor vertically
set cursorcolumn
" Set shift width to 4 spaces
set shiftwidth=4
" Set tab width to 4 columns
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Don't save backup files.
set nobackup

" Do not wrap lines. Allow long lines to extend as fa as the line goes
set nowrap

" While searching though a file incrementlly highlight matching characters as
" you type
set incsearch

" Ignore capital letters during search
set ignorecase

" Show partial command you type in the last line of the screnn
set showcmd

" Override the ignorecase option if searching for capital letter.
" This will allow you to search specifically for capital letters.
set smartcase

" Show the mode you are on the last line
set showmode

" Show matching words during a search
set showmatch

" Use hightlighting when doing a search
set hlsearch
" Set the commands to save in history default number is 20.
set history=1000

set backspace=2


" Enable auto completion menu after pressing TAB.
set wildmenu
" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" Files ignored to edit with Vim.
set wildignore=*.docx,*.jpg,*.jpeg,*.gif,*.png,*.pdf,*.flv,*.xlsx,*.exe

" PLUGINS ---------------------------------------------------------------- {{{{{{

call plug#begin()
    Plug 'rust-lang/rust.vim'
    Plug 'xuyuanp/nerdtree-git-plugin'
    Plug 'jistr/vim-nerdtree-tabs'
    Plug 'scrooloose/syntastic'
    Plug 'junegunn/fzf'
    Plug 'valloric/youcompleteme'
    Plug 'tpope/vim-commentary'
    Plug 'scrooloose/nerdcommenter'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'scrooloose/nerdtree'
    Plug 'timonv/vim-cargo'
    Plug 'arzg/vim-rust-syntax-ext'
    Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

" }}}}}}

" MAPPINGS --------------------------------------------------------------- {{{
nnoremap <leader>\ :nohlsearch<CR>
inoremap jj <esc>
" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" 如果没安装过vim-plug，则下载安装
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
     \https://raw.GitHub.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" }}}

" color settings
" colorscheme catppuccin-macchiato " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
colorscheme retrobox
" YCM configuration
let g:ycm_enable_inlay_hints = 1
let g:ycm_enable_semantic_highlighting = 1
let g:ycm_auto_trigger = 1
let g:ycm_auto_hover = 1
 

nnoremap <leader>] :YcmCompleter GoTo<CR>
" 使用<Ctrl>+hjkl快速在窗口间跳转
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>
noremap <leader>w :w<cr>
" 禁止箭头键功能，使自己习惯hjkl风格
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
inoremap ' ''<esc>i
inoremap " ""<esc>i
inoremap { {}<esc>i
inoremap [ []<esc>i
inoremap ( ()<esc>i
noremap <c-s-k> dd
noremap <leader>n :NERDTreeToggle<cr>
