local project = require("util.project")

local get_js_formatter = function()
	if project.has_biome() then
		return { "biome-check" }
	end

	return { "deno_fmt" }
end

local get_json_formatter = function()
	if project.has_biome() then
		return { "biome-check" }
	end

	return { "deno_fmt" }
end

local get_svelte_formatter = function()
	if project.has_biome() then
		return { "biome-check" }
	end
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

		format_on_save = function()
			local lsp_format_opt = "never"
			return {
				timeout_ms = 500,
				lsp_format = lsp_format_opt,
			}
		end,

		formatters = {
			deno_fmt = {
				command = "deno",
				args = function(_self, ctx)
					local ext = vim.fn.fnamemodify(ctx.filename, ":e")
					if ext == "json" or ext == "jsonc" then
						return { "fmt", "--ext", ext, "-" }
					else
						return { "fmt", "-" }
					end
				end,
				stdin = true,
			},
		},

		formatters_by_ft = {
			lua = { "stylua" },

			javascript = function()
				return get_js_formatter()
			end,

			javascriptreact = function()
				return get_js_formatter()
			end,

			typescript = function()
				return get_js_formatter()
			end,

			typescriptreact = function()
				return get_js_formatter()
			end,

			json = function()
				return get_json_formatter()
			end,

			jsonc = function()
				return get_json_formatter()
			end,

			svelte = function()
				return get_svelte_formatter()
			end,

			go = { "goimports", "gofmt" },

			rust = { "rustfmt" },

			sh = { "shfmt", "shellcheck" },

			bash = { "shfmt", "shellcheck" },

			zsh = { "shfmt", "shellcheck" },
		},
	},
}
