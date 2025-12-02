local map = require("dial.map")
local augend = require("dial.augend")
local config = require("dial.config")

config.augends:register_group({
  default = {
    augend.constant.alias.bool,
    augend.constant.alias.Bool,
    augend.date.alias["%H:%M"],
    augend.date.alias["%Y-%m-%d"],
    augend.date.alias["%Y/%m/%d"],
    augend.date.alias["%m/%d"],
    augend.integer.alias.binary,
    augend.integer.alias.decimal_int,
    augend.integer.alias.hex,
    augend.misc.alias.markdown_header,
    augend.semver.alias.semver,
  },
})

local function manipulate(direction, mode, group_name, count)
  return function()
    map.manipulate(direction, mode, group_name, count)
  end
end

vim.keymap.set("n", "<C-a>", manipulate("increment", "normal"))
vim.keymap.set("n", "<C-x>", manipulate("decrement", "normal"))
vim.keymap.set("n", "g<C-a>", manipulate("increment", "gnormal"))
vim.keymap.set("n", "g<C-x>", manipulate("decrement", "gnormal"))
vim.keymap.set("x", "<C-a>", manipulate("increment", "visual"))
vim.keymap.set("x", "<C-x>", manipulate("decrement", "visual"))
vim.keymap.set("x", "g<C-a>", manipulate("increment", "gvisual"))
vim.keymap.set("x", "g<C-x>", manipulate("decrement", "gvisual"))
