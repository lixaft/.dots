local render_markdown = require("render-markdown")

render_markdown.setup({
  heading = {
    icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
    position = "inline",
    signs = { "󰫍 " },
    width = "block",
    min_width = 80,
  },
  code = {
    style = "normal",
    width = "block",
    min_width = 80,
  },
})

vim.keymap.set("n", "<leader>m", "<cmd>RenderMarkdown toggle<cr>")
