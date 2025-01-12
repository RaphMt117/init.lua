local o = vim.opt
local g = vim.g

-- define root dir based in:
g.root_spec = { { ".git", "lua" }, "lsp", "cwd" }

g.mapleader = " " -- change leader to a space
g.maplocalleader = " " -- change localleader to a space

g.autoformat = true -- nvim autoformat

g.loaded_netrw = 1 -- disable netrw
g.loaded_netrwPlugin = 1 --  disable netrw

o.incsearch = true -- make search act like search in modern browsers
o.backup = false -- creates a backup file
o.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
o.cmdheight = 1 -- more space in the neovim command line for displaying messages
o.completeopt = { "menu", "menuone", "noselect" } -- mostly just for cmp
o.conceallevel = 0 -- so that `` is visible in markdown files
o.fileencoding = "utf-8" -- the encoding written to a file
o.hlsearch = true -- highlight all matches on previous search pattern
o.ignorecase = true -- ignore case in search patterns
o.mouse = "a" -- allow the mouse to be used in neovim
o.pumheight = 10 -- pop up menu height
o.showmode = false -- we don't need to see things like -- INSERT -- anymore
o.showtabline = 0 -- always show tabs
o.smartcase = true -- smart case
o.smartindent = true -- make indenting smarter again
o.splitbelow = true -- force all horizontal splits to go below current window
o.splitright = true -- force all vertical splits to go to the right of current window
o.swapfile = false -- creates a swapfile
o.termguicolors = true -- set term gui colors (most terminals support this)
o.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
o.undofile = true -- enable persistent undo
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.updatetime = 100 -- faster completion (4000ms default)
o.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
o.expandtab = true -- convert tabs to spaces
o.shiftwidth = 2 -- the number of spaces inserted for each indentation
o.cursorline = false -- highlight the current line
o.number = true -- set numbered lines
o.breakindent = true -- wrap lines with indent
o.relativenumber = true -- set relative numbered lines
o.numberwidth = 2 -- set number column width to 2 {default 4}
o.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
o.showcmd = false -- Don't show the command in the last line
o.ruler = false -- Don't show the ruler
o.guifont = "monospace:h17" -- the font used in graphical neovim applications
o.title = true -- set the title of window to the value of the titlestring
o.fillchars = { eob = " " } -- change the character at the end of buffer

-- vim.o.cursorlineopt = "number"              -- set the cursorline

o.tabstop = 4 -- insert 4 spaces for a tab
o.softtabstop = 4
o.expandtab = true
o.shiftwidth = 4
o.smartindent = false

o.laststatus = 0 -- Always display the status line

o.wrap = true

o.scrolloff = 10
o.sidescrolloff = 14

o.conceallevel = 0 -- so that `` is visible in markdown files
o.concealcursor = "nc"

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
o.whichwrap:append("<>[]hl")

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

-- shortmess
-- I -> don't show intro message
-- O -> file-read message overwrites previous
-- o -> file-read message
-- c -> completion messages
-- T -> truncate file messages at start
-- t -> truncate file messages in middle
-- l -> use internal grep
-- i -> case insensitive search
o.shortmess = "IOocTtli"

o.autoread = true -- automatic reload file on buffer changed outside of vim

o.splitkeep = "screen"
o.splitkeep = "topline" -- Stabilize the cursor position when creating/deleting horizontal splits

o.formatoptions = vim.o.formatoptions .. "n" -- detect lists for formatting

-- visuals
o.colorcolumn = "95"

o.list = false -- don't show problematic characters.

-- add binaries installed by mason.nvim to path
-- local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
-- vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH

-- o.pumblend = 10 -- Popup blend
-- o.isfname:append("@-@")
