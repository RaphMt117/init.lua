-- set leader key to space
vim.g.mapleader = " "
-- less text
local keymap = vim.keymap

-- toggle file exporer
keymap.set("n", "<leader>e", "<cmd>Oil<CR>")

keymap.set("n", "<Leader>e", ":lua require('oil').open_float()<CR>")
keymap.set("n", "<Leader>p", ":lua require('oil.actions').toggle_hidden()<CR>")

-- C-Backspace to delete word in insert mode
vim.api.nvim_set_keymap("i", "<C-H>", "<C-W>", { noremap = true })

-- tabs
-- keymap.set("n", "<leader>tn", ":tabnew<CR>") -- open new tab
-- keymap.set("n", "<leader>tq", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>q", ":tabclose<CR>") -- close current tab
-- keymap.set("n", "<leader>tk", ":tabn<CR>") -- go to next tab
-- keymap.set("n", "<leader>tj", ":tabp<CR>") -- go to previous tab

-- resizing windows
keymap.set("n", "<M-.>", [[<cmd>vertical resize +5<cr>]]) -- make the window biger vertically
keymap.set("n", "<M-,>", [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically
keymap.set("n", "<M-=>", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
keymap.set("n", "<M-->", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

-- vim file explorer
keymap.set("n", "<leader>pv", "<cmd>Ex<CR>")

-- opens a new tmux window
vim.keymap.set("n", "<leader>nw", "<cmd>!tmux new-window<CR>")

-- opens lazygit in a new tmux window
vim.keymap.set("n", "<leader>lg", "<cmd>!tmux new-window -c " .. vim.fn.getcwd() .. " -- lazygit <CR><CR>")

-- Markdown Preview Toggle
keymap.set("n", "<leader>md", "<cmd>MarkdownPreviewToggle<CR>")

-- drag line on visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- put line below to the end of this line
keymap.set("n", "J", "mzJ`z")

-- Increment/decrement
keymap.set("n", "<leader>=", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("n", "x", '"_x')

-- salvar
keymap.set("n", "<leader>w", ":w<CR>")
keymap.set({ "n", "i" }, "<C-s>", ":w<CR>")

-- better indenting
keymap.set("v", "<", "<gv", { noremap = true, silent = true })
keymap.set("v", ">", ">gv", { noremap = true, silent = true })

-- up and down faster
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- normal mode on C-c and jk
keymap.set("i", "<C-c>", "<Esc>")
keymap.set("i", "jk", "<ESC>")

-- keymap.set("n", "<leader>f", vim.lsp.buf.format)

keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- telescope

keymap.set("n", "<leader><leader>", "<cmd>Telescope find_files<CR>")
keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>")
keymap.set("n", "<leader>fp", "<cmd>Telescope git_files<CR>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>f.", "<cmd>Telescope current_buffer_fuzzy_find<CR>")
keymap.set("n", "<leader>km", "<cmd>Telescope keymaps<CR>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
-- telescope undo
keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")

-- command line
keymap.set("n", "<C-space>", ":")

-- keymap.set("n", "<C-x>", "Telescope buffers")

-- close neovim
keymap.set("n", "<leader>0", ":q!<CR>")

keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/raphmt/plugins.lua<CR>")
keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")
