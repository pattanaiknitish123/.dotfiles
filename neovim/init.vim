let mapleader = ","

set scrolloff=8
set nobackup 
set noswapfile 

set ignorecase 
set smartcase 
set smartindent 

set confirm
set noerrorbells
"set relativenumber
set number 
set laststatus=0
set fileencoding=UTF-8
set encoding=UTF-8

set wrap 
set expandtab
set tabstop=8
set shiftwidth=4
set softtabstop=4
set smarttab
set clipboard+=unnamedplus

"encoding=utf-8

"colorcolumn = "80"
"signcolumn = "yes"

"vim.opt.listchars = {
"    tab = "| ",
"    eol = '¬',
"    trail = '·'
"}


set title 
set mouse=a

"Emulate GeorgeHotz ColorScheme But with default.vim
colorscheme default
highlight Comment ctermfg=green
highlight Constant ctermfg=red
highlight Identifier ctermfg=darkblue
highlight PreProc ctermfg=darkmagenta
highlight Special ctermfg=darkcyan
highlight Type ctermfg=cyan
highlight Statement ctermfg=darkyellow
highlight LineNr ctermfg=brown
highlight RedrawDebugClear ctermbg=yellow ctermfg=black
highlight RedrawDebugComposed ctermbg=darkgreen ctermfg=white

"highlight Statement ctermfg=darkmagenta
"highlight LineNr ctermfg=darkyellow
"highlight PreProc ctermfg=brown
