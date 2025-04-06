local flake = require("flake")
local C = flake.colors

vim.cmd([[hi clear]])
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

--- @param name string
--- @param val vim.api.keyset.highlight
local function hl(name, val)
  vim.api.nvim_set_hl(0, name, val)
end

-- Base.
hl("Normal", { fg = C.fg, bg = C.bg })
hl("NormalFloat", { fg = C.fg, bg = C.ui.float_bg })

-- Interface.
hl("LineNr", { fg = C.fg, bg = C.bg, bold = true })
hl("LineNrAbove", { fg = C.dim, bg = C.bg })
hl("LineNrBelow", { fg = C.dim, bg = C.bg })
hl("SignColumn", { bg = C.bg })
hl("StatusLine", { fg = C.ui.status_fg, bg = C.ui.status_bg })
hl("TabLine", { fg = C.syntax.comment, bg = C.bg })
hl("TabLineSel", { fg = C.teal, bg = C.bg, bold = true })
hl("WinSeparator", { fg = C.dim })

-- Syntax.
hl("Boolean", { fg = C.syntax.boolean })
hl("Character", { link = "String" })
hl("Comment", { fg = "#4d3e58" })
hl("Comment", { fg = C.syntax.comment })
hl("Constant", { fg = C.pink })
hl("Delimiter", { fg = C.syntax.comment })
hl("Error", { fg = C.fg, bg = C.red })
hl("Float", { link = "Number" })
hl("Function", { fg = C.syntax.func })
hl("Identifier", { fg = C.fg })
hl("Number", { fg = C.syntax.number })
hl("Operator", { fg = C.syntax.operator })
hl("PreProc", { fg = C.syntax.macro })
hl("Special", { fg = C.fg })
hl("Statement", { fg = C.syntax.keyword })
hl("String", { fg = C.syntax.string })
hl("Type", { fg = C.fg })

-- Treesitter.
hl("@keyword.doxygen", { fg = C.blue })
hl("@keyword.function", { fg = C.blue })
hl("@keyword.modifier", { fg = C.blue })
hl("@keyword.type", { fg = C.blue })
hl("@markup", { link = "@none" })
hl("@string.documentation", { link = "Comment" })
hl("@string.escape", { fg = C.purple })
hl("@type.builtin", { fg = C.blue })

-- Treesitter (todo).
hl("@comment.error", { fg = C.red, bold = true })
hl("@comment.note", { fg = C.blue, bold = true })
hl("@comment.todo", { fg = C.green, bold = true })
hl("@comment.warning", { fg = C.yellow, bold = true })

-- Treesitter (diff).
hl("@attribute.diff", { fg = C.syntax.comment })
hl("@constant.diff", { fg = C.syntax.comment })
hl("@function.diff", { fg = C.syntax.comment })
hl("@keyword.diff", { fg = C.syntax.comment })
hl("@number.diff", { fg = C.syntax.comment })
hl("@punctuation.special.diff", { fg = C.syntax.comment })
hl("@string.special.path.diff", { fg = C.syntax.comment })
hl("@variable.parameter.diff", { fg = C.syntax.comment })

-- Git.
hl("Added", { fg = C.git.added })
hl("Changed", { fg = C.git.changed })
hl("Removed", { fg = C.git.removed })

-- Fugitive.
hl("fugitiveCount", { fg = C.rhythm2 })
hl("fugitiveHeader", { fg = C.rhythm, bold = true })
hl("fugitiveHeading", { fg = C.blue, bold = true })
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
