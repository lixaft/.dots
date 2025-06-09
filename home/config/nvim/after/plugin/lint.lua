local lint = require("lint")

lint.linters_by_ft = {
  python = { "mypy" },
}

local mypy = lint.linters.mypy
table.insert(mypy.args, #mypy.args, "--ignore-missing-imports")

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
  callback = function()
    lint.try_lint()
  end,
})
