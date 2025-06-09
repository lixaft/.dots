local colorizer = require("colorizer")

colorizer.setup({
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
})
