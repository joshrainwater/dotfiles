-- Set relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Always use 4 spaces because that's the best
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

-- Don't continually highlight after select
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- Keep cursor relatively in the middle
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- Case insensitive searching unless capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Better completion experience?
vim.opt.completeopt = 'menuone,noselect'
