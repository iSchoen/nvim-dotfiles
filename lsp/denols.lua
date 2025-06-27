-- $ curl -fsSL https://deno.land/install.sh | sh

local project = require("util.project")

return {
	cmd = { "deno", "lsp" },

	cmd_env = {
		NO_COLOR = true,
	},

	settings = {
		deno = {
			enable = true,
			suggest = {
				imports = {
					hosts = {
						["https://deno.land"] = true,
					},
				},
			},
		},
	},

	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = true
	end,

	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},

	single_file_support = true,

	root_markers = { "deno.json", "deno.jsonc", ".git" },

	root_dir = function(bufnr, on_dir)
		if not project.is_node() then
			on_dir(vim.fn.getcwd())
		end
	end,
}
