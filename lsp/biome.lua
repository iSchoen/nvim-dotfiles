-- $ npm install -g @biomejs/biome

local project = require("util.project")

return {
	cmd = { "biome", "lsp-proxy" },

	filetypes = {
		"javascript",
		"javascriptreact",
		"json",
		"jsonc",
		"typescript",
		"typescript.tsx",
		"typescriptreact",
		"astro",
		"svelte",
		"vue",
		"css",
	},

	single_file_support = false,

	root_markers = { "biome.json", "biome.jsonc" },

	root_dir = function(bufnr, on_dir)
		if project.has_biome() then
			on_dir(vim.fn.getcwd())
		end
	end,

	workspace_required = true,
}
