-- [[ languageServers.additionalConfig.lua ]]

-- Configure diagnostic window
vim.diagnostic.config({
  underline = true,
  virtual_text = false,
  signs = true,
  update_in_insert = true,
  severity_sort = true,
  float = {
    scope = "cursor",
    source = true,
  },
})

