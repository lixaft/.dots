local config = require("nvim-treesitter.config")
local context = require("treesitter-context")
local tsj = require("treesj")

config.setup({
  highlight = {
    enable = true,
  },

  indent = {
    enable = true,
  },

  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ar"] = "@assignment.lhs",
        ["al"] = "@assignment.rhs",
        ["ir"] = "@assignment.lhs",
        ["il"] = "@assignment.rhs",
        ["ia"] = "@parameter.inner",
        ["aa"] = "@parameter.outer",
        ["iC"] = "@comment.inner",
        ["aC"] = "@comment.outer",
        ["ib"] = "@block.inner",
        ["ab"] = "@block.outer",
      },

      include_surrounding_whitespace = function(opts)
        local ret = false
        if string.find(opts.query_string, ".outer") then
          ret = true
        end
        return ret
      end,
    },

    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },

    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]c"] = "@class.outer",
        ["]f"] = "@function.outer",
        ["]r"] = "@return.outer",
      },
      goto_next_end = {
        ["]C"] = "@class.outer",
        ["]F"] = "@function.outer",
        ["]R"] = "@return.outer",
      },
      goto_previous_start = {
        ["[c"] = "@class.outer",
        ["[f"] = "@function.outer",
        ["[r"] = "@return.outer",
      },
      goto_previous_end = {
        ["[C"] = "@class.outer",
        ["[F"] = "@function.outer",
        ["[R"] = "@return.outer",
      },
    },
  },
})

context.setup({
  separator = "―",
  multiline_threshold = 1,
})

tsj.setup({
  use_default_keymaps = false,
})

vim.keymap.set("n", "gC", context.go_to_context)
vim.keymap.set("n", "gj", tsj.toggle)
