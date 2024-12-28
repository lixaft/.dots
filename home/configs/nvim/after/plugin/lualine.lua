local lualine = require("lualine")

lualine.setup({
  options = {
    theme = "tokyonight-night",

    always_show_tabline = false,
    globalstatus = true,

    component_separators = {
      left = "।",
      right = "।",
    },

    section_separators = {
      left = "",
      right = "",
    },
  },

  sections = {
    lualine_a = {
      "mode",
    },
    lualine_b = {
      "branch",
      "diff",
      "diagnostics",
    },
    lualine_c = {
      "filename",
    },
    lualine_x = {
      "encoding",
      "fileformat",
      "filetype",
    },
    lualine_y = {
      "progress",
    },
    lualine_z = {
      "location",
    },
  },

  -- selene: allow(mixed_table)
  tabline = {
    lualine_a = {
      function()
        return "󰈸"
      end,
    },
    lualine_b = {
      { "tabs", mode = 2, max_length = vim.o.columns },
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
})
