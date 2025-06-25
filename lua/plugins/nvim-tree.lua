return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		view = {
			adaptive_size = true,
			side = "right",
			relativenumber = true,
		},
		filters = {
			dotfiles = false,
		},
		git = {
			ignore = false
		},
	},
	config = function(_, opts)
		require("nvim-tree").setup(opts)

		vim.keymap.set("n", "<leader>nn", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>nf", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })
	end
}
