vim.g.root_spec = { { ".git", "lua" }, "lsp", "cwd" }
local opt = vim.opt

-- set relative and current line numbers
opt.number = true
opt.relativenumber = true

-- nvim autoformat
vim.g.autoformat = true

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

-- tabs
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current

-- visuals
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.colorcolumn = "0"

-- mode is shown in lualine
opt.showmode = false

-- Show some invisible characters
opt.list = true

-- enable mouse
opt.mouse = "a"

-- Popup blend
opt.pumblend = 10

-- vim.opt.isfname:append("@-@")

-- faster update time
opt.updatetime = 50

-- fix markdown indentation
vim.g.markdown_recommended_style = 0
