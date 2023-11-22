-- [[ plugins.telescope.setup.lua ]]

-- See `:help telescope` and `:help telescope.setup()`
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-u>"] = false,
				["<C-d>"] = false
			}
		}
	},
	file_ignore_patterns = {
		"node_modules",
	}
})

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")
