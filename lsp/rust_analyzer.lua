local lspconfig = require("lspconfig")
local on_attach = require("shared.on_attach")
local capabilities = require("shared.capabilities")

return {
  capabilities = capabilities,

  on_attach = function(client, bufnr)
    on_attach(client, bufnr)

    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "lua vim.lsp.buf.format()",
    })
  end,
}
