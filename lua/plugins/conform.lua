local project = require("util.project")

local get_js_formatter = function(bufnr)
	local bufname = vim.api.nvim_buf_get_name(bufnr)
	local root = vim.fs.dirname(
		vim.fs.find({ "package.json", "deno.json", "deno.jsonc", ".git" }, { upward = true, path = bufname })[1]
			or bufname
	)
	if project.has_biome(root) then
		return { "biome" }
	end

	return { "deno_fmt" }
end

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "never" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			local lsp_format_opt = "never"
			return {
				timeout_ms = 500,
				lsp_format = lsp_format_opt,
			}
		end,
		formatters = {
			deno_fmt = {
				command = "deno",
				args = { "fmt", "-" },
				stdin = true,
			},
		},
		formatters_by_ft = {
			lua = { "stylua" },

			javascript = function(bufnr)
				get_js_formatter(bufnr)
			end,

			javascriptreact = function(bufnr)
				get_js_formatter(bufnr)
			end,

			typescript = function(bufnr)
				get_js_formatter(bufnr)
			end,

			typescriptreact = function(bufnr)
				get_js_formatter(bufnr)
			end,

			json = { "biome" },

			jsonc = { "biome" },

			go = { "goimports", "gofmt" },

			rust = { "rustfmt" },
		},
	},
}
