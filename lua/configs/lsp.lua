-- lua/configs/lsp.lua

local ok_mason, mason = pcall(require, "mason")
if not ok_mason then
	vim.notify("Mason not found", vim.log.levels.ERROR)
	return
end

local ok_mason_lsp, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok_mason_lsp then
	vim.notify("mason-lspconfig not found", vim.log.levels.ERROR)
	return
end

local ok_lspconfig, lspconfig = pcall(require, "lspconfig")
if not ok_lspconfig then
	vim.notify("nvim-lspconfig not found", vim.log.levels.ERROR)
	return
end

mason.setup()

-- Defines how to attach to an LSP server
local on_attach = function(_, bufnr)
	local opts = { buffer = bufnr, silent = true }
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
end

-- lua/configs/lsp.lua
local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr, silent = true }

  -- ... (your other maps like gd, K, <leader>rr) ...

  -- ADD THIS:
  -- Show diagnostic error/warning in a float window
  vim.keymap.set('n', '<leader>n', vim.diagnostic.open_float, opts)
end

-- Get capabilities for nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- *** FIX IS HERE ***
-- Combine your setup and handlers into a single call
mason_lspconfig.setup({
	ensure_installed = { "pyright", "clangd", "lua_ls" },
	automatic_installation = true,

	handlers = {
		-- This is the default handler for most servers
		function(server_name)
			lspconfig[server_name].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end,

		-- Handler for LUA to fix the "vim" global warning
		["lua_ls"] = function()
			lspconfig.lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					Lua = { diagnostics = { globals = { "vim" } } },
				},
			})
		end,

		-- *** ADD THIS NEW HANDLER FOR C/C++ ***
		["clangd"] = function()
			lspconfig.clangd.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				-- This is the magic part
				init_options = {
					-- This is a string that contains the .clang-format rules
					fallbackStyle = "{ IndentWidth: 4, BasedOnStyle: 'LLVM', UseTab: 'Never' }",
				},
			})
		end,
	},
})
