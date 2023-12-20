local opt = vim.opt
local g = vim.g

g.mapleader = " "

-- define root dir based in:
vim.g.root_spec = { { ".git", "lua" }, "lsp", "cwd" }

opt.number = true -- current line numbers
opt.relativenumber = true -- relative line nubers
opt.numberwidth = 4
opt.ruler = false

-- nvim autoformat
vim.g.autoformat = true

opt.encoding = "utf-8"
opt.hidden = true
opt.timeoutlen = 400

-- indentation, set to 4 spaces
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
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
opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

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
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.colorcolumn = "0"
opt.signcolumn = "yes" -- Always draw sign column. Prevent buffer moving when adding/deleting sign.

opt.showmode = false -- mode is shown in lualine

opt.listchars = "nbsp:¬,extends:»,precedes:«,trail:•" -- show some invisible characters - removed "tab: >"
opt.list = false -- show problematic characters.

-- disable some default providers
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
	vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH

opt.mouse = "a" -- enable mouse

opt.pumblend = 10 -- Popup blend

opt.isfname:append("@-@")

opt.updatetime = 250 -- faster update time

g.markdown_recommended_style = 0 -- fix markdown indentation
