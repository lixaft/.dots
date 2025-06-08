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
})
