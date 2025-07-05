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
    fd_opts = [[--color=never --hidden --type f --type l --no-require-git --exclude .git --exclude .jj]],
    winopts = {
      preview = {
        hidden = "hidden",
      },
    },
  },

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

vim.keymap.set("n", "<leader>S", fzf.resume)
vim.keymap.set("n", "<c-p>", fzf.files)
vim.keymap.set("n", "<leader>/", fzf.live_grep)
vim.keymap.set("n", "<c-_>", fzf.lsp_document_symbols)
vim.keymap.set("n", "g<c-_>", fzf.lsp_live_workspace_symbols)
vim.keymap.set("n", "<leader>sp", fzf.builtin)
vim.keymap.set("n", "<leader>sh", fzf.help_tags)
vim.keymap.set("n", "<leader>sn", fzf.spell_suggest)
vim.keymap.set("n", "<leader>sc", fzf.command_history)
vim.keymap.set("n", "<leader>sm", fzf.marks)
vim.keymap.set("n", "<leader>sr", fzf.registers)
vim.keymap.set("n", "<leader>so", fzf.oldfiles)
