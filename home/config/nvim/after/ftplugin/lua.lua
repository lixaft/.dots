local flake = require("flake")
local lazydev = require("lazydev")

-- Options.
vim.opt_local.shiftwidth = 4

-- Treesitter.
vim.treesitter.start()

-- LSP.
flake.lsp.start("lua_ls")
flake.lsp.start("typos_lsp")
lazydev.setup()
