local flake = require("flake")

-- Treesitter.
vim.treesitter.start()

-- LSP.
flake.lsp.start("gopls")
flake.lsp.start("typos_lsp")
