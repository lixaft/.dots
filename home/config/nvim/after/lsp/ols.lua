local cmp = require("blink.cmp")

---@type vim.lsp.Config
return {
  cmd = { "ols" },
  root_markers = {
    ".git",
    "ols.json",
  },
  filetypes = {
    "odin",
  },
  capabilities = cmp.get_lsp_capabilities(),
}
