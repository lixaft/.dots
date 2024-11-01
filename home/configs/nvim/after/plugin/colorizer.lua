local colorizer = require("colorizer")

colorizer.setup({
  filetypes = {
    [1] = "*",
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
