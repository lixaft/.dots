local cmp = require("blink.cmp")

---@type vim.lsp.Config
return {
  cmd = { "ruff", "server" },
  root_markers = {
    ".git",
    ".ruff.toml",
    "pyproject.toml",
    "ruff.toml",
  },
  filetypes = {
    "python",
  },
  capabilities = cmp.get_lsp_capabilities(),
}
