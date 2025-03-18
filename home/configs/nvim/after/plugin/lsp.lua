local blink = require("blink-cmp")
local lazydev = require("lazydev")
local lspconfig = require("lspconfig")

vim.diagnostic.config({
  float = {
    source = "always",
  },
})

local function build_capabilities(opts)
  return blink.get_lsp_capabilities(opts)
end

-- Bash.
lspconfig.bashls.setup({
  capabilities = build_capabilities(),
})

-- C/C++.
lspconfig.clangd.setup({
  capabilities = build_capabilities({
    offsetEncoding = { "utf-16" },
  }),
})

-- CMake.
lspconfig.cmake.setup({
  capabilities = build_capabilities(),
})

-- Go.
lspconfig.gopls.setup({
  capabilities = build_capabilities(),
})

-- Lua.
lazydev.setup()
lspconfig.lua_ls.setup({
  capabilities = build_capabilities(),
  settings = {
    Lua = {
      diagnostics = { enable = false },
      format = { enable = false },
    },
  },
})

-- Nix.
lspconfig.nil_ls.setup({
  capabilities = build_capabilities(),
})

-- Odin.
lspconfig.ols.setup({
  capabilities = build_capabilities(),
})

-- Python.
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
})

-- Rust.
lspconfig.rust_analyzer.setup({
  capabilities = build_capabilities(),
})

-- Typos.
lspconfig.typos_lsp.setup({
  capabilities = build_capabilities(),
})

-- Zig.
lspconfig.zls.setup({
  capabilities = build_capabilities(),
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }

    vim.keymap.set("n", "gr", vim.lsp.buf.rename, opts)

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gR", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "H", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("i", "<c-h>", vim.lsp.buf.signature_help, opts)

    vim.keymap.set("n", "<c-q>", vim.diagnostic.setqflist, opts)
    vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set({ "n", "v" }, "ga", vim.lsp.buf.code_action, opts)
  end,
})
