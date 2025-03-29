-- Options.
vim.opt_local.shiftwidth = 4

-- LSP.
vim.lsp.start(vim.lsp.config["ruff"])
vim.lsp.start(vim.lsp.config["pyright"])
vim.lsp.start(vim.lsp.config["typos_lsp"])
