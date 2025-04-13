local cmp = require("blink-cmp")

---@type vim.lsp.Config
return {
  cmd = { "postgres_lsp" },
  root_markers = {
    ".git",
    "postgrestools.jsonc",
  },
  filetypes = {
    "sql",
  },
  capabilities = cmp.get_lsp_capabilities(),
}
