-- [[ plugins.vim-sleuth.keymap.lua ]]

-- Define a function to correct indentation settings
local function correct_indentation()
	vim.bo.tabstop = 2
	vim.bo.shiftwidth = 2
	vim.bo.expandtab = false
end

vim.api.nvim_create_user_command("CorrectIndent", correct_indentation, {})

vim.api.nvim_set_keymap("n", "<leader>ci", ":CorrectIndent<CR>", { noremap = true, silent = true })
