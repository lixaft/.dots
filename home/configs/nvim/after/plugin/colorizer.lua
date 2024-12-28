local colorizer = require("colorizer")

colorizer.setup({
  -- selene: allow(mixed_table)
  filetypes = {
    "*",
    css = { css = true },
  },
  user_default_options = {
    RGB = false,
    RRGGBB = true,
    RRGGBBAA = true,
    names = false,
    mode = "virtualtext",
  },
  buftypes = {},
})
