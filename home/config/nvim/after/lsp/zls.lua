local cmp = require("blink.cmp")

---@type vim.lsp.Config
return {
  cmd = { "zls" },
  root_markers = {
    ".git",
    "build.zig",
    "zls.json",
  },
  filetypes = {
    "zig",
    "zir",
  },
  capabilities = cmp.get_lsp_capabilities(),
}
