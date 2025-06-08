-- Color.
vim.opt.termguicolors = true

-- Display.
vim.opt.shortmess = "I"
vim.opt.showmode = false

-- Column.
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = { "80", "100" }
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4

-- Scroll.
vim.opt.scrolloff = 8

-- Search.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Substitute.
vim.opt.inccommand = "split"

-- Fold.
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99

-- Wrap.
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = "> "

-- Split.
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Mouse.
vim.opt.mouse = "a"

-- Backup.
vim.opt.swapfile = true
vim.opt.backup = true
vim.opt.undofile = true
vim.opt.directory = os.getenv("XDG_STATE_HOME") .. "/nvim/swap"
vim.opt.backupdir = os.getenv("XDG_STATE_HOME") .. "/nvim/backup"
vim.opt.undodir = os.getenv("XDG_STATE_HOME") .. "/nvim/undo"

-- Status Bar.
vim.opt.laststatus = 3
