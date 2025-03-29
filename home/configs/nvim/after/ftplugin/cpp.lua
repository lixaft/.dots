-- Options.
vim.opt_local.shiftwidth = 4

-- LSP.
vim.lsp.start(vim.lsp.config.clangd)
vim.lsp.start(vim.lsp.config.typos_lsp)
