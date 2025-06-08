local cmp = require("blink.cmp")

---@type vim.lsp.Config
return {
  cmd = { "cmake-language-server" },
  root_markers = {
    ".git",
    "build",
  },
  filetypes = {
    "cmake",
  },
  capabilities = cmp.get_lsp_capabilities(),
  init_options = {
    buildDirectory = "build",
  },
}
