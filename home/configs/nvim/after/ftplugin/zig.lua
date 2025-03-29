-- Options.
vim.g.zig_fmt_autosave = 0

-- LSP.
vim.lsp.start(vim.lsp.config.zls)
vim.lsp.start(vim.lsp.config.typos_lsp)
