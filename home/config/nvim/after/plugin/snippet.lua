vim.keymap.set({ "i", "s" }, "<c-j>", function()
  vim.snippet.jump(1)
end)

vim.keymap.set({ "i", "s" }, "<c-k>", function()
  vim.snippet.jump(-1)
end)
