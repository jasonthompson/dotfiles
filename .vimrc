execute pathogen#infect()
" Vundle initialization stuff.
""""""""""""""""""""""""""""""
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage bundle
Bundle 'gmarik/vundle'
" My bundles here:
Bundle 'vim-ruby/vim-ruby'

" After Vundle init
"""""""""""""""""""
syntax on
filetype plugin indent on

set nocompatible
set guifont=Source_Code_Pro:h11
set antialias
set visualbell

"" Whitespace
"""""""""""""
set nowrap
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab
set autoindent
set backspace=indent,eol,start      "Backspace through anything in insert mode

" Searching
"""""""""""
set hlsearch			"highlight matches
set incsearch			" incremental searching
set ignorecase			" searches are case insensitive
set smartcase			" unless they contain at least one capital letter

" Display
"""""""""
set guioptions-=T   " No toolbar
set guioptions-=r   " No scrollbars

colorscheme desert

set relativenumber
set number

set winwidth=80
" Highlight trailing whitespace
highlight WhitespaceEOL ctermbg=DarkYellow guibg=DarkYellow
match WhitespaceEOL /\s\+$/

" Key Mappings
""""""""""""""
let mapleader = ","


" Removes all trailing whitespace
nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>¬

" Convert current word to uppercase in insert mode

inoremap jk <esc>
inoremap <esc> <Nop>
inoremap <c-u> <esc>bveUi

" As above but in normal mode
nnoremap <leader>u bveU

" Edit .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source %<cr>:w %<cr>

" Hitting enter turns off search highlighting
nnoremap <cr> :nohlsearch<cr>

nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
"" Abbreviations
iabbrev intialize initialize

" Undo File
"""""""""""
set undodir=$HOME/.vim-undo
set undofile
set undolevels=100
set undoreload=100
