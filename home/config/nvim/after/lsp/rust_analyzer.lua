local cmp = require("blink.cmp")

---@type vim.lsp.Config
return {
  cmd = { "rust-analyzer" },
  root_markers = {
    ".git",
    "Cargo.toml",

  },
  filetypes = {
    "rust",
  },
  capabilities = cmp.get_lsp_capabilities(),
}
