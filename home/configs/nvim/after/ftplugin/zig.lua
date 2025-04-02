local flake = require("flake")

-- Options.
vim.g.zig_fmt_autosave = 0

-- LSP.
flake.lsp.start("zls")
flake.lsp.start("typos_lsp")
