local api = require("nvim-tree.api")

local function on_attach(bufnr)
  api.config.mappings.default_on_attach(bufnr)
  vim.keymap.set('n', '<CR>', api.node.open.tab_drop, { buffer = bufnr, noremap=true, silent=true, nowait=true })
end

require("nvim-tree").setup({
  on_attach = on_attach,
  view = { width = 30 },
  renderer = { group_empty = true },
  filters = { dotfiles = true },
  sort = { sorter = "case_sensitive" },
  actions = { open_file = { quit_on_open = true } },
})

