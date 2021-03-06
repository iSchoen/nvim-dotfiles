-- [[ plugins.lua ]]

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- Install packer if needed
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end

vim.cmd([[packadd packer.nvim]])

require("packer").init({
  compile_path = install_path .. "/packer_compiled.lua"
})

return require("packer").startup(function(use)
  -- [[ Package Manager ]]

  use { "wbthomason/packer.nvim" }                              -- Package manager
--------------------------------------------------------------------------------------------------------------------------------------
  -- [[ LSP ]]

  use { "neovim/nvim-lspconfig" }                               -- LSP defaults
  use { "anott03/nvim-lspinstall" }                             -- Language Server Installer
--------------------------------------------------------------------------------------------------------------------------------------
  -- [[ Auto-completion ]]

  use { "saadparwaiz1/cmp_luasnip" }                            -- Generates completion source from LuaSnip
  use { "hrsh7th/cmp-nvim-lsp" }                                -- Generates completion source from LSP
  use { "hrsh7th/cmp-buffer" }                                  -- Generates completion source from buffer
  use { "hrsh7th/cmp-path" }                                    -- Generates completion source from path
  use { "hrsh7th/cmp-cmdline" }                                 -- Generates completion source from command line
  use { "hrsh7th/cmp-nvim-lua" }                                -- Generates completion source for nvim Lua API
  use { "hrsh7th/cmp-nvim-lsp-signature-help" }                 -- Generates completion source for nvim LSP signature help
  use { "hrsh7th/nvim-cmp" }                                    -- Consumes all completion sources and provides suggestions
  use { "nvim-lua/completion-nvim" }                            -- Provides autocompletion functionality for nvim
  use { "onsails/lspkind.nvim" }                                -- Provides pictograms to NeoVim LSP suggestions
--------------------------------------------------------------------------------------------------------------------------------------
  -- [[ Fuzzy Finding ]]

  use { "nvim-lua/plenary.nvim" }                               -- Useful functions using the NeoVim API
  use { "nvim-lua/popup.nvim" }                                 -- Implementation of the Vim popup API in NeoVim
  use { "nvim-lua/telescope.nvim" }                             -- Extendable fuzzy finder over lists
  use {
    "nvim-telescope/telescope-fzf-native.nvim",                 -- Fuzzy finder plugin for Telescope
    run = "make"
  }
--------------------------------------------------------------------------------------------------------------------------------------
  -- [[ Git ]]

  use { "airblade/vim-gitgutter" }                              -- Display git diffs in the gutter
  use { "f-person/git-blame.nvim" }                             -- Display Git blame information
--------------------------------------------------------------------------------------------------------------------------------------
  -- [[ UI ]]

  use { "stevearc/dressing.nvim" }                              -- Improve UI using the built-in core UI hooks `vim.ui.select` and `vim.ui.input`
  use {
    "nvim-lualine/lualine.nvim",                                -- Display useful information in status line
    requires = { "kyazdani42/nvim-web-devicons", opt = true }
  }
  use { "arkav/lualine-lsp-progress" }                          -- Display LSP loading status in status line
  use {
    "goolord/alpha-nvim",                                       -- Customize Neovim startup screen
    requires = { "kyazdani42/nvim-web-devicons" }
  }
  use {
    "kyazdani42/nvim-tree.lua",                                 -- File explorer
    requires = {
      "kyazdani42/nvim-web-devicons",
    },
    tag = "nightly"
  }

--------------------------------------------------------------------------------------------------------------------------------------
  -- [[ Treesitter ]]

  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }  -- Parser generator tool and an incremental parsing library
--------------------------------------------------------------------------------------------------------------------------------------
  -- [[ Formatting ]]

  use { "prettier/vim-prettier", run = "yarn install" }         -- Formatter for JavaScript, TypeScript, HTML, CSS, JSON, YAML, Markdown, GraphQL, etc.
--------------------------------------------------------------------------------------------------------------------------------------
  -- [[ Snippets ]]

  use { "L3MON4D3/LuaSnip" }                                    -- Snippet engine
--------------------------------------------------------------------------------------------------------------------------------------
  -- [[ Themes ]]

  use { "morhetz/gruvbox" }                                     -- Colorscheme - Gruvbox
  use { "Mofiqul/dracula.nvim" }                                -- Colorscheme - Dracula (Lua port)
  use { "tanvirtin/monokai.nvim" }                              -- Colorscheme - Monokai
  use { "tomasr/molokai" }                                      -- Colorscheme - Molokai
  use { "TroyFletcher/vim-colors-synthwave" }                   -- Colorscheme - Synthwave
--------------------------------------------------------------------------------------------------------------------------------------
  -- [[ Editing ]]

  use { "github/copilot.vim" }                                  -- AI generated autocompletion suggestions
  use { "tpope/vim-surround" }                                  -- Vim nouns, motions, and verbs for changing surrounding characters
  use { "tpope/vim-repeat" }                                    -- Allow `.` to repeat actions performed by plugins
  use { "phaazon/hop.nvim" }                                    -- Quickly navigate using small subsets of characters
  use { "windwp/nvim-autopairs" }                               -- Auto-pairing of characters

  -- [[ Markdown ]]
  use({
    "iamcco/markdown-preview.nvim",                             -- Preview markdown files in a browser tab
      run = function() vim.fn["mkdp#util#install"]() end,
  })
end)

