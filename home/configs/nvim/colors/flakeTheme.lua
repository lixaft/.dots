-- local flake = require("flake")

vim.cmd([[hi clear]])
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

local C = {
  bg = "#000000",
  fg = "#d8d8df",
  comment = "#303040",

  black = "#07070b",
  white = "#ffffff",

  blue = "#00c7fc",
  green = "#00ff9f",
  red = "#e44141",
  teal = "#16b1ac",
  yellow = "#fce094",
  orange = "#ff8400",
}

-- Base.
vim.api.nvim_set_hl(0, "Normal", { fg = C.fg, bg = "None" })
vim.api.nvim_set_hl(0, "NormalFloat", { fg = C.fg, bg = C.black })

-- Syntax.
vim.api.nvim_set_hl(0, "Comment", { fg = C.comment })
vim.api.nvim_set_hl(0, "Statement", { fg = C.fg, bold = true })
vim.api.nvim_set_hl(0, "Statement", { fg = C.fg, bold = true })

-- Interface.
vim.api.nvim_set_hl(0, "LineNr", { fg = C.fg, bold = true })
vim.api.nvim_set_hl(0, "LineNrAbove", { link = "Comment" })
vim.api.nvim_set_hl(0, "LineNrBelow", { link = "Comment" })
vim.api.nvim_set_hl(0, "StatusLine", { fg = C.bg, bg = C.fg })
vim.api.nvim_set_hl(0, "TabLine", { fg = C.bg, bg = C.fg })
vim.api.nvim_set_hl(0, "TabLineSel", { bg = C.bg, fg = C.fg })

-- Others.
vim.api.nvim_set_hl(0, "ColorColumn", { fg = C.comment, bg = "None" })
vim.api.nvim_set_hl(0, "VirtColumn", { link = "ColorColumn" })

-- Treesitter.
vim.api.nvim_set_hl(0, "@string.documentation", { fg = C.comment })
