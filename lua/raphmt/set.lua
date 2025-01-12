local opt = vim.opt

-- define root dir based in:
vim.g.root_spec = { { ".git", "lua" }, "lsp", "cwd" }

vim.cmd("colorscheme midnight")

-- opt.guicursor = ""

vim.g.loaded_netrw = 1 -- disable netrw
vim.g.loaded_netrwPlugin = 1 --  disable netrwnetrw

opt.number = true -- current line numbers
opt.relativenumber = true -- relative line nubers
opt.numberwidth = 2
opt.ruler = false

-- nvim autoformat
vim.g.autoformat = true

opt.encoding = "utf-8"
-- opt.hidden = true
opt.timeoutlen = 400

-- indentation, set to 4 spaces
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = false

-- opt.conceallevel = 2
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.concealcursor = "nc"

-- undo
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.wrap = true -- line wrap

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
opt.colorcolumn = "95"
opt.signcolumn = "yes" -- Always draw sign column. Prevent buffer moving when adding/deleting sign.
opt.clipboard = "unnamedplus"
opt.showcmd = false
opt.ruler = false
opt.laststatus = 0 -- Always display the status line
-- opt.cursorline = true

opt.showmode = false -- mode is shown in lualine

-- opt.listchars = "nbsp:¬,extends:»,precedes:«,trail:•" -- show some invisible characters - removed "tab: >"
opt.list = false -- show problematic characters.

-- disable some default providers
-- for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
-- 	vim.g["loaded_" .. provider .. "_provider"] = 0
-- end

-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH

opt.updatetime = 100
opt.mouse = "a"

-- opt.pumblend = 10 -- Popup blend
opt.isfname:append("@-@")
