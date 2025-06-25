return {
	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = false
	end,

  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescript.tsx",
    "typescriptreact",
  },
}
