-- Options.
vim.opt_local.shiftwidth = 4

-- LSP.
vim.lsp.start(vim.lsp.config["bashls"])
vim.lsp.start(vim.lsp.config["typos_lsp"])
