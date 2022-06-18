-- [[ languageServers.typescript.lua ]]
-- Run `npm install -g typescript typescript-language-server`

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)},
    title = ""
  }
  vim.lsp.buf.execute_command(params)
end

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  commands = {
    OR = {
      organize_imports,
      description = "Organize Imports"
    }
  }
}

