-- Leader must be set before any plugins load.
vim.g.mapleader = " "

vim.o.number = true
vim.o.relativenumber = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.cursorline = true
vim.o.scrolloff = 5
vim.o.list = true
vim.o.confirm = true

vim.opt.termguicolors = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Built-in package: clear search highlight on idle / entering insert.
vim.cmd("packadd! nohlsearch")
