call plug#begin('~/AppData/Local/nvim-data/plugged')
Plug 'morhetz/gruvbox'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

""Plug 'deoplete-plugins/deoplete-clang'
"Plug 'frazrepo/vim-rainbow'

Plug 'vim-python/python-syntax'

call plug#end()

let g:ale_linters = {
			\ 'python': ['pylint'],
			\ 'vim': ['vint'],
			\ 'cpp': ['clang'],
			\ 'c': ['clang']
			\}

set path+=**					" Searches current directory recursively.
set wildmenu					" Display all matches when tab complete.
set incsearch                   " Incremental search
set hidden                      " Needed to keep multiple buffers open
set nobackup                    " No auto backups
set noswapfile                  " No swap
set t_Co=256                    " Set if term supports 256 colors.
"set number relativenumber    
set nu!                         " Display line numbers
"set clipboard=unnamedplus      " Copy/paste between vim and other programs.
syntax enable
let g:rehash256 = 1
set encoding=utf-8
set fileencoding=utf-8
set title
set go=a
set mouse=a
set nohlsearch
set noshowmode
set noruler
set noerrorbells
set noswapfile
set nobackup
set undofile
set scrolloff=8
set completeopt=menuone,noinsert,noselect
""set signcolumn=yes
set wildmode=longest,list,full

"sane editing
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

"set colorcolumn=80
set viminfo='25,\"50,n~/.viminfo

"set tw=79
set autoindent
set smartindent
filetype plugin indent on

"configure paired characters
inoremap ' ''<ESC>ha
inoremap " ""<ESC>ha
inoremap ` ``<ESC>ha
inoremap ( ()<ESC>ha
inoremap [ []<ESC>ha
inoremap { {}<ESC>ha
inoremap /* /** */<ESC>2ha

set splitbelow splitright

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

"VIM AIRLINE CONFIG
"""""""""""""""""""
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
 "let g:airline_theme='dark'  //default one
 let g:airline_theme='minimalist'
 "" powerline symbols
 let g:airline_left_sep = ''
 let g:airline_left_alt_sep = ''
 let g:airline_right_sep = ''
 let g:airline_right_alt_sep = ''
 let g:airline_symbols.branch = ''
 let g:airline_symbols.colnr = ' :'
 let g:airline_symbols.readonly = ''
 let g:airline_symbols.linenr = ' :'
 let g:airline_symbols.maxlinenr = '☰ '
 let g:airline_symbols.dirty='⚡'

"""""""""""""""""""""""
"COLORS AND COLORSCHEME
"""""""""""""""""""""""
 "if (has("termguicolors"))
 "    set termguicolors
 "endif
 "if $term =~# '256color' && ( $TERM =~# '^screen'  || $TERM =~# '^tmux' )
  "   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
   "  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    " set termguicolors
     "endif
"colorscheme molokai
     "colorscheme ghdark
     colorscheme gruvbox
 set background=dark
