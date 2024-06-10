-- Install packer
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
	vim.cmd [[packadd packer.nvim]]
end

require("packer").startup(function(use)
	-- [[ Package Manager ]]
	use "wbthomason/packer.nvim"

	-----------------------------------------------------------------------------------------------------------------------------------------------------
	-- [[ LSP & Autocompletion ]]
	use {
		"neovim/nvim-lspconfig",
		requires = {
			"williamboman/mason.nvim",						-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason-lspconfig.nvim",	-- Automatically install LSPs to stdpath for neovim
			"j-hui/fidget.nvim",									-- Useful status updates for LSP
			"folke/neodev.nvim",									-- Additional lua configuration, makes nvim stuff amazing
		},
	}
	use { 'j-hui/fidget.nvim' }								-- Elegant editor notifications
	use { -- Primary autocompletion engine
		"hrsh7th/nvim-cmp",
		requires = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
	}
	use { "hrsh7th/cmp-buffer" }									-- Generates completion source from buffer
	use { "hrsh7th/cmp-path" }										-- Generates completion source from path
	use { "hrsh7th/cmp-cmdline" }									-- Generates completion source from command line
	use { "hrsh7th/cmp-nvim-lua" }								-- Generates completion source for nvim Lua API
	use { "hrsh7th/cmp-nvim-lsp-signature-help" } -- Generates completion source for nvim LSP signature help
	use { "b0o/schemastore.nvim" }								-- Global schema store for LSP

	-----------------------------------------------------------------------------------------------------------------------------------------------------
	-- [[ Writing Code ]]
	use { "prettier/vim-prettier", run = "yarn install" } -- Formatter for JavaScript, TypeScript, HTML, CSS, JSON, YAML, Markdown, GraphQL, etc.
	use { "tpope/vim-surround" }													-- Vim nouns, motions, and verbs for changing surrounding characters
	use { "tpope/vim-repeat" }														-- Allow `.` to repeat actions performed by plugins
	use { "windwp/nvim-autopairs" }												-- Auto-pairing of characters
	use { "github/copilot.vim" }													-- AI generated autocompletion suggestions
	use { "stevearc/dressing.nvim" }											-- Improve UI using the built-in core UI hooks `vim.ui.select` and `vim.ui.input`

	-----------------------------------------------------------------------------------------------------------------------------------------------------
	-- [[ Treesitter ]]
	use { -- Primary treesitter installation
		"nvim-treesitter/nvim-treesitter",
		run = function()
			pcall(require("nvim-treesitter.install").update { with_sync = true })
		end,
	}
	use { -- Additional text objects via treesitter
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
	}

	-----------------------------------------------------------------------------------------------------------------------------------------------------
	-- [[ Git related plugins ]]
	use { "tpope/vim-fugitive" }
	use { "tpope/vim-rhubarb" }
	use { "lewis6991/gitsigns.nvim" }
	use { "f-person/git-blame.nvim" } -- Display Git blame information

	-----------------------------------------------------------------------------------------------------------------------------------------------------
	-- [[ Themes ]]
	use { "ellisonleao/gruvbox.nvim" }
	use { "Mofiqul/dracula.nvim" }

	-----------------------------------------------------------------------------------------------------------------------------------------------------
	-- [[ UI ]]
	use { "nvim-lualine/lualine.nvim" }						-- Fancier statusline
	use { "lukas-reineke/indent-blankline.nvim" } -- Add indentation guides even on blank lines
	use { "numToStr/Comment.nvim" }								-- "gc" to comment visual regions/lines
	use { "tpope/vim-sleuth" }										-- Detect tabstop and shiftwidth automatically
	use {
		"kyazdani42/nvim-tree.lua",									-- File explorer
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
		tag = "nightly"
	}

	-----------------------------------------------------------------------------------------------------------------------------------------------------
	-- [[ AI ]]
	use { "MunifTanjim/nui.nvim" }
	use({
		"jackMort/ChatGPT.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim"
		}
	})

	-----------------------------------------------------------------------------------------------------------------------------------------------------
	-- [[ Fuzzy Finding ]]
	-- Fuzzy Finder (files, lsp, etc)
	use { "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { "nvim-lua/plenary.nvim" } }
	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	use { "nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = vim.fn.executable "make" == 1 }


	-- [[ Startup ]]
	if is_bootstrap then
		require("packer").sync()
	end
end)

-- When we are bootstrapping a configuration, it doesn"t
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
	print "=================================="
	print "    Plugins are being installed"
	print "    Wait until Packer completes,"
	print "       then restart nvim"
	print "=================================="
	return
end
