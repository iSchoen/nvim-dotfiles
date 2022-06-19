-- [[ pluginConfig.nvimcmp.lua ]]

local cmp = require("cmp")
local compare = require("cmp.config.compare")
local lspkind = require("lspkind")

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  completion = {
    completeopt = "menu,menuone,noinsert"
  },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = {
      border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"},
      winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
      scrollbar = "║",
    }
  },

  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text",
      maxwidth = 50,
    })
  },

  mapping = cmp.mapping.preset.insert({
    ["<C-j>"] = cmp.mapping.scroll_docs(-4),
    ["<C-k>"] = cmp.mapping.scroll_docs(4),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { "i", "c" }),
    ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { "i", "c" }),
  }),

  sorting = {
    priority_weight = 2,
    comparators = {
      compare.offset,
      compare.exact,
      compare.score,
      compare.recently_used,
      compare.kind,
      compare.sort_text,
      compare.length,
      compare.order,
    },
  },

  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "buffer" },
    { name = "path" }
  }
})

cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
  completion = {
    completeopt = "menu,menuone,noselect"
  },
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" }
  }, {
    { name = "cmdline" }
  }),
  completion = {
    completeopt = "menu,menuone,noselect"
  },
})
