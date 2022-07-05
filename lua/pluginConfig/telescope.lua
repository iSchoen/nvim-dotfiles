-- [[ pluginConfig.telescope.lua ]]
-- Run `brew install ripgrep`

local telescope = require("telescope")

telescope.setup({
  defaults = {
    file_ignore_patterns = {"node_modules"}
  }
})

telescope.load_extension("fzf")
