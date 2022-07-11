-- [[ keybindings.nvimtree.lua ]]


local map = vim.api.nvim_set_keymap

map("n", "<leader>nn", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
map("n", "<leader>nf", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })

