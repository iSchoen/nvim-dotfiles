-- Pane movements
vim.keymap.set("n", "<C-h>", "<C-w>h", {})
vim.keymap.set("n", "<C-j>", "<C-w>j", {})
vim.keymap.set("n", "<C-k>", "<C-w>k", {})
vim.keymap.set("n", "<C-l>", "<C-w>l", {})

vim.keymap.set("n", "<leader>/", ":nohlsearch<CR>", { silent = true, noremap = true })

vim.keymap.set("n", "<C-n>", ":cnext<CR>", {})
vim.keymap.set("n", "<C-p>", ":cprevious<CR>", {})
