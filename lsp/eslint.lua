local lspconfig = require("lspconfig")
local on_attach = require("shared.on_attach")
local capabilities = require("shared.capabilities")

return {
  capabilities = capabilities,

  on_attach,

  root_dir = lspconfig.util.root_pattern(
    "eslint.json",
    ".eslintrc",
    ".eslintrc.js",
    ".eslintrc.json",
    ".eslintrc.yaml",
    ".eslintrc.yml",
    "eslint.config.js",
    "eslint.config.mjs"
  ),
}
