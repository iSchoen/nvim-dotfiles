-- [[ languageServers.eslint.lua ]]
-- Run `npm i -g vscode-langservers-extracted`

local lspconfig = require("lspconfig")

lspconfig.eslint.setup({})

