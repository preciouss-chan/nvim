vim.g.mapleader = " "

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.number = true
vim.opt.relativenumber = true

vim.cmd("syntax enable")


-- init.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
--nvim tree
{
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons", 
  },
  config = function()
    require("nvim-tree").setup({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
        
      actions = {
        open_file = {
            quit_on_open = true,
        }
      }
    })
  end,
},
--colorscheme
{
      'sainnhe/sonokai',
      lazy = false,
      priority = 1000,
      config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
        vim.g.sonokai_enable_italic = true
        vim.g.sonokai_style = "maia"
        vim.g.sonokai_italic_comments = true   -- use italics on comments
        vim.g.sonokai_better_performance = true
        vim.cmd.colorscheme('sonokai')
	end,
},

--treesitter
{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "python", "javascript", "html", "css", "c" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
},
--status line
{
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "sonokai",
      }
    })
  end,
},

})


vim.keymap.set('n', '<leader>e', function()
  require("nvim-tree.api").tree.toggle({ focus = true })
end, { desc = "Toggle and focus NvimTree" })

-- Focus NvimTree if open
vim.keymap.set('n', '<leader>tt', function()
  require("nvim-tree.api").tree.focus()
end, { desc = "Focus NvimTree" })

