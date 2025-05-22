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

  single_file_support = false,

  filetypes = {
    "javascript",
    "javascriptreact",
    "json",
    "jsonc",
    "typescript",
    "typescript.tsx",
    "typescriptreact",
    "astro",
    "svelte",
    "vue",
    "css",
  },

  root_dir = lspconfig.util.root_pattern("biome.json", "biome.jsonc"),
}
