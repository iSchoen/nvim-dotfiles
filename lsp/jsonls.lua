-- $ npm install -g vscode-langservers-extracted

return {
	cmd = { "vscode-json-language-server", "--stdio" },

	filetypes = {
		"json",
		"jsonc",
	},

	single_file_support = true,

	root_markers = { "package.json", ".git" },

	root_dir = function(bufnr, on_dir)
		local buf_name = vim.api.nvim_buf_get_name(bufnr)
		local filename = vim.fn.fnamemodify(buf_name, ":t")

		on_dir(vim.fn.getcwd())
	end,

	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
}
