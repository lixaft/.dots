local flake = require("flake")

-- Treesitter.
vim.treesitter.start()

-- LSP.
flake.lsp.start("ols")
flake.lsp.start("typos_lsp")
