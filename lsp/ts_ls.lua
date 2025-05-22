local lspconfig = require("lspconfig")
local on_attach = require("shared.on_attach")
local capabilities = require("shared.capabilities")

local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}

	vim.lsp.buf.execute_command(params)
end

return {
  capabilities = capabilities,

  on_attach = function(client, bufnr)
    on_attach(client, bufnr)

    client.server_capabilities.documentFormattingProvider = false
  end,

  single_file_support = false,

  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescript.tsx",
    "typescriptreact",
  },

  commands = {
    OR = {
      organize_imports,

      description = "Organize Imports",
    },
  },
}
