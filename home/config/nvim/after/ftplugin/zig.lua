local flake = require("flake")

-- Options.
vim.g.zig_fmt_autosave = 0

-- Treesitter.
vim.treesitter.start()

-- LSP.
flake.lsp.start("zls")
flake.lsp.start("typos_lsp")
