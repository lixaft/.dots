local cmp = require("blink.cmp")

---@type vim.lsp.Config
return {
  cmd = { "ty", "server" },
  root_markers = {
    ".git",
    ".ty.toml",
    "pyproject.toml",
    "ty.toml",
  },
  filetypes = {
    "python",
  },
  capabilities = cmp.get_lsp_capabilities(),
  settings = {
    ty = {
      experimental = {
        autoImport = true,
        rename = true,
      },
    },
  },
}
