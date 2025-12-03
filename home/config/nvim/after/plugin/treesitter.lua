local config = require("nvim-treesitter.config")
local context = require("treesitter-context")
local textobjects = require("nvim-treesitter-textobjects")
local tsj = require("treesj")

config.setup({
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
})

context.setup({
  separator = "―",
  multiline_threshold = 1,
})

textobjects.setup({
  select = {
    lookahead = true,
    include_surrounding_whitespace = function(opts)
      return opts.query_string:find("%.outer") ~= nil
    end,
  },

  move = {
    set_jumps = true,
  },
})

tsj.setup({
  use_default_keymaps = false,
})

local function select(group)
  return function()
    require("nvim-treesitter-textobjects.select").select_textobject(group, "textobjects")
  end
end

vim.keymap.set({ "x", "o" }, "af", select("@function.outer"))
vim.keymap.set({ "x", "o" }, "if", select("@function.inner"))
vim.keymap.set({ "x", "o" }, "ac", select("@class.outer"))
vim.keymap.set({ "x", "o" }, "ic", select("@class.inner"))
vim.keymap.set({ "x", "o" }, "ar", select("@assignment.lhs"))
vim.keymap.set({ "x", "o" }, "al", select("@assignment.rhs"))
vim.keymap.set({ "x", "o" }, "ir", select("@assignment.lhs"))
vim.keymap.set({ "x", "o" }, "il", select("@assignment.rhs"))
vim.keymap.set({ "x", "o" }, "ia", select("@parameter.inner"))
vim.keymap.set({ "x", "o" }, "aa", select("@parameter.outer"))
vim.keymap.set({ "x", "o" }, "iC", select("@comment.inner"))
vim.keymap.set({ "x", "o" }, "aC", select("@comment.outer"))
vim.keymap.set({ "x", "o" }, "ib", select("@block.inner"))
vim.keymap.set({ "x", "o" }, "ab", select("@block.outer"))

local function swap(direction, group)
  return function()
    local mod = require("nvim-treesitter-textobjects.swap")
    if direction == "next" then
      mod.swap_next(group)
    elseif direction == "previous" then
      mod.swap_previous(group)
    end
  end
end

vim.keymap.set("n", ">p", swap("next", "@parameter.inner"))
vim.keymap.set("n", "<p", swap("previous", "@parameter.inner"))

local function move(mode, group)
  return function()
    local mod = require("nvim-treesitter-textobjects.move")
    if mode == "next_start" then
      mod.goto_next_start(group, "textobjects")
    elseif mode == "next_end" then
      mod.goto_next_end(group, "textobjects")
    elseif mode == "previous_start" then
      mod.goto_previous_start(group, "textobjects")
    elseif mode == "previous_end" then
      mod.goto_previous_end(group, "textobjects")
    end
  end
end

vim.keymap.set({ "n", "x", "o" }, "]c", move("next_start", "@class.outer"))
vim.keymap.set({ "n", "x", "o" }, "]f", move("next_start", "@function.outer"))
vim.keymap.set({ "n", "x", "o" }, "]r", move("next_start", "@return.outer"))
vim.keymap.set({ "n", "x", "o" }, "]C", move("next_end", "@class.outer"))
vim.keymap.set({ "n", "x", "o" }, "]F", move("next_end", "@function.outer"))
vim.keymap.set({ "n", "x", "o" }, "]R", move("next_end", "@return.outer"))
vim.keymap.set({ "n", "x", "o" }, "[c", move("previous_start", "@class.outer"))
vim.keymap.set({ "n", "x", "o" }, "[f", move("previous_start", "@function.outer"))
vim.keymap.set({ "n", "x", "o" }, "[r", move("previous_start", "@return.outer"))
vim.keymap.set({ "n", "x", "o" }, "[C", move("previous_end", "@class.outer"))
vim.keymap.set({ "n", "x", "o" }, "[F", move("previous_end", "@function.outer"))
vim.keymap.set({ "n", "x", "o" }, "[R", move("previous_end", "@return.outer"))

vim.keymap.set("n", "gC", context.go_to_context)
vim.keymap.set("n", "gj", tsj.toggle)
