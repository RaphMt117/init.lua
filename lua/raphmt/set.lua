vim.g.root_spec = { { ".git", "lua" }, "lsp", "cwd" }
local opt = vim.opt

-- set relative and current line numbers
opt.number = true
opt.relativenumber = true

-- nvim autoformat
vim.g.autoformat = true

opt.encoding = "utf-8"
opt.hidden = true

-- indentation, set to 4 spaces
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- undo
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- disable line wrap
opt.wrap = false

-- vertical and horizontal scroll off
opt.scrolloff = 10
opt.sidescrolloff = 12

-- search settings
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- shortmess
-- I -> don't show intro message
-- O -> file-read message overwrites previous
-- o -> file-read message
-- c -> completion messages
-- T -> truncate file messages at start
-- t -> truncate file messages in middle
-- l -> use internal grep
-- i -> case insensitive search
opt.shortmess = "IOocTtli"

-- automatic reload file on buffer changed outside of vim
opt.autoread = true

-- sane splits
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"

opt.formatoptions = vim.o.formatoptions .. "n" -- detect lists for formatting

-- visuals
opt.termguicolors = true
opt.cursorline = true
opt.colorcolumn = "0"
-- Always draw sign column. Prevent buffer moving when adding/deleting sign.
opt.signcolumn = "yes"

-- mode is shown in lualine
opt.showmode = false

-- show some invisible characters
-- opt.list = true
opt.listchars = "tab: >,nbsp:¬,extends:»,precedes:«,trail:•"

-- show problematic characters.
opt.list = true

-- Stabilize the cursor position when creating/deleting horizontal splits
opt.splitkeep = "topline"

-- enable mouse
opt.mouse = "a"

-- Popup blend
opt.pumblend = 10

-- vim.opt.isfname:append("@-@")

-- faster update time
opt.updatetime = 50

-- fix markdown indentation
vim.g.markdown_recommended_style = 0
