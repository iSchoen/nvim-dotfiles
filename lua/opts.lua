-- [[ opts.lua ]]

local opt = vim.opt

-- [[ Context ]]
opt.number = true                                    -- bool:      Show line numbers
opt.relativenumber = true                            -- bool:      Show relative line numbers
opt.scrolloff = 4                                    -- int:       Min num lines of context
opt.signcolumn = "yes"                               -- str:       Show the sign column
--------------------------------------------------------------------------------------------------------------------------------------
-- [[ Filetypes ]]

opt.encoding = "utf8"                                -- str:       String encoding to use
opt.fileencoding = "utf8"                            -- str:       File encoding to use
--------------------------------------------------------------------------------------------------------------------------------------
-- [[ Visual / Theme ]]

opt.background = "dark"
opt.termguicolors = true                             -- bool:      If term supports ui color then enable
--------------------------------------------------------------------------------------------------------------------------------------
-- [[ Search ]]

opt.ignorecase = true                                -- bool:      Ignore case in search patterns
opt.smartcase = true                                 -- bool:      Override ignorecase if search contains capitals
opt.incsearch = true                                 -- bool:      Use incremental search
opt.hlsearch = true                                  -- bool:      Highlight search matches
--------------------------------------------------------------------------------------------------------------------------------------
-- [[ Whitespace ]]

opt.expandtab = true                                 -- bool:      Use spaces instead of tabs
opt.shiftwidth = 2                                   -- num:       Size of an indent
opt.softtabstop = 2                                  -- num:       Number of spaces tabs count for in insert mode
opt.tabstop = 2                                      -- num:       Number of spaces tabs count for
opt.wrap = false                                     -- bool:      Toggle wrapping of text (for display only)
--------------------------------------------------------------------------------------------------------------------------------------
-- [[ Splits ]]

opt.splitright = true                                -- bool:      Place new window to right of current one
opt.splitbelow = true                                -- bool:      Place new window below the current one
--------------------------------------------------------------------------------------------------------------------------------------
-- [[ External ]]

opt.clipboard = "unnamedplus"                        -- RTFM:      Always use the clipboard for ALL operations
--------------------------------------------------------------------------------------------------------------------------------------
-- [[ Editing ]]

opt.undofile = true                                  -- bool:      Use an undo file for persistent undo
opt.undodir = vim.fn.stdpath("config") .. "/undodir" -- FilePath:  Set directory for persistent undo file
opt.completeopt = "menu,menuone,noinsert"            -- RTFM:      Customize insert mode completion
opt.autoindent = true                                -- bool:      Copy indent from current line when starting a new line
opt.smartindent = true                               -- bool:      Perform smart autoindenting when starting a new line
--------------------------------------------------------------------------------------------------------------------------------------
-- [[ Vim commands ]]

-- Auto Commands
vim.cmd("autocmd BufNewFile * :write")                                              -- Save a buffer when a file is created
vim.cmd("autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.scss,*.sass :Prettier")  -- Format using Prettier on save

-- Additional Config
vim.cmd("let g:netrw_banner = 0")                                                   -- Remove netrw banner
vim.cmd("set updatetime=100")                                                       -- Set update time to 100ms
