local blink = require("blink-cmp")

blink.setup({
  sources = {
    default = { "lsp", "path", "snippets", "buffer", "dadbod" },
    providers = {
      dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
    },
  },
  signature = {
    enabled = true,
  },
})
