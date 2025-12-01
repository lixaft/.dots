local cmp = require("blink.cmp")

---@type vim.lsp.Config
return {
  cmd = { "nu", "--lsp" },
  root_markers = {
    ".git",
  },
  filetypes = {
    "nu",
  },
  capabilities = cmp.get_lsp_capabilities(),
}
