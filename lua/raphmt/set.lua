-- set relative and current line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- nvim autoformat
vim.g.autoformat = true

-- indentation, set to 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- undo
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- disable line wrap
vim.opt.wrap = false

-- vertical and horizontal scroll off
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 12

-- search settings
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- tabs
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitkeep = "screen"
vim.opt.splitright = true -- Put new windows right of current

-- visuals
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "0"

-- mode is shown in lualine
vim.opt.showmode = false

-- Show some invisible characters
vim.opt.list = true

-- enable mouse
vim.opt.mouse = "a"

-- Popup blend
vim.opt.pumblend = 10

-- vim.opt.isfname:append("@-@")

-- faster update time
vim.opt.updatetime = 50

-- fix markdown indentation
vim.g.markdown_recommended_style = 0
