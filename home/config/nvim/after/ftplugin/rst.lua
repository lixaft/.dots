local flake = require("flake")

-- Options.
vim.opt_local.shiftwidth = 4

-- LSP.
flake.lsp.start("typos_lsp")
