-- Set leader key
vim.g.mapleader = " "

-- Basic settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.cmd("syntax enable")

-- Disable netrw (nvim-tree uses its own)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Load plugins
require("plugins")
require("keymaps")
-- Keybindings

