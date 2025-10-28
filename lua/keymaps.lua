vim.keymap.set('n', '<leader>e', function()
  require("nvim-tree.api").tree.toggle({ focus = true })
end, { desc = "Toggle and focus NvimTree" })

vim.keymap.set('n', '<leader>tt', function()
  require("nvim-tree.api").tree.focus()
end, { desc = "Focus NvimTree" })

-- Remap :wq to write and close the current buffer, ignoring Neo-tree
vim.api.nvim_create_user_command("Wq", function()
  -- Get a table of all *listed* buffers
  local listed_buffers = vim.fn.getbufinfo({buflisted = 1})
  local num_listed_buffers = #listed_buffers

  if num_listed_buffers > 1 then
    -- MORE than 1 buffer open: Save and close current buffer
    if vim.bo.filetype ~= "neo-tree" then
      vim.cmd("write") -- Save if it's a normal file
    end
    vim.cmd("bdelete") -- Close just this buffer
  else
    -- ONE buffer open: Save and quit Neovim
    if vim.bo.filetype ~= "neo-tree" then
      vim.cmd("write") -- Save if it's a normal file
    end
    vim.cmd("quit") -- Quit nvim
  end
end, {})

-- This maps :wq to run your :Wq command
vim.cmd("cnoreabbrev wq Wq")
