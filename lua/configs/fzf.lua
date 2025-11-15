local fzf = require("fzf-lua")

fzf.setup({
  files = {
    -- fd search settings
    fd_opts = "--type f --hidden --follow --exclude .git",
  },

  grep = {
    rg_opts = "--hidden --column --line-number --no-heading --smart-case --color=always",
  },

  winopts = {
    height = 0.85,
    width = 0.80,
    preview = {
      layout = "vertical",
    },
  },
})

vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "FZF Files" })
vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "FZF Live Grep" })
vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "FZF Buffers" })
vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "FZF Help" })

