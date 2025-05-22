-- [[ plugins.mason.setup.lua ]]

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("mason").setup()

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
	ensure_installed = {
		"biome",
		"denols",
		-- "eslint",
		"jsonls",
		-- "lua_ls",
		"pyright",
		"ruby_lsp",
		"rust_analyzer",
		"ts_ls",
		"yamlls"
	}
})

vim.diagnostic.config({
	underline = true,
	virtual_text = false,
	virtual_lines = false,
	signs = true,
	update_in_insert = true,
	severity_sort = true,
	float = {
		scope = "cursor",
		source = true,
	},
})
