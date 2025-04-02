local flake = require("flake")

-- LSP.
flake.lsp.start("gopls")
flake.lsp.start("typos_lsp")
