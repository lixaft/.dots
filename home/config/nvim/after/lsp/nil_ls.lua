local cmp = require("blink.cmp")

---@type vim.lsp.Config
return {
  cmd = { "nil" },
  root_markers = {
    ".git",
    "flake.nix",
  },
  filetypes = {
    "nix",
  },
  capabilities = cmp.get_lsp_capabilities(),
}
