-- [[ colorscheme.lua ]]

-- [[ Chosen Colorscheme ]]
local colorscheme = "gruvbox"
-- local colorscheme = "synthwave"

-- [[ Messaging ]]
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

