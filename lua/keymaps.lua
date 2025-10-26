vim.keymap.set('n', '<leader>e', function()
  require("nvim-tree.api").tree.toggle({ focus = true })
end, { desc = "Toggle and focus NvimTree" })

vim.keymap.set('n', '<leader>tt', function()
  require("nvim-tree.api").tree.focus()
end, { desc = "Focus NvimTree" })

-- Remap :wq to write and close the current buffer, ignoring Neo-tree
vim.api.nvim_create_user_command("Wq", function()
  if vim.bo.filetype ~= "neo-tree" then
    vim.cmd("write")     -- save file
    vim.cmd("bdelete")   -- close only current buffer
  end
end, {})

vim.cmd("cnoreabbrev wq Wq")

