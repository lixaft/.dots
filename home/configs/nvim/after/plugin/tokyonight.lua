local tokyonight = require("tokyonight")

tokyonight.setup({
  style = "night",
  transparent = true,

  styles = {
    floats = "transparent",
    sidebars = "transparent",
    comments = { italic = false },
    keywords = { italic = false },
  },

  lualine_bold = true,

  on_colors = function(colors)
    colors.black = "#08080C"
    colors.bg_highlight = "#111118"

    colors.bg = colors.black
    colors.bg_visual = colors.bg_highlight
    colors.bg_statusline = colors.black
    colors.fg_gutter = colors.bg_highlight
  end,

  on_highlights = function(hl, colors)
    hl.LineNr = { fg = colors.fg_gutter }
    hl.LineNrAbove = { link = "LineNr" }
    hl.LineNrBelow = { link = "LineNr" }

    hl.ExtraWhitespace = { bg = colors.red }

    hl.VirtColumn = { fg = colors.fg_gutter }

    hl.TreesitterContext = {}
    hl.TreesitterContextSeparator = { fg = colors.fg_gutter }

    hl.Folded = { bg = "none", fg = colors.fg_gutter }

    hl["@string.documentation"] = { fg = colors.comment }
  end,
})

vim.cmd("colorscheme tokyonight")
