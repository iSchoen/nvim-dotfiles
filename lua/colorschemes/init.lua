-- [[ colorschemes.init.lua ]]

-- [[ Chosen Colorscheme ]]
local colorscheme = "gruvbox"
-- local colorscheme = "dracula"
-- local colorscheme = "molokai"
-- local colorscheme = "synthwave"

-- [[ Attempt to load colorscheme ]]
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

