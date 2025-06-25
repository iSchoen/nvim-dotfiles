-- Save a buffer when a file is created
vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "*",
	command = ":write",
})

-- Highlight on yank (See `:help vim.highlight.on_yank()`)
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", {
	clear = true,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- show cursor line only in active window
local cursorGrp = vim.api.nvim_create_augroup("CursorLine", { clear = true })
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
	pattern = "*",
	command = "set cursorline",
	group = cursorGrp,
})

vim.api.nvim_create_autocmd(
	{ "InsertEnter", "WinLeave" },
	{ pattern = "*", command = "set nocursorline", group = cursorGrp }
)

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),

	callback = function(event)
		local bufnr = event.buf

		-- Add this back in when it works a little better

		-- local client = vim.lsp.get_client_by_id(event.data.client_id)

		-- if client:supports_method('textDocument/completion') then
		-- 	local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
		-- 	client.server_capabilities.completionProvider.triggerCharacters = chars
		-- 	vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
		-- end

		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "[R]e[n]ame" })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "[C]ode [A]ction" })
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "[G]oto [D]efinition" })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover Documentation" })
		vim.keymap.set("n", "L", vim.diagnostic.open_float, { buffer = bufnr, desc = "Show Diagnostic Error" })
	end,
})

-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "qf",
-- 	callback = function()
-- 		vim.cmd("wincmd J") -- Move quickfix window to the bottom
-- 		vim.cmd("wincmd =") -- Equalize window sizes
-- 		vim.schedule(function()
-- 			vim.cmd("wincmd o") -- close all others *after* event loop settles
-- 		end)
-- 	end,
-- })

vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*Quickfix*",
	callback = function()
		vim.opt_local.winfixheight = false -- equivalent to :setlocal nowinfixheight
		vim.cmd("resize 80") -- set quickfix window height to 20
	end,
})
