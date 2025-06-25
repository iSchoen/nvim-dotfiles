local lspconfig = require("lspconfig")

return {
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
