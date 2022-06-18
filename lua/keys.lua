-- [[ keys.lua ]]

local map = vim.api.nvim_set_keymap

-- [[ Config ]]
map("n", "<leader>rr", ":source ~/.config/nvim/init.lua<CR>", {}) -- Reload config

-- [[ Search ]]
map("n", "<leader>/", ":nohlsearch<CR>", { silent = true, noremap = true }) -- Clear the current search

-- [[ Pane Movements ]]
map("n", "<C-h>", "<C-w>h", {}) -- Move one pane left
map("n", "<C-j>", "<C-w>j", {}) -- Move one pane down
map("n", "<C-k>", "<C-w>k", {}) -- Move one pane up
map("n", "<C-l>", "<C-w>l", {}) -- Move one pane right

-- [[ LSP ]]
map("n", "<space>e", ":lua vim.diagnostic.open_float()<CR>", {})  -- Open floating diagnostic window
map("n", "gd", ":lua vim.lsp.buf.definition()<CR>", {})           -- Go to definition
map("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", {})          -- Go to declaration
map("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", {})       -- ??
map("n", "gw", ":lua vim.lsp.buf.document_symbol()<CR>", {})      -- ??
map("n", "gW", ":lua vim.lsp.buf.workspace_symbol()<CR>", {})     -- ??
map("n", "gr", ":lua vim.lsp.buf.references()<CR>", {})           -- Find references
map("n", "gt", ":lua vim.lsp.buf.type_definition()<CR>", {})      -- View type definition
map("n", "K", ":lua vim.lsp.buf.hover()<CR>", {})                 -- Open hover
-- map("n", "<c-k>", ":lua vim.lsp.buf.signature_help()<CR>", {}) -- View signature
map("n", "<leader>af", ":lua vim.lsp.buf.code_action()<CR>", {})  -- Perform code action
map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", {})       -- Refactor symbol name

-- [[ Telescope ]]
map("n", "<leader>t", ":lua require'telescope.builtin'.find_files()<CR>", {}) -- Fuzzy find files
map("n", "<leader>fs", ":lua require'telescope.builtin'.live_grep()<CR>", {}) -- Fuzzy find grep
map("n", "<leader>fh", ":lua require'telescope.builtin'.help_tags()<CR>", {}) -- Fuzzy find help tags
map("n", "<leader>fb", ":lua require'telescope.builtin'.buffers()<CR>", {})   -- Fuzzy find buffers

-- [[ Copilot ]]
vim.cmd("imap <silent><script><expr> <C-space> copilot#Accept('<CR>')") -- Accept GitHub Copilot suggestion
vim.cmd("let g:copilot_no_tab_map = v:true")                            -- Don't map Copilot to <Tab>
vim.cmd("let g:copilot_assume_mapped = v:true")                         -- Assume that Copilot is mapped (and that nothing else is mapped to <Tab>)
