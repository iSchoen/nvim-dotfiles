-- [[ languageServers.ruby.lua ]]
-- Run `gem install --user-install solargraph`

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.solargraph.setup({
  capabilities = capabilities
})

