" Vundle initialization stuff. Must stay at top of vimrc
" "
filetype off
set rtp+=~/vimfiles/bundle/vundle/
call vundle#rc()

" Let Vundle manage bundle
" require for vundle
Bundle 'gmarik/vundle'
Bundle 'git://git.wincent.com/command-t.git'
" My bundles here:
" "
Bundle 'vim-ruby/vim-ruby'

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

execute pathogen#infect()
syntax on
filetype plugin indent on

set nocompatible
set guifont=Source_Code_Pro:h11
set antialias
set visualbell

"" Whitespace
set nowrap
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab
set autoindent
set backspace=indent,eol,start      "Backspace through anything in insert mode

"" Searching
set hlsearch			"highlight matches
set incsearch			" incremental searching
set ignorecase			" searches are case insensitive
set smartcase			" unless they contain at least one capital letter
set guioptions-=T   " No toolbar
set guioptions-=r   " No scrollbars
colorscheme desert 

set relativenumber
set number

" Key Mappings
let mapleader = ","
" Convert current word to uppercase in insert mode
inoremap <c-u> <esc>bveUi 
" As above but in normal mode
nnoremap <c-u> bveU     
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

iabbrev intialize initialize
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
