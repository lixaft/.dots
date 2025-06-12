vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("lixaft-term", {}),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
    vim.opt_local.spell = false
    vim.opt_local.cursorline = false
    vim.cmd("DisableWhitespace")
    vim.cmd("startinsert")
  end,
})

vim.keymap.set("n", "<leader>t", function()
  vim.cmd.new()
  vim.api.nvim_win_set_height(0, 12)
  vim.cmd.term()
end)

vim.keymap.set("t", "<esc>", "<c-\\><c-n>")
