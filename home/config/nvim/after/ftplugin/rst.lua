local flake = require("flake")

-- Options.
vim.opt_local.shiftwidth = 3

-- Treesitter.
vim.treesitter.start()

-- LSP.
flake.lsp.start("typos_lsp")
