local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

cmp.setup({
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
    { name = "buffer" },
  }),

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ["<c-p>"] = cmp.mapping.select_prev_item(),
    ["<c-n>"] = cmp.mapping.select_next_item(),
    ["<c-y>"] = cmp.mapping.confirm({ select = true }),
    ["<c-e>"] = cmp.mapping.abort(),
    ["<cr>"] = function(fallback)
      if cmp.visible() and cmp.get_active_entry() then
        cmp.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        })
      else
        fallback()
      end
    end,
  }),

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  formatting = {
    format = lspkind.cmp_format(),
  },
})

cmp.setup.filetype({ "sql" }, {
  sources = {
    { name = "vim-dadbod-completion" },
    { name = "buffer" },
  },
})
