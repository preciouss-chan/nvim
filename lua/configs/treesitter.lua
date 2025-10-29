-- This file should be at: lua/plugins/treesitter.lua

return {
  "nvim-treesitter/nvim-treesitter",

  -- This `build` step is a good practice to automatically run :TSUpdate
  -- This will install/update parsers on plugin updates.
  build = ":TSUpdate",

  -- This is a very common companion plugin, you can add it if you want
  -- text-objects. You'll see it in the config below.
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },

  config = function()
    -- We must call setup *inside* the config function.
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      -- A list of parser names, or "all".
      -- Add any languages you use here.
      ensure_installed = {
        "python",
        "lua",
        "vim",
        "vimdoc",
        "javascript",
        "typescript",
        "html",
        "css",
        "bash",
        "markdown",
        "json",
        "yaml",
        "c",
        "cpp",
        -- Add more languages here!
      },

      -- Install parsers synchronously (only relevant for :TSInstall)
      sync_install = false,

      -- Automatically install missing parsers when entering a buffer
      -- Highly recommended!
      auto_install = true,

      -- === Core Modules ===

      highlight = {
        enable = true,
        -- You can disable highlighting for specific languages if they cause issues
        -- disable = { "c", "rust" },
      },

      indent = {
        enable = true,
      },

    })
  end,
}
