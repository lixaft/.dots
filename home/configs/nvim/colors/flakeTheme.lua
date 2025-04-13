local flake = require("flake")
-- local C = flake.colors

vim.cmd([[hi clear]])
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

--- @param name string
--- @param val vim.api.keyset.highlight
local function hl(name, val)
  vim.api.nvim_set_hl(0, name, val)
end

local C = {
  fg = "#acacc8",
  bg = "#000000",

  white = "#d0d0f3",

  -- Yes.
  blue = "#2b80f0",
  green = "#a6e22e",
  lavender = "#a29dfa",
  lavender2 = "#6e75a8",
  red = "#e61f44",
  yellow = "#ffa700",

  ui = {
    dim = "#101020",
  },

  status = {
    fg = "#303050",
    bg = "#040406",
  },

  syntax = {
    comment = "#303050",
    operator = "#404060",
  },
}

-- Base.
hl("Normal", { fg = C.fg, bg = C.bg })
-- hl("NormalFloat", { fg = C.fg, bg = C.ui.float_bg })

-- Interface.
hl("LineNr", { fg = C.fg, bg = C.bg, bold = true })
hl("LineNrAbove", { fg = C.ui.dim, bg = C.bg })
hl("LineNrBelow", { fg = C.ui.dim, bg = C.bg })
hl("SignColumn", { bg = C.bg })
hl("StatusLine", { fg = C.status.fg, bg = C.status.bg })
hl("TabLine", { fg = C.status.fg, bg = C.status.bg })
hl("TabLineSel", { fg = C.fg, bg = C.status.bg, bold = true })
hl("WinSeparator", { fg = C.ui.dim })

-- Syntax.
hl("Boolean", { fg = C.syntax.boolean })
hl("Character", { link = "String" })
hl("Comment", { fg = C.syntax.comment })
hl("Constant", { fg = C.white })
hl("Delimiter", { fg = C.syntax.comment })
hl("Error", { fg = C.fg, bg = C.red })
hl("Float", { link = "Number" })
hl("Function", { fg = C.lavender2 })
hl("Identifier", { fg = C.fg })
hl("Number", { fg = C.yellow })
hl("Operator", { fg = C.syntax.operator })
hl("PreProc", { fg = C.syntax.macro })
hl("Special", { fg = C.fg })
hl("Statement", { fg = C.white, bold = true })
hl("String", { fg = C.green })
hl("Type", { fg = C.lavender })

-- -- Treesitter.
-- hl("@keyword.doxygen", { fg = C.blue })
-- hl("@keyword.function", { fg = C.blue })
-- hl("@keyword.modifier", { fg = C.blue })
-- hl("@keyword.type", { fg = C.blue })
hl("@markup", { link = "@none" })
hl("@string.documentation", { link = "Comment" })
hl("@module", { fg = C.fg })
hl("@variable", { fg = C.fg })
-- hl("@string.escape", { fg = C.purple })
hl("@type.builtin", { link = "Type" })
hl("@function.builtin", { link = "Function" })
--hl("@constant.builtin", { link = "Type" })

-- Treesitter (todo).
hl("@comment.error", { fg = C.red, bold = true })
hl("@comment.note", { fg = C.blue, bold = true })
hl("@comment.todo", { fg = C.white, bold = true })
hl("@comment.warning", { fg = C.yellow, bold = true })

-- Treesitter (diff).
hl("@attribute.diff", { fg = C.syntax.comment })
hl("@constant.diff", { fg = C.syntax.comment })
hl("@constructor.lua", { fg = C.syntax.comment })
hl("@function.diff", { fg = C.syntax.comment })
hl("@keyword.diff", { fg = C.syntax.comment })
hl("@number.diff", { fg = C.syntax.comment })
hl("@punctuation.special.diff", { fg = C.syntax.comment })
hl("@string.special.path.diff", { fg = C.syntax.comment })
hl("@variable.parameter.diff", { fg = C.syntax.comment })

-- Git.
hl("Added", { fg = C.green })
hl("Changed", { fg = C.lavender2 })
hl("Removed", { fg = C.red })

-- Fugitive.
hl("fugitiveCount", { fg = C.rhythm2 })
hl("fugitiveHeader", { fg = C.rhythm, bold = true })
hl("fugitiveHeading", { fg = C.lavender2, bold = true })
hl("fugitiveModifier", { fg = C.rhythm, bold = true })
hl("fugitiveSection", { fg = C.syntax.comment })
hl("fugitiveStagedHeading", { link = "fugitiveHeading" })
hl("fugitiveStagedModifier", { link = "fugitiveModifier" })
hl("fugitiveSymbolicRef", { fg = C.rhythm2 })
hl("fugitiveUnstagedHeading", { link = "fugitiveHeading" })
hl("fugitiveUnstagedModifier", { link = "fugitiveModifier" })
hl("fugitiveUntrackedHeading", { link = "fugitiveHeading" })
hl("fugitiveUntrackedModifier", { link = "fugitiveModifier" })

-- Others.
hl("ColorColumn", { fg = C.dim })
hl("VirtColumn", { link = "ColorColumn" })
