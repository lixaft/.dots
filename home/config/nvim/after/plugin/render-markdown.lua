local render_markdown = require("render-markdown")

render_markdown.setup({
  heading = {
    icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
    signs = { "󰫎 " },
  },
  code = {
    style = "normal",
  },
})

vim.keymap.set("n", "<leader>m", "<cmd>RenderMarkdown toggle<cr>")
