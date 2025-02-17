require("settings")

-- Equivalent to "set nocompatible"
vim.opt.compatible = false

-- Matching parentheses highlighting
vim.opt.showmatch = true

-- Case insensitive searching
vim.opt.ignorecase = true

-- Highlight search results
vim.opt.hlsearch = true

-- Enable incremental search
vim.opt.incsearch = true

-- Tab settings
vim.opt.tabstop = 5
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Automatic indentation
vim.opt.autoindent = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Wildmode for command-line completion
vim.opt.wildmode = "longest,list"

-- Column marker at 80 characters
vim.opt.colorcolumn = "80"

-- Mouse support (final value "a" overrides previous "v")
vim.opt.mouse = "a"

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Highlight the cursor line
vim.opt.cursorline = true

-- Speed up scrolling and redrawing on fast terminals
vim.opt.ttyfast = true

-- Enable filetype detection, plugins, and indentation
vim.cmd("filetype plugin indent on")
vim.cmd("filetype plugin on")

-- Enable syntax highlighting
vim.cmd("syntax on")

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


require("lazy").setup({
    "nvim-lualine/lualine.nvim",
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "neanias/everforest-nvim", priority = 1000 }
})


vim.cmd.colorscheme "everforest"
