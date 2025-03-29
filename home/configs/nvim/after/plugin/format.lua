local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    ["*"] = { "injected" },
    json = { "prettier" },
    lua = { "stylua" },
    markdown = { "prettier" },
    nix = { "alejandra" },
    python = { "ruff_organize_imports", "ruff_format" },
    sh = { "shfmt" },
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

vim.keymap.set("n", "<c-f>", function()
  conform.format({
    lsp_fallback = true,
    quiet = true,
  })
end, { desc = "Format Buffer" })
