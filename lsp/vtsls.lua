-- $ npm install -g @vtsls/language-server

local project = require("util.project")

return {
	cmd = { "vtsls", "--stdio" },

	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },

	root_markers = { "tsconfig.json", "package.json", "jsconfig.json", ".git" },

	root_dir = function(bufnr, on_dir)
		local root = vim.fs.dirname(
			vim.fs.find({ "package.json", "deno.json", "deno.jsonc", ".git" }, { upward = true, path = bufname })[1]
				or bufname
		)

		if project.is_node(root) then
			on_dir(vim.fn.getcwd())
		end
	end,

	settings = {
		vtsls = {
			autoUseWorkspaceTsdk = true,
		},
	},
}
