local flake = require("flake")

-- Options.
vim.g.omni_sql_no_default_maps = 1
vim.opt_local.commentstring = "-- %s"
vim.opt_local.shiftwidth = 4

-- LSP.
flake.lsp.start("typos_lsp")
