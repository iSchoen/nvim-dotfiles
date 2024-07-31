-- [[ plugins.nvimtree.setup.lua ]]

require("nvim-tree").setup({
  view = {
    adaptive_size = true,
    side = "right",
    relativenumber = true
  },
  filters = {
    dotfiles = false
  },
  git = {
    ignore = false
  }
})
