print("Is this working?...")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.general.positionEncodings = { "utf-16" }

vim.lsp.config("*", {
	capabilities = capabilities,
})

vim.lsp.enable({
	"biome",
	"denols",
	"jsonls",
	"lua_ls",
	"rust_analyzer",
	"tailwindcss",
	"vtsls",
	"yamlls",
})

vim.diagnostic.config({
	-- virtual_lines = true,
	-- virtual_text = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
	},
	signs = {
		text = {},
		numhl = {},
	},
})
