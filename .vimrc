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
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-classpath'
Bundle 'wting/rust.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-commentary'
Bundle 'pangloss/vim-javascript'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'tpope/vim-surround'
Bundle 'mattn/emmet-vim'
Bundle 'vim-scripts/ck.vim'
Bundle 'sbl/scvim'
Bundle 'bling/vim-airline'
Bundle 'thoughtbot/vim-rspec'

" After Vundle init
"""""""""""""""""""
syntax on
filetype plugin indent on

set laststatus=2 " Always use airline status
set mouse=c
set nocompatible
set guifont=Source_Code_Pro:h10
set antialias
set visualbell

let vimclojure#WantNailgun = 1
" Automatically save before changing buffers, etc.
set autowriteall
"" Whitespace
"""""""""""""
set nowrap
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab
set autoindent
set backspace=indent,eol,start      "Backspace through anything in insert mode

set backupdir=/tmp

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
inoremap jt <esc>
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

" Chuck key bindings
""""""""""""""""""""
nnoremap <leader>c :w<cr>:Shell chuck % <cr>

" Execute shell cmd in new buffer
"""""""""""""""""""""""""""""""""
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  let isfirst = 1
  let words = []
  for word in split(a:cmdline)
    if isfirst
      let isfirst = 0  " don't change first word (shell command)
    else
      if word[0] =~ '\v[%#<]'
        let word = expand(word)
      endif
      let word = shellescape(word, 1)
    endif
    call add(words, word)
  endfor
  let expanded_cmdline = join(words)
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:  ' . a:cmdline)
  call setline(2, 'Expanded to:  ' . expanded_cmdline)
  call append(line('$'), substitute(getline(2), '.', '=', 'g'))
  silent execute '$read !'. expanded_cmdline
  1
endfunction

""" SuperCollider
"""""""""""""""""
let g:sclangTerm = "gnome-terminal -x $SHELL -ic"
