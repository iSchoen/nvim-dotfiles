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
		end,
	},
}

-- vim.cmd([[colorscheme synthwave]])
