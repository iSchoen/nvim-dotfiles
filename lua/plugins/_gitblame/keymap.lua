-- [[ plugins.gitblame.keymap.lua ]]

local map = vim.api.nvim_set_keymap

map("n", "<leader>gbo", ":GitBlameOpenCommitURL<CR>", {}) -- Open commit url
map("n", "<leader>gbt", ":GitBlameToggle<CR>", {}) -- Toggle Git blame
