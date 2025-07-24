return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},

	version = "1.*",

	---@module "blink.cmp"
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "enter",
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<Tab>"] = { "select_next", "fallback" },
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			accept = { auto_brackets = { enabled = false } },

			ghost_text = { enabled = false },

			menu = {
				draw = {
					columns = {
						{ "kind_icon", "label", "label_description", "source_name", gap = 1 },
					},
					components = {
						label_description = {
							width = { max = 10000 },
						},
						source_name = {
							text = function(ctx)
								return "[" .. ctx.source_name .. "]"
							end,
						},
					},
				},
			},
			list = {
				selection = {
					preselect = true,
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
			},
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		snippets = {
			expand = function(snippet)
				-- Smart snippet handling: remove all placeholders, keep smart positioning
				local text = snippet

				-- Remove all placeholders (both with and without default values)
				text = text:gsub("${%d+:[^}]*}", "") -- Remove ${1:default}
				text = text:gsub("${%d+}", "") -- Remove ${1}
				text = text:gsub("$%d+", "") -- Remove $1

				-- Insert the text
				local lines = vim.split(text, "\n")
				vim.api.nvim_put(lines, "c", true, true)

				-- Smart cursor positioning for arrays and objects
				local line = vim.api.nvim_get_current_line()
				local col = vim.api.nvim_win_get_cursor(0)[2]

				-- If we just inserted [] or {}, move cursor inside
				if line:find("%[%]", col - 1) then
					vim.api.nvim_win_set_cursor(0, { vim.api.nvim_win_get_cursor(0)[1], col - 1 })
				elseif line:find("%{%}", col - 1) then
					vim.api.nvim_win_set_cursor(0, { vim.api.nvim_win_get_cursor(0)[1], col - 1 })
				end
			end,
			active = function()
				return false
			end,
			jump = function()
				return false
			end,
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
