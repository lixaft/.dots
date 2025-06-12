local util = require("conform.util")

---@type conform.FileFormatterConfig
return {
  meta = {
    url = "https://github.com/mesonbuild/meson",
    description = "The Meson Build System",
  },
  command = "meson",
  args = {
    "format",
    "-",
  },
  stdin = true,
  cwd = util.root_file({
    ".git",
  }),
}
