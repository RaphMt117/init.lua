-- define root dir based in:
vim.g.root_spec = { { ".git", "lua" }, "lsp", "cwd" }

local opt = vim.opt

opt.number = true -- current line numbers
opt.relativenumber = true -- relative line nubers

-- nvim autoformat
vim.g.autoformat = true

opt.encoding = "utf-8"
opt.hidden = true

-- indentation, set to 4 spaces
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = false

opt.conceallevel = 2
opt.concealcursor = "nc"

-- undo
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.wrap = false -- disable line wrap

-- vertical and horizontal scroll off
opt.scrolloff = 10
opt.sidescrolloff = 14

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

opt.autoread = true -- automatic reload file on buffer changed outside of vim

-- sane splits
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"
opt.splitkeep = "topline" -- Stabilize the cursor position when creating/deleting horizontal splits

opt.formatoptions = vim.o.formatoptions .. "n" -- detect lists for formatting

-- visuals
opt.termguicolors = true
opt.cursorline = true
opt.colorcolumn = "0"
opt.signcolumn = "yes" -- Always draw sign column. Prevent buffer moving when adding/deleting sign.

opt.showmode = false -- mode is shown in lualine

-- opt.listchars = "nbsp:¬,extends:»,precedes:«,trail:•" -- show some invisible characters - removed "tab: >"
opt.list = false -- show problematic characters.

opt.mouse = "a" -- enable mouse

opt.pumblend = 10 -- Popup blend

opt.isfname:append("@-@")

opt.updatetime = 50 -- faster update time

vim.g.markdown_recommended_style = 0 -- fix markdown indentation
