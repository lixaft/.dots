local flake = require("flake")

-- Options.
vim.opt_local.shiftwidth = 4

-- LSP.
flake.lsp.start("ty")
flake.lsp.start("ruff")
flake.lsp.start("pyright")
flake.lsp.start("typos_lsp")
