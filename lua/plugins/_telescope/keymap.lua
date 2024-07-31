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
  desc = "Search Files"
})
vim.keymap.set("n", "<leader>h", require("telescope.builtin").help_tags, {
  desc = "Search Help"
})
vim.keymap.set("n", "<leader>w", require("telescope.builtin").grep_string, {
  desc = "Search current Word"
})
vim.keymap.set("n", "<leader>gs", require("telescope.builtin").live_grep, {
  desc = "Search by Grep"
})
vim.keymap.set("n", "<leader>d", require("telescope.builtin").diagnostics, {
  desc = "Search Diagnostics"
})
