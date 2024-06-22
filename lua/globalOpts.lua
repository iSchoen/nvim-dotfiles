-- [[ globalOpts.lua ]]

--------------------------------------------------------------------------------------------------------------------------------------
-- [[ Context ]]

vim.o.number = true -- bool:      Show line numbers
vim.o.relativenumber = true -- bool:      Show relative line numbers
vim.o.scrolloff = 4 -- int:       Min num lines of context
vim.o.signcolumn = "yes" -- str:       Show the sign column
--------------------------------------------------------------------------------------------------------------------------------------
-- [[ Filetypes ]]

vim.o.encoding = "utf8" -- str:       String encoding to use
vim.o.fileencoding = "utf8" -- str:       File encoding to use
vim.opt.shortmess:append({ A = true }) -- str:			 Don't give the "ATTENTION" prompt when opening a file
--------------------------------------------------------------------------------------------------------------------------------------
-- [[ Visual / Theme ]]

vim.o.background = "dark"
vim.o.termguicolors = true -- bool:      If term supports ui color then enable
vim.g.netrw_banner = 0 -- 0 | 1:     Toggle netrw banner

-- vim.cmd([[colorscheme gruvbox]])
vim.cmd([[colorscheme gruvbox]])
--------------------------------------------------------------------------------------------------------------------------------------
-- [[ Search ]]

vim.o.ignorecase = true -- bool:      Ignore case in search patterns
vim.o.smartcase = true -- bool:      Override ignorecase if search contains capitals
vim.o.incsearch = true -- bool:      Use incremental search
vim.o.hlsearch = true -- bool:      Highlight search matches
--------------------------------------------------------------------------------------------------------------------------------------
-- [[ Whitespace ]]

vim.o.expandtab = true -- bool:      Use spaces instead of tabs
vim.o.shiftwidth = 2 -- num:       Size of an indent
vim.o.softtabstop = 2 -- num:       Number of spaces tabs count for in insert mode
vim.o.tabstop = 2 -- num:       Number of spaces tabs count for
vim.o.wrap = false -- bool:      Toggle wrapping of text (for display only)
vim.o.breakindent = true -- bool:      Enable break indent
--------------------------------------------------------------------------------------------------------------------------------------
-- [[ Splits ]]

vim.o.splitright = true -- bool:      Place new window to right of current one
vim.o.splitbelow = true -- bool:      Place new window below the current one
--------------------------------------------------------------------------------------------------------------------------------------
-- [[ External ]]

vim.o.clipboard = "unnamedplus" -- RTFM:      Always use the clipboard for ALL operations
vim.o.mouse = "a" -- RTFM:      Enable mouse mode

--------------------------------------------------------------------------------------------------------------------------------------
-- [[ Editing ]]

vim.o.undofile = true -- bool:      Use an undo file for persistent undo
vim.o.undodir = vim.fn.stdpath("config") .. "/undodir" -- filePath:  Set directory for persistent undo file
vim.o.completeopt = "menu,menuone,noinsert" -- RTFM:      Customize insert mode completion
vim.o.expandtab = true -- bool:      Use spaces instead of tabs
vim.o.updatetime = 200 -- int:       Set the time of inactivity before a swap file is written to disk
vim.g.markdown_fenced_languages = { "ts=typescript" } -- table:     Languages to use for fenced code blocks
--------------------------------------------------------------------------------------------------------------------------------------
-- [[ Auto Commands ]]

-- Save a buffer when a file is created
vim.api.nvim_create_autocmd(
	"BufNewFile",
	{
		pattern = "*",
		command = ":write"
	}
)

-- Format using Prettier on save
vim.api.nvim_create_autocmd(
	"BufWritePre",
	{
		pattern = "*.js,*.jsx,*.ts,*.tsx,*.css,*.scss,*.sass,*.prisma",
		command = ":Prettier"
	}
)

-- Format elixir files using mix format on save
vim.api.nvim_command("au BufWritePost *.ex,*.exs,*.heex lua vim.lsp.buf.format()")

-- Highlight on yank (See `:help vim.highlight.on_yank()`)
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", {
	clear = true
})
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*"
})
