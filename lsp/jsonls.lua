-- $ npm install -g vscode-langservers-extracted

return {
	cmd = { "vscode-json-language-server", "--stdio" },

	filetypes = {
		"json",
		"jsonc",
	},

	single_file_support = true,

	root_markers = { "package.json", ".git" },

	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
}
