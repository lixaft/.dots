local c = require("flake").colors

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
hl("Normal", { fg = c.fg, bg = c.bg })
hl("NormalFloat", { fg = c.fg, bg = c.bg2 })

-- Interface.
hl("EndOfBuffer", { fg = c.black })
hl("LineNr", { fg = c.fg, bold = true })
hl("LineNrAbove", { fg = c.ui.dim })
hl("LineNrBelow", { fg = c.ui.dim })
hl("Pmenu", { fg = c.fg, bg = "#0a0a0d" })
hl("PmenuKind", { fg = c.lavender })
hl("PmenuKindSel", { fg = c.lavender })
hl("PmenuSBar", { bg = c.black })
hl("PmenuSel", { fg = c.lavender, bg = c.ui.selection, bold = true })
hl("Search", { bg = "#383858" })
hl("CurSearch", { bg = "#585888", bold = true })
hl("PmenuThumb", { bg = c.lavender })
hl("SignColumn", { bg = c.bg })
hl("StatusLine", { fg = c.status.fg, bg = c.status.bg })
hl("TabLine", { fg = c.status.fg, bg = c.status.bg })
hl("TabLineSel", { fg = c.fg, bold = true })
hl("Visual", { bg = c.ui.selection })
hl("WinSeparator", { fg = c.ui.separator })
hl("MatchParen", { bg = c.red })

-- Syntax.
hl("Boolean", { fg = c.syntax.boolean })
hl("Character", { link = "String" })
hl("Comment", { fg = c.syntax.comment })
hl("Constant", { fg = c.syntax.constant })
hl("Delimiter", { fg = c.syntax.punctuation })
hl("Error", { fg = c.fg, bg = c.red })
hl("Float", { link = "Number" })
hl("Function", { fg = c.syntax["function"] })
hl("Identifier", { fg = c.syntax.identifier })
hl("Number", { fg = c.syntax.number })
hl("Operator", { fg = c.syntax.operator })
hl("Special", { fg = c.fg })
hl("Statement", { fg = c.syntax.keyword, bold = true })
hl("String", { fg = c.syntax.string })
hl("Type", { fg = c.syntax.type })

-- -- Treesitter.
hl("@markup", { link = "@none" })
hl("@string.documentation", { link = "Comment" })
hl("@module", { fg = c.fg })
hl("@variable", { fg = c.fg })
hl("@string.escape", { fg = c.fg })
hl("@type.builtin", { link = "Type" })
hl("@function.builtin", { link = "Function" })

-- Treesitter (todo).
hl("@comment.error", { fg = c.red, bold = true })
hl("@comment.note", { fg = c.blue, bold = true })
hl("@comment.todo", { fg = c.white, bold = true })
hl("@comment.warning", { fg = c.yellow, bold = true })

-- Treesitter (diff).
hl("@attribute.diff", { fg = c.syntax.comment })
hl("@constant.diff", { fg = c.syntax.comment })
hl("@function.diff", { fg = c.syntax.comment })
hl("@keyword.diff", { fg = c.syntax.comment })
hl("@number.diff", { fg = c.syntax.comment })
hl("@punctuation.special.diff", { fg = c.syntax.comment })
hl("@string.special.path.diff", { fg = c.syntax.comment })
hl("@variable.parameter.diff", { fg = c.syntax.comment })
hl("@constructor.lua", { fg = c.syntax.comment })

-- Git.
hl("Added", { fg = c.green })
hl("Changed", { fg = c.lavender2 })
hl("Removed", { fg = c.red })

-- Fugitive.
hl("fugitiveCount", { fg = c.yellow })
hl("fugitiveHeader", { fg = c.lavender, bold = true })
hl("fugitiveHeading", { fg = c.white, bold = true })
hl("fugitiveModifier", { fg = c.lavender, bold = true })
hl("fugitiveSection", { fg = c.fg })
hl("fugitiveStagedHeading", { link = "fugitiveHeading" })
hl("fugitiveStagedModifier", { link = "fugitiveModifier" })
hl("fugitiveStagedSection", { link = "fugitiveSection" })
hl("fugitiveSymbolicRef", { fg = c.lavender2 })
hl("fugitiveUnstagedHeading", { link = "fugitiveHeading" })
hl("fugitiveUnstagedModifier", { link = "fugitiveModifier" })
hl("fugitiveUnstagedSection", { link = "fugitiveSection" })
hl("fugitiveUntrackedHeading", { link = "fugitiveHeading" })
hl("fugitiveUntrackedModifier", { link = "fugitiveModifier" })
hl("fugitiveUntrackedSection", { link = "fugitiveSection" })

-- TreesitterContext.
hl("TreesitterContext", { fg = c.bg })
hl("TreesitterContextLineNumber", { fg = c.ui.dim })
hl("TreesitterContextSeparator", { fg = c.ui.separator })

-- VirtColumn.
hl("VirtColumn", { fg = c.black, bg = c.bg })

-- Markdown.
hl("RenderMarkdownCode", { bg = c.bg2 })
