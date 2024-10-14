local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.selene,
    null_ls.builtins.diagnostics.sqlfluff,
    null_ls.builtins.diagnostics.mypy.with({
      extra_args = {
        "--ignore-missing-imports",
      },
    }),

    null_ls.builtins.formatting.alejandra,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.shfmt,
    null_ls.builtins.formatting.sqlfluff,
    null_ls.builtins.formatting.stylua,
  },
})
