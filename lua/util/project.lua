local uv = vim.loop
local M = {}

function M.is_node()
	local bufname = vim.api.nvim_buf_get_name(0)
	local root = vim.fs.dirname(
		vim.fs.find({ "package.json", "deno.json", "deno.jsonc", ".git" }, { upward = true, path = bufname })[1]
			or bufname
	)

	local function exists(name)
		return uv.fs_stat(root .. "/" .. name) ~= nil
	end

	return exists("package.json") and not exists("deno.json") and not exists("deno.jsonc")
end

function M.has_biome()
	local bufname = vim.api.nvim_buf_get_name(0)
	local found_files = vim.fs.find(
		{ "biome.json", "biome.jsonc", "deno.json", "deno.jsonc", ".git" },
		{ upward = true, path = bufname }
	)

	local root = found_files[1] and vim.fs.dirname(found_files[1]) or vim.fs.dirname(bufname)

	local function exists(name)
		local stat = uv.fs_stat(root .. "/" .. name)
		return stat ~= nil
	end

	return exists("biome.json") or exists("biome.jsonc")
end

return M
