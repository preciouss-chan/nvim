require("bufferline").setup({
  options = {
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "left",
        separator = true,
      },
    },
  },
})

vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", {silent=true, desc = "Next buffer"})
vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", {silent=true, desc = "Previous buffer"})

vim.keymap.set("n", "<leader>x", ":bd<CR>" , {silent=true, desc="Close buffer"})

vim.keymap.set("n", "<leader><S-l>", ":BufferLineMoveNext<CR>", { silent = true, desc = "Move buffer right" })
vim.keymap.set("n", "<leader><S-h>", ":BufferLineMovePrev<CR>", { silent = true, desc = "Move buffer left" })

vim.keymap.set("n", "<leader>wq", ":w | bd<CR>", { silent = true, desc = "Save and close buffer" })
