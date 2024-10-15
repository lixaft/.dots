local ls = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()

vim.keymap.set({ "i", "s" }, "<c-j>", function()
  ls.jump(1)
end)

vim.keymap.set({ "i", "s" }, "<c-k>", function()
  ls.jump(-1)
end)
