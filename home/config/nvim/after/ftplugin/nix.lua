local flake = require("flake")

-- Options.
vim.opt_local.shiftwidth = 2

-- LSP.
flake.lsp.start("nil_ls")
flake.lsp.start("typos_lsp")
