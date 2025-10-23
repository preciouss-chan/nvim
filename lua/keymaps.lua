vim.keymap.set('n', '<leader>e', function()
  require("nvim-tree.api").tree.toggle({ focus = true })
end, { desc = "Toggle and focus NvimTree" })

vim.keymap.set('n', '<leader>tt', function()
  require("nvim-tree.api").tree.focus()
end, { desc = "Focus NvimTree" })

