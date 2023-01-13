-- [[ plugins.telescope.keymap.lua ]]

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, {
    desc = "[ ] Find existing buffers"
})
vim.keymap.set("n", "<leader>s", function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
        winblend = 10,
        previewer = false
    })
end, {
    desc = "[/] Fuzzily search in current buffer]"
})

vim.keymap.set("n", "<leader>t", require("telescope.builtin").find_files, {
    desc = "[S]earch [F]iles"
})
vim.keymap.set("n", "<leader>h", require("telescope.builtin").help_tags, {
    desc = "[S]earch [H]elp"
})
vim.keymap.set("n", "<leader>w", require("telescope.builtin").grep_string, {
    desc = "[S]earch current [W]ord"
})
vim.keymap.set("n", "<leader>g", require("telescope.builtin").live_grep, {
    desc = "[S]earch by [G]rep"
})
vim.keymap.set("n", "<leader>d", require("telescope.builtin").diagnostics, {
    desc = "[S]earch [D]iagnostics"
})
