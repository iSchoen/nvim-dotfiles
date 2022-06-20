-- [[ keybindings.builtin.lua ]]

local map = vim.api.nvim_set_keymap

-- [[ Config ]]

map("n", "<leader>rr", ":source ~/.config/nvim/init.lua<CR>", {})             -- Reload config
--------------------------------------------------------------------------------------------------------------------------------------
-- [[ Pane Movements ]]

map("n", "<C-h>", "<C-w>h", {})                                               -- Move one pane left
map("n", "<C-j>", "<C-w>j", {})                                               -- Move one pane down
map("n", "<C-k>", "<C-w>k", {})                                               -- Move one pane up
map("n", "<C-l>", "<C-w>l", {})                                               -- Move one pane right
--------------------------------------------------------------------------------------------------------------------------------------
-- [[ Search ]]

map("n", "<leader>/", ":nohlsearch<CR>", { silent = true, noremap = true })   -- Clear the current search
--------------------------------------------------------------------------------------------------------------------------------------
-- [[ LSP ]]

map("n", "gd", ":lua vim.lsp.buf.definition()<CR>", {})                       -- Go to definition
map("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", {})                      -- Go to declaration
map("n", "gt", ":lua vim.lsp.buf.type_definition()<CR>", {})                  -- Go to type definition
map("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", {})                   -- List all the implementations for the symbol under the cursor in the quickfix window.
map("n", "gw", ":lua vim.lsp.buf.document_symbol()<CR>", {})                  -- List all symbols in the current buffer in the quickfix window.
map("n", "gW", ":lua vim.lsp.buf.workspace_symbol()<CR>", {})                 -- List all symbols in the current workspace in the quickfix window.
map("n", "gr", ":lua vim.lsp.buf.references()<CR>", {})                       -- List all the references to the symbol under the cursor in the quickfix window.
map("n", "L", ":lua vim.diagnostic.open_float()<CR>", {})                     -- Open floating diagnostic window
map("n", "K", ":lua vim.lsp.buf.hover()<CR>", {})                             -- Display hover information about the symbol under the cursor in a floating window.
-- map("n", "<c-k>", ":lua vim.lsp.buf.signature_help()<CR>", {})             -- Display signature information about the symbol under the cursor in a floating window.
map("n", "<leader>af", ":lua vim.lsp.buf.code_action()<CR>", {})              -- Select a code action available at the current cursor position.
map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", {})                   -- Refactor symbol name
