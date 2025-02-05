-- [[ plugins.diffview.setup.lua ]]

require("diffview").setup({
	diff_binaries = false,
	view = {
		merge_tool = {
			layout = "diff3_mixed",
			winbar_info = true,
		},
	}
})
