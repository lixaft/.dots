local lazydev = require("lazydev")

-- Options.
vim.opt_local.shiftwidth = 4

-- LSP.
vim.lsp.start(vim.lsp.config["lua_ls"])
vim.lsp.start(vim.lsp.config["typos_lsp"])
lazydev.setup()
