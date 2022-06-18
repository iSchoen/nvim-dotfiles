-- [[ keys.lua ]]

local map = vim.api.nvim_set_keymap

-- [[ Config ]]

map("n", "<leader>rr", ":source ~/.config/nvim/init.lua<CR>", {})             -- Reload config
--------------------------------------------------------------------------------------------------------------------------------------
-- [[ Search ]]

map("n", "<leader>/", ":nohlsearch<CR>", { silent = true, noremap = true })   -- Clear the current search
--------------------------------------------------------------------------------------------------------------------------------------
-- [[ Pane Movements ]]

map("n", "<C-h>", "<C-w>h", {})                                               -- Move one pane left
map("n", "<C-j>", "<C-w>j", {})                                               -- Move one pane down
map("n", "<C-k>", "<C-w>k", {})                                               -- Move one pane up
map("n", "<C-l>", "<C-w>l", {})                                               -- Move one pane right
--------------------------------------------------------------------------------------------------------------------------------------
-- [[ LSP ]]

map("n", "<space>e", ":lua vim.diagnostic.open_float()<CR>", {})              -- Open floating diagnostic window
map("n", "gd", ":lua vim.lsp.buf.definition()<CR>", {})                       -- Go to definition
map("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", {})                      -- Go to declaration
map("n", "gt", ":lua vim.lsp.buf.type_definition()<CR>", {})                  -- Go to type definition
map("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", {})                   -- List all the implementations for the symbol under the cursor in the quickfix window.
map("n", "gw", ":lua vim.lsp.buf.document_symbol()<CR>", {})                  -- List all symbols in the current buffer in the quickfix window.
map("n", "gW", ":lua vim.lsp.buf.workspace_symbol()<CR>", {})                 -- List all symbols in the current workspace in the quickfix window.
map("n", "gr", ":lua vim.lsp.buf.references()<CR>", {})                       -- List all the references to the symbol under the cursor in the quickfix window.
map("n", "K", ":lua vim.lsp.buf.hover()<CR>", {})                             -- Display hover information about the symbol under the cursor in a floating window.
-- map("n", "<c-k>", ":lua vim.lsp.buf.signature_help()<CR>", {})             -- Display signature information about the symbol under the cursor in a floating window.
map("n", "<leader>af", ":lua vim.lsp.buf.code_action()<CR>", {})              -- Select a code action available at the current cursor position.
map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", {})                   -- Refactor symbol name
--------------------------------------------------------------------------------------------------------------------------------------
-- [[ Telescope ]]

map("n", "<leader>t", ":lua require'telescope.builtin'.find_files()<CR>", {}) -- Fuzzy find files
map("n", "<leader>fs", ":lua require'telescope.builtin'.live_grep()<CR>", {}) -- Fuzzy find grep
map("n", "<leader>fh", ":lua require'telescope.builtin'.help_tags()<CR>", {}) -- Fuzzy find help tags
map("n", "<leader>fb", ":lua require'telescope.builtin'.buffers()<CR>", {})   -- Fuzzy find buffers
--------------------------------------------------------------------------------------------------------------------------------------
-- [[ Copilot ]] -- Remove??

vim.cmd("imap <silent><script><expr> <C-space> copilot#Accept('<CR>')")       -- Accept GitHub Copilot suggestion
vim.cmd("let g:copilot_no_tab_map = v:true")                                  -- Don't map Copilot to <Tab>
vim.cmd("let g:copilot_assume_mapped = v:true")                               -- Assume that Copilot is mapped (and that nothing else is mapped to <Tab>)
