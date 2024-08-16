-- [[ plugins.lualine.setup.lua ]]

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end

-- See `:help lualine.txt`
require("lualine").setup({
  options = {
    icons_enabled = false,
    theme = "gruvbox",
    component_separators = "|",
    section_separators = ""
  },
  sections = {
    lualine_b = { {'diff', source = diff_source}, },
  }
})
