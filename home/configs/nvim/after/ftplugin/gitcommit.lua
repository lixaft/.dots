local flake = require("flake")

-- Options.
vim.opt_local.colorcolumn = { "50", "72" }
vim.opt_local.spell = true

-- LSP.
flake.lsp.start("typos_lsp")
