-- [[ plugins.copilot.keymap.lua ]]

vim.cmd("imap <silent><script><expr> <C-y> copilot#Accept('<CR>')") -- Accept GitHub Copilot suggestion
vim.cmd("let g:copilot_no_tab_map = v:true")                            -- Don't map Copilot to <Tab>
vim.cmd("let g:copilot_assume_mapped = v:true")                         -- Assume that Copilot is mapped (and that nothing else is mapped to <Tab>)
