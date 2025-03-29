-- Options.
vim.opt_local.colorcolumn = { "50", "72" }
vim.opt_local.spell = true

-- LSP.
vim.lsp.start(vim.lsp.config.typos_lsp)
