local harpoon = require("harpoon")

harpoon:setup({
  settings = {
    save_on_toggle = true,
  },
})

vim.keymap.set("n", "<c-g>", function()
  harpoon:list():add()
end)
vim.keymap.set("n", "<c-l>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list(), {
    border = "rounded",
    title_pos = "center",
  })
end)

vim.keymap.set("n", "<c-h>", function()
  harpoon:list():select(1)
end)
vim.keymap.set("n", "<c-t>", function()
  harpoon:list():select(2)
end)
vim.keymap.set("n", "<c-n>", function()
  harpoon:list():select(3)
end)
vim.keymap.set("n", "<c-s>", function()
  harpoon:list():select(4)
end)
