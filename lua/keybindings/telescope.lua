-- [[ keybindings.telescope.lua ]]

local map = vim.api.nvim_set_keymap

map("n", "<leader>t", ":lua require'telescope.builtin'.find_files()<CR>", {}) -- Fuzzy find files
map("n", "<leader>fs", ":lua require'telescope.builtin'.live_grep()<CR>", {}) -- Fuzzy find grep
map("n", "<leader>fh", ":lua require'telescope.builtin'.help_tags()<CR>", {}) -- Fuzzy find help tags
map("n", "<leader>fb", ":lua require'telescope.builtin'.buffers()<CR>", {})   -- Fuzzy find buffers
