local cmp = require("blink.cmp")

---@type vim.lsp.Config
return {
  cmd = { "vtsls", "--stdio" },
  filetypes = {
    "javascript",
    "typescript",
  },
  root_markers = {
    ".git",
    "bun.lock",
    "bun.lockb",
    "package-lock.json",
    "pnpm-lock.yaml",
    "yarn.lock",
  },
  capabilities = cmp.get_lsp_capabilities(),
}
