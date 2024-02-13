-- My neovim config is conglomeration of:
-- thePrimeagen
-- nvim-lua/kickstart
-- https://laracasts.com/series/neovim-as-a-php-ide
-- My own custom pieces that I liked from experimenting around.

-- Set <space> as the leader key
-- Before everything else happens
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Make sure the terminal inside neovim is logged in.
vim.opt.shell = "bash -l"

-- [[Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure plugins ]]
require("lazy").setup("rainwater.lazy")

require("rainwater.remap")
require("rainwater.set")
