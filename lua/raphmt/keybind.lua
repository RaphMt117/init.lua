-- set leader key
vim.g.mapleader = " "

-- toggle file exporer
vim.keymap.set("n", "<leader>1", "<cmd>Neotree toggle<CR>")



-- tabs 
vim.keymap.set("n", "<C-t>", ":tabnew<CR>") -- open new tab 
vim.keymap.set("n", "<C-w>", ":tabclose<CR>") -- close current tab
vim.keymap.set("n", "<leader>q", ":tabclose<CR>") -- close current tab
vim.keymap.set("n", "<C-h>", ":tabn<CR>") -- go to next tab
vim.keymap.set("n", "<C-l>", ":tabp<CR>") -- go to previous tab

-- vim file explorer
vim.keymap.set("n", "<leader>pv", "<cmd>Ex<CR>")

-- drag line on visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- put line below to the end of this line 
vim.keymap.set("n", "J", "mzJ`z")

-- salvar
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set({"n","i"}, "<C-s>", ":w<CR>")

-- better indenting
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })

-- up and down faster
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- normal mode on C-c and jk
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("i", "jk", "<ESC>")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- telescope 
local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fp", "<cmd>Telescope git_files<CR>")
vim.keymap.set("n", "<leader>.", "<cmd>Telescope current_buffer_fuzzy_find<CR>")
vim.keymap.set("n", "<leader>km", "<cmd>Telescope keymaps<CR>")
-- telescope undo
vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")

-- command line
vim.keymap.set("n", "<C-space>", ":")

-- close neovim
vim.keymap.set("n", "<leader>0", ":q!<CR>")

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/raphmt/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

