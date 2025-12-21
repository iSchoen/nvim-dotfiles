-- $ npm install -g vscode-langservers-extracted

return {
	cmd = { "vscode-json-language-server", "--stdio" },

	filetypes = {
		"json",
		"jsonc",
	},

	single_file_support = true,

	root_markers = { "package.json", ".git" },

	root_dir = function(_bufnr, on_dir)
		on_dir(vim.fn.getcwd())
	end,

	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
}
