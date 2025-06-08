local cmp = require("blink.cmp")

---@type vim.lsp.Config
return {
  cmd = { "bash-language-server", "start" },
  root_markers = {
    ".git",
  },
  filetypes = {
    "sh",
    "bash",
  },
  capabilities = cmp.get_lsp_capabilities(),
}
