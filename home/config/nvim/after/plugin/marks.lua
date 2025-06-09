local marks = require("marks")

marks.setup({
  default_mappings = false,
  mappings = {
    set_next = "m,",
    delete = "dm",
    delete_buf = "dm*",
    preview = "m:",
    next = "}",
    prev = "{",
  },
})

vim.keymap.set("n", "m<c-q>", "<cmd>MarksQFListBuf<cr>")
