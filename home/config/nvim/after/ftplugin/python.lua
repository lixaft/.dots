local flake = require("flake")

-- Options.
vim.opt_local.shiftwidth = 4

-- Treesitter.
vim.treesitter.start()

-- LSP.
flake.lsp.start("ruff")
flake.lsp.start("ty")
flake.lsp.start("typos_lsp")
