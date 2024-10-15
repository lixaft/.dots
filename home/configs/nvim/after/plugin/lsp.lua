local cmp_lsp = require("cmp_nvim_lsp")
local lspconfig = require("lspconfig")
local lspconfig_windows = require("lspconfig.ui.windows")
local telescope_builtin = require("telescope.builtin")

lspconfig_windows.default_options.border = "rounded"

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = "rounded"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

vim.diagnostic.config({
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
  },
})

local signs = {
  Error = "✘ ",
  Warn = "▲ ",
  Hint = "⚑ ",
  Info = " ",
}
for type, text in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = text, texthl = hl, numhl = hl })
end

local function build_capabilities(opts)
  return vim.tbl_extend("force", cmp_lsp.default_capabilities(), opts or {})
end

local function on_attach(_, buffer)
  local opts = { buffer = buffer }

  vim.keymap.set("n", "<c-f>", function()
    vim.lsp.buf.format()
    vim.lsp.buf.code_action({
      context = { only = { "source.organizeImports" } },
      apply = true,
    })
  end, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.rename, opts)

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gR", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<c-_>", telescope_builtin.lsp_document_symbols, opts)
  vim.keymap.set("n", "g<c-_>", telescope_builtin.lsp_dynamic_workspace_symbols, opts)

  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "H", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("i", "<c-h>", vim.lsp.buf.signature_help, opts)

  vim.keymap.set("n", "<leader>q", vim.diagnostic.setqflist, opts)
  vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set({ "n", "v" }, "ga", vim.lsp.buf.code_action, opts)
end

require("neodev").setup()

lspconfig.pyright.setup({
  capabilities = build_capabilities(),
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
})
lspconfig.ruff.setup({
  capabilities = build_capabilities({
    hoverProvider = false,
  }),
  on_attach = on_attach,
})
lspconfig.nil_ls.setup({
  capabilities = build_capabilities(),
  on_attach = on_attach,
})
lspconfig.lua_ls.setup({
  capabilities = build_capabilities(),
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = { enable = false },
      format = { enable = false },
    },
  },
})
lspconfig.ts_ls.setup({
  capabilities = build_capabilities(),
  on_attach = on_attach,
})
lspconfig.clangd.setup({
  capabilities = build_capabilities({
    offsetEncoding = { "utf-16" },
  }),
  on_attach = on_attach,
})
lspconfig.cmake.setup({
  capabilities = build_capabilities(),
  on_attach = on_attach,
})
lspconfig.zls.setup({
  capabilities = build_capabilities(),
  on_attach = on_attach,
})
lspconfig.rust_analyzer.setup({
  capabilities = build_capabilities(),
  on_attach = on_attach,
})
lspconfig.gopls.setup({
  capabilities = build_capabilities(),
  on_attach = on_attach,
})
lspconfig.bashls.setup({
  capabilities = build_capabilities(),
  on_attach = on_attach,
})
lspconfig.typos_lsp.setup({
  capabilities = build_capabilities(),
  on_attach = on_attach,
})
