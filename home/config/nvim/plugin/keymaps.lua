-- Keep cursor at the middle of the screen on big vertical movement.
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-i>", "<c-i>zz")
vim.keymap.set("n", "<c-o>", "<c-o>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")

-- Make `n` and `N` search consistent between `/` and `?`.
vim.keymap.set({ "n", "x", "o" }, "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set({ "n", "x", "o" }, "N", "'nN'[v:searchforward]", { expr = true })

-- Go to next/prev element of loclist and qflist.
vim.keymap.set("n", "<c-j>", ":cnext<cr>zz")
vim.keymap.set("n", "<c-k>", ":cprev<cr>zz")
vim.keymap.set("n", "<leader>j", ":lnext<cr>zz")
vim.keymap.set("n", "<leader>k", ":lprev<cr>zz")

-- Make `j` and `k` more natural with line wrap.
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Move line(s) up and down.
vim.keymap.set("v", "J", ":move '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":move '<-2<cr>gv=gv")

-- Do not move cursor on join lines.
vim.keymap.set("n", "J", "mzJ`z")

-- Preserve selection on indent.
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Toggle highlight features.
vim.keymap.set("n", "gh", "<cmd>nohlsearch<cr>")
vim.keymap.set("n", "gs", "<cmd>set spell!<cr>")

-- LSP.
pcall(vim.keymap.del, "n", "gra")
pcall(vim.keymap.del, "n", "gri")
pcall(vim.keymap.del, "n", "grn")
pcall(vim.keymap.del, "n", "grr")
pcall(vim.keymap.del, "n", "grt")

vim.keymap.set("n", "gr", vim.lsp.buf.rename)

vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "gR", vim.lsp.buf.references)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("i", "<c-h>", vim.lsp.buf.signature_help)

vim.keymap.set("n", "<c-q>", vim.diagnostic.setqflist)
vim.keymap.set("n", "gl", vim.diagnostic.open_float)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set({ "n", "v" }, "ga", vim.lsp.buf.code_action)

-- Snippet.
vim.keymap.set({ "i", "s" }, "<c-j>", function()
  vim.snippet.jump(1)
end)

vim.keymap.set({ "i", "s" }, "<c-k>", function()
  vim.snippet.jump(-1)
end)

-- Escape (keep it hidden in the bottom of the file :s).
vim.keymap.set({ "n", "i", "v" }, "<c-c>", "<esc>")
