require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "lua", "python", "javascript", "typescript", "tsx",
    "html", "css", "c", "cpp", "kotlin"
  },
  highlight = { enable = true },
  indent = { enable = true },
})

