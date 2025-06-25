vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Use spaces instead of tabs
vim.o.expandtab = false
-- Number of spaces tabs count for
vim.o.tabstop = 2
-- Number of spaces tabs count for in insert mode
vim.o.softtabstop = 2
-- Size of an indent
vim.o.shiftwidth = 2
-- Enable auto-indent
vim.o.autoindent = true
-- Toggle wrapping of text (for display only)
vim.o.wrap = false

-- Show line numbers
vim.o.number = true
-- Show relative line numbers
vim.o.relativenumber = true

-- String encoding to use
vim.o.encoding = "utf8"
-- File encoding to use
vim.o.fileencoding = "utf8"

vim.g.have_nerd_font = true

vim.o.showmode = false

-- Place new window to right of current one
vim.o.splitright = true
-- Place new window below the current one
vim.o.splitbelow = true

-- Ignore case in search patterns
vim.o.ignorecase = true
-- Override ignorecase if search contains capitals
vim.o.smartcase = true
-- Use incremental search
vim.o.incsearch = true
-- Highlight search matches
vim.o.hlsearch = true

-- Min num lines of context
vim.o.scrolloff = 4
-- Show the sign column
vim.o.signcolumn = "yes"
vim.o.background = "dark"
-- If term supports ui color then enable
vim.o.termguicolors = true
-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- Enable break indent
vim.o.breakindent = true

vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

vim.o.confirm = false

-- Enable mouse mode
vim.o.mouse = "a"
-- Use an undo file for persistent undo
vim.o.undofile = true
-- Directory to put swap files
vim.o.dir = vim.fn.stdpath("config") .. "/tmp"
-- Directory to put backup files
vim.o.backupdir = vim.fn.stdpath("config") .. "/tmp"
-- Set directory for persistent undo file
vim.o.undodir = vim.fn.stdpath("config") .. "/undodir"
-- Customize insert mode completion
vim.o.completeopt = "menu,menuone,noinsert"
-- Set the time of inactivity before a swap file is written to disk
vim.o.updatetime = 250
vim.o.timeoutlen = 1000
-- Languages to use for fenced code blocks
vim.g.markdown_fenced_languages = { "ts=typescript" }
-- Show whitespace characters
vim.o.list = true
-- Set the characters to use for whitespace
vim.opt.listchars = { tab = "  │", trail = "·", extends = "…", precedes = "…" }

vim.o.winborder = "rounded"

vim.opt.shortmess:append("c")
