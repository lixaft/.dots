local lint = require("lint")

lint.linters_by_ft = {
  python = { "mypy" },
  lua = { "selene" },
}

-- TODO: Switch to dmypy when new version is available in nix packages.
local mypy = lint.linters.mypy
table.insert(mypy.args, #mypy.args, "--ignore-missing-imports")

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
  callback = function()
    lint.try_lint()
  end,
})
