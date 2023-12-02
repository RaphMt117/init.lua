vim.opt.relativenumber = true

-- indentação
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- undo
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- quebra de linha
vim.opt.wrap = true

-- search settings
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- aparência
vim.opt.termguicolors = true
vim.opt.cursorline = true
--vim.cmd.colorscheme("catppuccin")
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "0"
vim.opt.scrolloff = 10

vim.opt.isfname:append("@-@")

--
vim.opt.updatetime = 50
