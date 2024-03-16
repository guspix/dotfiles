" Basic settings to improve the default Vim experience 
set nocompatible              " Be iMproved
set number                    " Show line numbers
set relativenumber            " Show relative line numbers
set showcmd                   " Display incomplete commands
set cursorline                " Highlight current line
set mouse=a                   " Enable mouse support
set clipboard=unnamedplus     " Use system clipboard
set encoding=utf-8            " Use UTF-8 encoding
filetype plugin indent on     " Enable filetype detection and indentation
 
" Use spaces instead of tabs  
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
 
" Searching
set ignorecase                " Case insensitive searching
set smartcase                 " Case sensitive when uppercase is used

" Indents
set autoindent            " Maintain indent of current line
set smarttab              " Smart tabbing behavior

 
" Leader key
let mapleader=" "
let g:mapleader=" "

" Key mappings
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

" List buffers and prompt for buffer number with <leader>, and <leader>fb
nnoremap <leader>, :ls<CR>:b<Space>
nnoremap <leader>fb :ls<CR>:b<Space>

" Keep the cursor 5 lines from the top and bottom of the screen
set scrolloff=5

" Remap <C-d> and <C-u> to scroll and center the screen
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Enable syntax highlighting
if has("syntax")
  syntax on
endif

" Backspacing over everything in insert mode
set backspace=indent,eol,start

" Make sure Vim returns to the same line when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" For better command-line completion
set wildmenu

" Reduce time it takes for Vim to respond to a command sequence
set timeoutlen=1000 ttimeoutlen=0

" More natural split direction
set splitbelow splitright

" Show matching brackets when text indicator is over them
set showmatch

" Enable recursive file searching
set path+=**

" Ignore .git directories in searches
set wildignore+=*/.git/*

" Enable incremental search
set incsearch

" Allow buffer switching with unsaved changes
set hidden

" Set color scheme
" Attempt to set the 'catpuccin' colorscheme
if !empty(globpath(&rtp, "colors/catppuccin_mocha.vim"))
    set termguicolors
    colorscheme catppuccin_mocha
else
    " Fallback to 'torte' if 'catpuccin' is not found
    colorscheme torte
endif


" Increase command history
set history=1000

" Make a more useful statusline
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%c%V]\ [%p%%]\ [LEN=%L]
set laststatus=2

" Preserve more information between sessions
set viminfo='20,\"50,:100,n~/.viminfo

" Netrw enhancements
" let g:netrw_banner=0         " Disable banner
let g:netrw_liststyle=3      " Tree-style file listing
let g:netrw_altv=1           " Open splits to the right

" Window navigation using Ctrl + h/j/k/l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Close current buffer without closing window with leader b d
nnoremap <leader>bd :bd<CR>

