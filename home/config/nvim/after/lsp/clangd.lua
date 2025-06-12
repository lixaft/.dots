local cmp = require("blink.cmp")

---@type vim.lsp.Config
return {
  cmd = { "clangd", "--header-insertion=never" },
  root_markers = {
    ".clang-format",
    ".clang-tidy",
    ".clangd",
    ".git",
    "compile_commands.json",
    "compile_flags.txt",
  },
  filetypes = {
    "c",
    "cpp",
  },
  capabilities = cmp.get_lsp_capabilities({
    offsetEncoding = { "utf-16" },
  }),
}
