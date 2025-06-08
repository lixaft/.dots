local cmp = require("blink.cmp")

---@type vim.lsp.Config
return {
  cmd = { "gopls" },
  root_markers = {
    ".git",
    "go.mod",
    "go.work",
  },
  filetypes = {
    "go",
    "gomod",
    "gotmpl",
    "gowork",
  },
  capabilities = cmp.get_lsp_capabilities(),
}
