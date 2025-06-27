local project = require("util.project")

local get_js_formatter = function(bufnr)
	if project.has_biome() then
		return { "biome", "biome-check" }
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
				return get_js_formatter(bufnr)
			end,

			javascriptreact = function(bufnr)
				return get_js_formatter(bufnr)
			end,

			typescript = function(bufnr)
				return get_js_formatter(bufnr)
			end,

			typescriptreact = function(bufnr)
				return get_js_formatter(bufnr)
			end,

			json = { "biome" },

			jsonc = { "biome" },

			go = { "goimports", "gofmt" },

			rust = { "rustfmt" },
		},
	},
}
