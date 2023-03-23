filetype indent on

"set scrolloff=0
set nobackup
set noswapfile
set undodir=~/.local/state/nvim/undo/   "default enabled...same

set ignorecase
set smartcase
set smartindent

set confirm
set noerrorbells
set number
"set rnu
set laststatus=0

set wrap
set expandtab
set tabstop=8
set shiftwidth=4
set softtabstop=4

set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix

set title
set mouse=a             "default set only  to n,v,i... I set it to all-a

""remap keys
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

"colorscheme slate
"set termguicolors
"hi Comment guifg=lightgreen
"hi Function guifg=darkmagenta
"hi Constant guifg=red
"hi MatchParen guibg=darkcyan guifg=white
    ""hi Cursor guibg=red guifg=white
"hi! Normal guibg=#000000
     ""hi! Normal guibg=#2b2b2b

"colorscheme slate
"hi! Normal ctermbg=black
"hi Comment ctermfg=lightgreen
"hi Function ctermfg=darkmagenta
"hi Constant ctermfg=red
"hi MatchParen ctermbg=darkcyan ctermfg=white


if !exists('$TMUX')&& !exists('$STY')
    colorscheme slate
    set termguicolors
    hi Comment guifg=lightgreen
    hi Function guifg=darkmagenta
    hi Constant guifg=red
    hi MatchParen guibg=darkcyan guifg=white
    hi! Normal guibg=#000000
elseif exists('$TMUX')
    colorscheme slate
    set termguicolors
    hi Comment guifg=lightgreen
    hi Function guifg=darkmagenta
    hi Constant guifg=red
    hi MatchParen guibg=darkcyan guifg=white
    hi! Normal guibg=#000000
elseif exists('$STY')
    colorscheme slate
    hi! Normal ctermbg=black
    hi Comment ctermfg=lightgreen
    hi Function ctermfg=darkmagenta
    hi Constant ctermfg=red
    hi MatchParen ctermbg=darkcyan ctermfg=white
endif
