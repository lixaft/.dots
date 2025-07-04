local conform = require("conform")

conform.setup({
  default_format_opts = {
    -- TODO: LSP fallback does not seem to work properly right now.
    lsp_format = "fallback",
  },
  formatters_by_ft = {
    ["*"] = { "injected" },
    cpp = { "clang-format" },
    javascript = { "prettier" },
    json = { "prettier" },
    lua = { "stylua" },
    markdown = { "prettier" },
    meson = { "meson-format" },
    nix = { "alejandra" },
    python = { "ruff_organize_imports", "ruff_format" },
    sh = { "shfmt" },
    typescript = { "prettier" },
    yaml = { "prettier" },
  },
  formatters = {
    ruff_organize_imports = {
      args = {
        "check",
        "--fix",
        "--unsafe-fixes",
        "--force-exclude",
        "--select=I001,I002,TC001,TC002,TC003,TC004,TC005,TID252,RUF022",
        "--exit-zero",
        "--no-cache",
        "--stdin-filename",
        "$FILENAME",
        "-",
      },
    },
  },
})

vim.keymap.set("n", "<c-f>", conform.format)
