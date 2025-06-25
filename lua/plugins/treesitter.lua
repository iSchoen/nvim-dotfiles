return {
	"nvim-treesitter/nvim-treesitter",
	branch = 'master',
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				'bash',
				'c',
				'cpp',
				'diff',
				'go',
				'html',
				'javascript',
				'lua',
				'luadoc',
				'markdown',
				'markdown_inline',
				'python',
				'query',
				'rust',
				'tsx',
				'typescript',
				'vim',
				'vimdoc',
			},
			highlight = { enable = true },
			indent = { enabled = true },
		})
	end
}

