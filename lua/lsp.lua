-- [[ lsp.lua ]]

local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- [[ Typescript ]]
-- Run `npm install -g typescript typescript-language-server`
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

-- [[ Eslint ]]
-- Run `npm i -g vscode-langservers-extracted`
lspconfig.eslint.setup{}

-- [[ Ruby ]]
-- Run `gem install --user-install solargraph`
lspconfig.solargraph.setup{
  capabilities = capabilities
}

-- [[ Lua ]]
-- Run `brew install lua-language-server`
lspconfig.sumneko_lua.setup{
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
    }
  }
}

-- [[ Additional Configuration ]]
-- Configure diagnostic window
vim.diagnostic.config({
  underline = true,
  virtual_text = true,
  signs = true,
  update_in_insert = true,
})

