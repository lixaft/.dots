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

vim.keymap.set("n", "<leader>gt", ":so /home/lixaft/.dots/home/configs/nvim/colors/flakeTheme.lua<cr>")

-- Base.
hl("Normal", { fg = C.fg, bg = C.bg })
hl("NormalFloat", { fg = C.fg, bg = C.bg2 })

-- Interface.
hl("EndOfBuffer", { fg = C.black })
hl("LineNr", { fg = C.fg, bold = true })
hl("LineNrAbove", { fg = C.ui.dim })
hl("LineNrBelow", { fg = C.ui.dim })
hl("Pmenu", { fg = C.fg, bg = "#0a0a0d" })
hl("PmenuKind", { fg = C.lavender })
hl("PmenuKindSel", { fg = C.lavender })
hl("PmenuSBar", { bg = C.black })
hl("PmenuSel", { fg = C.lavender, bg = C.ui.selection, bold = true })
hl("Search", { bg = "#383858" })
hl("CurSearch", { bg = "#585888", bold = true })
hl("PmenuThumb", { bg = C.lavender })
hl("SignColumn", { bg = C.bg })
hl("StatusLine", { fg = C.status.fg, bg = C.status.bg })
hl("TabLine", { fg = C.status.fg, bg = C.status.bg })
hl("TabLineSel", { fg = C.fg, bold = true })
hl("Visual", { bg = C.ui.selection })
hl("WinSeparator", { fg = C.ui.dim })
hl("MatchParen", { bg = C.red })

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
hl("@markup", { link = "@none" })
hl("@string.documentation", { link = "Comment" })
hl("@module", { fg = C.fg })
hl("@variable", { fg = C.fg })
hl("@string.escape", { fg = C.fg })
hl("@type.builtin", { link = "Type" })
hl("@function.builtin", { link = "Function" })

-- Treesitter (todo).
hl("@comment.error", { fg = C.red, bold = true })
hl("@comment.note", { fg = C.blue, bold = true })
hl("@comment.todo", { fg = C.white, bold = true })
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
hl("@constructor.lua", { fg = C.syntax.comment })

-- Git.
hl("Added", { fg = C.green })
hl("Changed", { fg = C.lavender2 })
hl("Removed", { fg = C.red })

-- Fugitive.
hl("fugitiveCount", { fg = C.yellow })
hl("fugitiveHeader", { fg = C.lavender, bold = true })
hl("fugitiveHeading", { fg = C.white, bold = true })
hl("fugitiveModifier", { fg = C.lavender, bold = true })
hl("fugitiveSection", { fg = C.fg })
hl("fugitiveStagedHeading", { link = "fugitiveHeading" })
hl("fugitiveStagedModifier", { link = "fugitiveModifier" })
hl("fugitiveStagedSection", { link = "fugitiveSection" })
hl("fugitiveSymbolicRef", { fg = C.lavender2 })
hl("fugitiveUnstagedHeading", { link = "fugitiveHeading" })
hl("fugitiveUnstagedModifier", { link = "fugitiveModifier" })
hl("fugitiveUnstagedSection", { link = "fugitiveSection" })
hl("fugitiveUntrackedHeading", { link = "fugitiveHeading" })
hl("fugitiveUntrackedModifier", { link = "fugitiveModifier" })
hl("fugitiveUntrackedSection", { link = "fugitiveSection" })

-- TreesitterContext.
hl("TreesitterContext", { fg = C.bg })
hl("TreesitterContextLineNumber", { fg = C.ui.dim })
hl("TreesitterContextSeparator", { fg = C.ui.dim })

-- VirtColumn.
hl("VirtColumn", { fg = C.black, bg = C.bg })

-- Markdown.
hl("RenderMarkdownCode", { bg = C.bg2 })
