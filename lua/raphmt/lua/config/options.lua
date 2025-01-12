vim.g.mapleader = " " -- change leader to a space
vim.g.maplocalleader = " " -- change localleader to a space

vim.g.loaded_netrw = 1 -- disable netrw
vim.g.loaded_netrwPlugin = 1 --  disable netrw

vim.opt.incsearch = true -- make search act like search in modern browsers
vim.opt.backup = false -- creates a backup file
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 0 -- always show tabs
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 100 -- faster completion (4000ms default)
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.cursorline = false -- highlight the current line
vim.opt.number = true -- set numbered lines
vim.opt.breakindent = true -- wrap lines with indent
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false -- display lines as one long line
vim.opt.scrolloff = 8 -- Makes sure there are always eight lines of context
vim.opt.sidescrolloff = 8 -- Makes sure there are always eight lines of context
vim.opt.showcmd = false -- Don't show the command in the last line
vim.opt.ruler = false -- Don't show the ruler
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.title = true -- set the title of window to the value of the titlestring
vim.opt.confirm = true -- confirm to save changes before exiting modified buffer
vim.opt.fillchars = { eob = " " } -- change the character at the end of buffer
-- vim.opt.guicursor = ""                          -- set the cursor to be a vertical bar

-- vim.opt.cursorlineopt = "number"              -- set the cursorline
-- vim.opt.tabstop = 2                           -- insert 2 spaces for a tab
vim.opt.laststatus = 0 -- Always display the status line

vim.filetype.add({
	extension = {
		env = "dotenv",
	},
	filename = {
		[".env"] = "dotenv",
		["env"] = "dotenv",
	},
	pattern = {
		["[jt]sconfig.*.json"] = "jsonc",
		["%.env%.[%w_.-]+"] = "dotenv",
	},
})

-------------------------------------------------

local opt = vim.opt

-- define root dir based in:
vim.g.root_spec = { { ".git", "lua" }, "lsp", "cwd" }

-- vim.cmd("colorscheme midnight")

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
