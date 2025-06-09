local oil = require("oil")

oil.setup({
  win_options = {
    signcolumn = "yes",
  },
  view_options = {
    show_hidden = false,
    is_hidden_file = function(file, _)
      local name = {
        "..",
        ".DS_Store",
        ".direnv",
        ".git",
        ".mypy_cache",
        ".nox",
        ".pytest_cache",
        ".ruff_cache",
        ".tox",
        ".venv",
        ".zig-cache",
        "__pycache__",
        "build",
        "dist",
        "result",
        "venv",
        "zig-out",
      }
      local ext = {
        ".egg-info",
        ".pyc",
      }
      local is_hidden = false
      for _, v in ipairs(name) do
        if file == v then
          is_hidden = true
          break
        end
      end

      if not is_hidden then
        for _, v in ipairs(ext) do
          if vim.endswith(file, v) then
            is_hidden = true
            break
          end
        end
      end

      return is_hidden
    end,
  },
  use_default_keymaps = false,
  keymaps = {
    ["-"] = "actions.close",
    ["+"] = "actions.close",
    ["<esc>"] = "actions.close",
    ["<c-c>"] = "actions.close",
    ["<cr>"] = "actions.select",
    ["<c-t>"] = "actions.select_tab",
    ["<c-v>"] = "actions.select_vsplit",
    ["<c-x>"] = "actions.select_split",
    ["."] = "actions.parent",
    ["<c-i>"] = "actions.toggle_hidden",
    ["<c-l>"] = "actions.refresh",
    ["P"] = "actions.preview",
    ["<c-q>"] = function()
      require("oil.actions").send_to_qflist.callback()
      vim.cmd("copen")
    end,
  },
})

vim.keymap.set("n", "-", oil.open)
vim.keymap.set("n", "+", function()
  oil.open(vim.fn.getcwd())
end)
