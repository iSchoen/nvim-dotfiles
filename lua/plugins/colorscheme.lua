return {
	{
		"loctvl842/monokai-pro.nvim",
		name = "monokai-pro",
		lazy = false,
		priority = 1000,
		opts = {
			filter = "classic",
		},
		config = function()
			-- vim.cmd([[colorscheme monokai-pro]])
		end,
	},

	{
		"Mofiqul/dracula.nvim",
		name = "dracula",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd([[colorscheme dracula]])
		end,
	},

	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("gruvbox").setup({
				styles = {
					comments = { italic = false },
				},
			})

			vim.cmd([[colorscheme gruvbox]])

			-- Custom highlight overrides for high-contrast search visibility
			vim.api.nvim_set_hl(0, "Search", { bg = "#fabd2f", fg = "#1d2021", bold = true }) -- Bright yellow background, dark text
			vim.api.nvim_set_hl(0, "IncSearch", { bg = "#fabd2f", fg = "#1d2021", bold = true }) -- Bright yellow background, light text
			vim.api.nvim_set_hl(0, "CurSearch", { bg = "#b8bb26", fg = "#1d2021", bold = true }) -- Bright green background, dark text
		end,
	},
}

-- vim.cmd([[colorscheme synthwave]])
