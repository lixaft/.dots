local lualine = require("lualine")

lualine.setup({
  options = {
    theme = "tokyonight-night",

    component_separators = {
      left = "।",
      right = "।",
    },

    globalstatus = true,

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

  tabline = {
    lualine_a = {
      function()
        return "󰈸"
      end,
    },
    lualine_b = {
      { [1] = "tabs", mode = 2, max_length = vim.o.columns },
      {
        -- The tabline options will force set the `showtabline` option to 2
        -- (which always display the tab bar). We want to restore the default
        -- behavior here.
        function()
          vim.o.showtabline = 1
          return ""
        end,
      },
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
})
