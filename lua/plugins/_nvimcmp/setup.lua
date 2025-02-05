-- [[ plugins.nvimcmp.setup.lua ]]

local cmp = require("cmp")
local luasnip = require("luasnip")

-- Customization for Pmenu
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#282C34", fg = "NONE" })
vim.api.nvim_set_hl(0, "Pmenu", { fg = "#C5CDD9", bg = "#22252A" })

vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = true })

vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#000000", bg = "#FF8C00" })
vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#000000", bg = "#FF8C00" })
vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#000000", bg = "#FF8C00" })

vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#000000", bg = "#FF8C00" })
vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#000000", bg = "#FF8C00" })
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#000000", bg = "#FF8C00" })

vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#000000", bg = "#FF8C00" })
vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#000000", bg = "#FF8C00" })
vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#000000", bg = "#FF8C00" })

vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#000000", bg = "#FF8C00" })
vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#000000", bg = "#FF8C00" })
vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#000000", bg = "#FF8C00" })
vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#000000", bg = "#FF8C00" })
vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#000000", bg = "#FF8C00" })

vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#000000", bg = "#FF8C00" })
vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#000000", bg = "#FF8C00" })

vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#000000", bg = "#FF8C00" })
vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#000000", bg = "#FF8C00" })
vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#000000", bg = "#FF8C00" })

vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#000000", bg = "#FF8C00" })
vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#000000", bg = "#FF8C00" })
vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#000000", bg = "#FF8C00" })

vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#000000", bg = "#FF8C00" })
vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#000000", bg = "#FF8C00" })
vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#000000", bg = "#FF8C00" })

local WIN_HIGHLIGHT = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:CursorLine,Search:Search"

local SYMBOL_MAP = {
	Text = "  ",
	Method = "  ",
	Function = "  ",
	Constructor = "  ",
	Field = "  ",
	Variable = "  ",
	Class = "  ",
	Interface = "  ",
	Module = "  ",
	Property = "  ",
	Unit = "  ",
	Value = "  ",
	Enum = "  ",
	Keyword = "  ",
	Snippet = "  ",
	Color = "  ",
	File = "  ",
	Reference = "  ",
	Folder = "  ",
	EnumMember = "  ",
	Constant = "  ",
	Struct = "  ",
	Event = "  ",
	Operator = "  ",
	TypeParameter = "  ",
}

local function get_lsp_completion_context(completion, source)
	local ok, source_name = pcall(function()
		return source.source.client.config.name
	end)
	if not ok then
		return nil
	end
	if source_name == "tsserver" then
		return completion.detail
	elseif source_name == "pyright" or source_name == "vtsls" then
		if completion.labelDetails ~= nil then
			return completion.labelDetails.description
		end
	elseif source_name == "gopls" then
		-- And this, for the record, is how I inspect payloads
		-- require("config.shared").logger("completion source: ", completion) -- Lazy-serialization of heavy payloads
		-- require("config.shared").logger("completion detail added to gopls")
		return completion.detail
	end
end

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = { {
		name = "nvim_lsp",
	}, {
		name = "luasnip",
	} },
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = {
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
			col_offset = -3,
			side_padding = 0,
		},
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },

		format = function(entry, vim_item)
			local item_with_kind = require("lspkind").cmp_format({
				mode = "symbol",
				maxwidth = 50,
				symbol_map = SYMBOL_MAP,
			})(entry, vim_item)
			item_with_kind.menu = ""
			local completion_context = get_lsp_completion_context(entry.completion_item, entry.source)
			if completion_context ~= nil and completion_context ~= "" then
				local truncated_context = string.sub(completion_context, 1, 30)
				if truncated_context ~= completion_context then
					truncated_context = truncated_context .. "..."
				end
				item_with_kind.menu = item_with_kind.menu .. " " .. truncated_context
			end
			item_with_kind.menu_hl_group = "CmpItemAbbr"
			return item_with_kind
		end,
	},
})

cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
	completion = {
		completeopt = "menu,menuone,noselect",
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
	completion = {
		completeopt = "menu,menuone,noselect",
	},
})

function Leave_snippet()
	if
		((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
		and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
		and not require("luasnip").session.jump_active
	then
		require("luasnip").unlink_current()
	end
end

-- stop snippets when you leave to normal mode
vim.api.nvim_command([[
    autocmd ModeChanged * lua Leave_snippet()
]])
