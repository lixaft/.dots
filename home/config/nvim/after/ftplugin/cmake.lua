local flake = require("flake")

-- LSP.
flake.lsp.start("cmake")
flake.lsp.start("typos_lsp")
