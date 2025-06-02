local group = vim.api.nvim_create_augroup("lixaft", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual" })
  end,
})
