return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"biome",
			"denols",
			"html",
			"jsonls",
			"lua_ls",
			"pyright",
			"ruby_lsp",
			"rust_analyzer",
			"ts_ls",
			"yamlls",
		},
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}
