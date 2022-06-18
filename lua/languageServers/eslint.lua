-- [[ languageServers.eslint.lua ]]
-- Run `npm i -g vscode-langservers-extracted`

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.eslint.setup{}

