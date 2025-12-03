local flake = require("flake")

-- Treesitter.
vim.treesitter.start()

-- LSP.
flake.lsp.start("cmake")
flake.lsp.start("typos_lsp")
