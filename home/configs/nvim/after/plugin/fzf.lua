local fzf = require("fzf-lua")

fzf.setup({
  winopts = {
    border = "none",
    split = "botright new",
    preview = {
      scrollbar = "float",
    },
  },

  files = {
    winopts = {
      preview = {
        hidden = "hidden",
      },
    },
  },

  -- selene: allow(mixed_table)
  keymap = {
    builtin = {
      true,
      ["<c-y>"] = "preview-up",
      ["<c-e>"] = "preview-down",
      ["<c-d>"] = "preview-page-down",
      ["<c-u>"] = "preview-page-up",
    },
    fzf = {
      true,
      ["shift-up"] = "first",
      ["shift-down"] = "last",
      ["ctrl-q"] = "select-all+accept",
    },
  },
})

vim.keymap.set("n", "<leader>S", fzf.resume, { desc = "Fzf Resume" })
vim.keymap.set("n", "<c-p>", fzf.files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>/", fzf.live_grep, { desc = "Grep" })
vim.keymap.set("n", "<c-_>", fzf.lsp_document_symbols, { desc = "Find LSP document symbol" })
vim.keymap.set("n", "g<c-_>", fzf.lsp_live_workspace_symbols, { desc = "Find LSP document workspace symbol" })
vim.keymap.set("n", "<leader>sB", fzf.builtin, { desc = "Fzf builtin providers" })
vim.keymap.set("n", "<leader>sh", fzf.help_tags, { desc = "Help pages" })
vim.keymap.set("n", "<leader>sn", fzf.spell_suggest, { desc = "Spell suggestions" })
vim.keymap.set("n", "<leader>sc", fzf.command_history, { desc = "Command History" })
