local cmp = require("blink.cmp")

---@type vim.lsp.Config
return {
  cmd = { "typos-lsp" },
  root_markers = {
    ".git",
    ".typos.toml",
    "_typos.toml",
    "typos.toml",
  },
  capabilities = cmp.get_lsp_capabilities(),
}
