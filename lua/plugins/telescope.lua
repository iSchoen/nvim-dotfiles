local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local function set_search_register_from_prompt(prompt_bufnr)
	local prompt = action_state.get_current_line()
	if prompt and #prompt > 0 then
		vim.fn.setreg("/", prompt)
		vim.opt.hlsearch = true
	end
end

-- Override quickfix open action
local function custom_qf_open(prompt_bufnr)
	set_search_register_from_prompt(prompt_bufnr)
	actions.smart_send_to_qflist(prompt_bufnr)
	actions.open_qflist(prompt_bufnr)
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		require("telescope").setup({
			defaults = {
				border = false,
				mappings = {
					i = {
						["<C-q>"] = custom_qf_open,
					},
				},
			},
		})

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>t", builtin.find_files, {})
		vim.keymap.set("n", "<leader>gs", builtin.live_grep, {})
	end,
}
