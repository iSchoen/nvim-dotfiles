local uv = vim.loop
local M = {}

function M.is_node()
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
	local root = vim.fs.dirname(
		vim.fs.find({ "package.json", "deno.json", "deno.jsonc", ".git" }, { upward = true, path = bufname })[1]
			or bufname
	)

	local function exists(name)
		return uv.fs_stat(root .. "/" .. name) ~= nil
	end

	return exists("biome.json") or exists("biome.jsonc")
end

return M
