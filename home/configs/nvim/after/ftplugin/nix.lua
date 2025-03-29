-- Options.
vim.opt_local.shiftwidth = 2

-- LSP.
vim.lsp.start(vim.lsp.config["nil_ls"])
vim.lsp.start(vim.lsp.config["typos_lsp"])
