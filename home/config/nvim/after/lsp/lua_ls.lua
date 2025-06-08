local cmp = require("blink.cmp")

---@type vim.lsp.Config
return {
  cmd = { "lua-language-server" },
  root_markers = {
    ".git",
    ".luacheckrc",
    ".luarc.json",
    ".luarc.jsonc",
    ".stylua.toml",
    "selene.toml",
    "selene.yml",
    "stylua.toml",
  },
  filetypes = {
    "lua",
  },
  capabilities = cmp.get_lsp_capabilities(),
  settings = {
    Lua = {
      diagnostics = { enable = false },
      format = { enable = false },
    },
  },
}
