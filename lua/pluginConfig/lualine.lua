-- [[ pluginConfig.lualine.lua ]]

local lsp_progress_colors = {
  yellow = "#ECBE7B",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#98be65",
  orange = "#FF8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  blue = "#51afef",
  red = "#ec5f67"
}

local lsp_progress = {
	"lsp_progress",
	colors = {
	  percentage  = lsp_progress_colors.cyan,
	  title  = lsp_progress_colors.cyan,
	  message  = lsp_progress_colors.cyan,
	  spinner = lsp_progress_colors.cyan,
	  lsp_client_name = lsp_progress_colors.magenta,
	  use = true,
	},
	separators = {
		component = " ",
		progress = " | ",
		percentage = { pre = "", post = "%% " },
		title = { pre = "", post = ": " },
		lsp_client_name = { pre = "[", post = "]" },
		spinner = { pre = "", post = "" },
		message = { pre = "(", post = ")", commenced = "In Progress", completed = "Completed" },
	},
	display_components = { "lsp_client_name", "spinner", { "title", "percentage", "message" } },
	timer = { progress_enddelay = 500, spinner = 100, lsp_client_name_enddelay = 1000 },
	spinner_symbols = { "🌑 ", "🌒 ", "🌓 ", "🌔 ", "🌕 ", "🌖 ", "🌗 ", "🌘 " },
}

local config = {
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = ""},
    section_separators = { left = "", right = ""},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },

  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch", "diff", "diagnostics"},
    lualine_c = {"filename", lsp_progress},
    lualine_x = {"encoding", "fileformat", "filetype"},
    lualine_y = {"progress"},
    lualine_z = {"location"}
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {"filename"},
    lualine_x = {"location"},
    lualine_y = {},
    lualine_z = {}
  },

  tabline = {},

  extensions = {}
}

require("lualine").setup(config)

