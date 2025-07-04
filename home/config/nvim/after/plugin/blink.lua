local cmp = require("blink.cmp")

cmp.setup({
  sources = {
    default = {
      "lsp",
      "path",
      "snippets",
      "buffer",
      "dadbod",
    },
    providers = {
      dadbod = {
        name = "Dadbod",
        module = "vim_dadbod_completion.blink",
      },
      cmdline = {
        min_keyword_length = function(ctx)
          if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
            return 3
          end
          return 0
        end,
      },
    },
  },
  signature = {
    enabled = true,
  },
  completion = {
    accept = {
      auto_brackets = {
        enabled = false,
      },
    },
  },
  cmdline = {
    keymap = {
      ["<tab>"] = { "accept" },
      ["<cr>"] = { "accept_and_enter", "fallback" },
    },
    completion = {
      menu = {
        auto_show = function(ctx)
          return vim.fn.getcmdtype() == ":"
        end,
      },
    },
  },
})
