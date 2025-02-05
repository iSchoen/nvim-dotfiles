-- [[ plugins.copilot.keymap.lua ]]

vim.cmd("imap <silent><script><expr> <C-y> copilot#Accept('<CR>')") -- Accept GitHub Copilot suggestion
