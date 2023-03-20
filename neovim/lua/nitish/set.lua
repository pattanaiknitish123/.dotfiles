vim.g.mapleader = " " -- vim.o.guicursor = " "
vim.o.nu = true
vim.o.relativenumber = true

vim.o.tabstop= 8
vim.o.shiftwidth= 4
vim.o.softtabstop= 4
vim.o.expandtab = true

vim.o.title = true
vim.o.mouse = "a"

vim.o.smartindent = true
vim.o.wrap = true
vim.o.swapfile = false
vim.o.backup = false
-- vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.errorbells = false
vim.o.laststatus = 0


vim.o.termguicolors = true
-- vim.o.colorscheme = slate
vim.cmd('colorscheme slate')
-- vim.o.scrolloff = 8
vim.o.signcolumn= "no"

vim.o.updatetime = 50

