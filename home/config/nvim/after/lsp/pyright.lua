local cmp = require("blink.cmp")

---@type vim.lsp.Config
return {
  cmd = { "pyright-langserver", "--stdio" },
  root_markers = {
    ".git",
    "pyproject.toml",
    "pyrightconfig.json",
  },
  filetypes = {
    "python",
  },
  capabilities = cmp.get_lsp_capabilities(),
  settings = {
    pyright = {
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        ignore = { "*" },
      },
    },
  },
}
