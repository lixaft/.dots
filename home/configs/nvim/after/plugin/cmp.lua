local blink = require("blink-cmp")

blink.setup({
  sources = {
    completion = {
      enabled_providers = { "lsp", "path", "snippets", "buffer", "dadbod" },
    },
    providers = {
      dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
    },
  },
  signature = {
    enabled = true,
  },
})
