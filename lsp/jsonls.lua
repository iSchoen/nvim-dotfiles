local lspconfig = require("lspconfig")
local on_attach = require("shared.on_attach")
local capabilities = require("shared.capabilities")

return {
  capabilities = capabilities,

  on_attach = on_attach,

  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
}
