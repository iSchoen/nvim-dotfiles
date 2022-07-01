-- [[ keybindings.barbar.lua ]]

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- WIP
-- Move to previous/next
map("n", "<leader>[", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<leader>]", "<Cmd>BufferNext<CR>", opts)
