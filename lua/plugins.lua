-- [[ plug.lua ]]

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

  -- [[ LSP ]]
  use { "neovim/nvim-lspconfig" }                               -- LSP defaults
  use { "anott03/nvim-lspinstall" }                             -- Language Server Installer

  -- [[ Auto-completion ]]
  use { "saadparwaiz1/cmp_luasnip" }                            -- Generates completion source from LuaSnip
  use { "hrsh7th/cmp-nvim-lsp" }                                -- Generates completion source from LSP
  use { "hrsh7th/cmp-buffer" }                                  -- Generates completion source from buffer
  use { "hrsh7th/cmp-path" }                                    -- Generates completion source from path
  use { "hrsh7th/cmp-cmdline" }                                 -- Generates completion source from command line
  use { "hrsh7th/nvim-cmp" }                                    -- Consumes all completion sources and provides suggestions
  use { "nvim-lua/completion-nvim" }                            -- Provides autocompletion functionality for nvim
  use { "onsails/lspkind.nvim" }                                -- Provides pictograms to NeoVim LSP suggestions

  -- [[ Fuzzy Finding ]]
  use { "nvim-lua/plenary.nvim" }                               -- Useful functions using the NeoVim API
  use { "nvim-lua/popup.nvim" }                                 -- Implementation of the Vim popup API in NeoVim
  use { "nvim-lua/telescope.nvim" }                             -- Extendable fuzzy finder over lists
  use { "jremmen/vim-ripgrep" }                                 -- BLAZINGLY fast line-oriented search tool

  -- [[ Git ]]
  use { "airblade/vim-gitgutter" }                              -- Display git diffs in the gutter
  use { "f-person/git-blame.nvim" }                             -- Display Git blame information

  -- [[ UI ]]
  use {
    "nvim-lualine/lualine.nvim",                                -- Display useful information in status line
    requires = { "kyazdani42/nvim-web-devicons", opt = true }
  }
  use { "stevearc/dressing.nvim" }                              -- Improve UI using the built-in core UI hooks `vim.ui.select` and `vim.ui.input`
  use {
    "goolord/alpha-nvim",                                       -- Customize Neovim startup screen
    requires = { "kyazdani42/nvim-web-devicons" },
--    config = function ()
--        require("alpha").setup(require("alpha.themes.startify").config)
--    end
  }

  -- [[ Treesitter ]]
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }  -- Parser generator tool and an incremental parsing library

  -- [[ Formatting ]]
  use { "prettier/vim-prettier", run = "yarn install" }         -- Formatter for JavaScript, TypeScript, HTML, CSS, JSON, YAML, Markdown, GraphQL, etc.

  -- [[ Snippets ]]
  use { "L3MON4D3/LuaSnip" }                                    -- Snippet engine

  -- [[ Themes ]]
  use { "TroyFletcher/vim-colors-synthwave" }                   -- Colorscheme - Synthwave

  -- [[ Editing ]]
  use { "tpope/vim-surround" }                                  -- Vim nouns, motions, and verbs for changing surrounding characters
  use { "tpope/vim-repeat" }                                    -- Allow `.` to repeat actions performed by plugins
end)

