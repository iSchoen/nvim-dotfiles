-- [[ plugins.mason.setup.lua ]]

--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(client, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, {
			buffer = bufnr,
			desc = desc,
		})
	end

	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
	nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("L", vim.diagnostic.open_float, "Show Diagnostic Error")

	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
	nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
	nmap("<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "[W]orkspace [L]ist Folders")

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, {
		desc = "Format current buffer with LSP",
	})
end

local lspconfig = require("lspconfig")

local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}

	vim.lsp.buf.execute_command(params)
end

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("mason").setup()

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
	ensure_installed = {
		"biome",
		"clangd",
		"denols",
		"elixirls",
		"eslint",
		"jsonls",
		"lua_ls",
		"pyright",
		"ruby_lsp",
		"rust_analyzer",
		"ts_ls"
	}
})

mason_lspconfig.setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end,

	["biome"] = function()
		lspconfig.biome.setup({
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)

				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					command = "lua vim.lsp.buf.format()",
				})
			end,
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
			single_file_support = false,
		})
	end,

	["eslint"] = function()
		lspconfig.eslint.setup({
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
		})
	end,

	["lua_ls"] = function()
		lspconfig.lua_ls.setup({
			on_attach,
			on_init = function(client)
				local path = client.workspace_folders[1].name
				if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
					return
				end

				client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
					runtime = {
						version = 'LuaJIT'
					},
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME
						}
					}
				})
			end,
			settings = {
				Lua = {}
			}
		})
	end,

	["denols"] = function()
		lspconfig.denols.setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)

				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					command = "lua vim.lsp.buf.format()",
				})
			end,
			root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
			commands = {},
		})
	end,

	["ts_ls"] = function()
		lspconfig.ts_ls.setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)

				client.server_capabilities.documentFormattingProvider = false
			end,
			root_dir = lspconfig.util.root_pattern("package.json"),
			single_file_support = false,
			commands = {
				OR = {
					organize_imports,

					description = "Organize Imports",
				},
			},
		})
	end,

	["ruby_lsp"] = function()
		lspconfig.ruby_lsp.setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)

				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					command = "lua vim.lsp.buf.format()",
				})
			end,
		})
	end,

	["jsonls"] = function()
		lspconfig.jsonls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
					validate = { enable = true },
				},
			},
		})
	end,
})

vim.diagnostic.config({
	underline = true,
	virtual_text = false,
	virtual_lines = false,
	signs = true,
	update_in_insert = true,
	severity_sort = true,
	float = {
		scope = "cursor",
		source = true,
	},
})
