local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- Keep cursor centered when scrolling
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- Move selected line / block of text in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Fast saving
map("n", "<leader>w", ":w!<CR>", { silent = true, desc = "Save file" })
map("n", "<leader>q", ":q!<CR>", opts)

-- close neovim, close tab, close anithing (without saving)
map("n", "<leader>0", ":q!<CR>", { noremap = true, silent = true })

-- Remap for dealing with visual line wraps
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- paste over currently selected text without yanking it
map("v", "p", '"_dp')
map("v", "P", '"_dP')

-- yank everything between { and } including the brackets
map("n", "YY", "va{Vy", opts)

-- Move line on the screen rather than by line in the file
map("n", "j", "gj", opts)
map("n", "k", "gk", opts)

-- Exit on jj and jk
map("i", "jj", "<ESC>", opts)
map("i", "jk", "<ESC>", opts)

-- Move to start/end of line
map({ "n", "x", "o" }, "H", "^", opts)
map({ "n", "x", "o" }, "L", "g_", opts)

-- Navigate buffers
map("n", "<Right>", ":bnext<CR>", opts)
map("n", "<Left>", ":bprevious<CR>", opts)

-- Panes resizing
map("n", "+", ":vertical resize +5<CR>")
map("n", "_", ":vertical resize -5<CR>")
map("n", "=", ":resize +5<CR>")
map("n", "-", ":resize -5<CR>")

-- Map enter to ciw in normal mode
map("n", "<CR>", "ciw", opts)
map("n", "<BS>", "ci", opts)

-- ??
map("n", "n", "nzzv", opts)
map("n", "N", "Nzzv", opts)
map("n", "*", "*zzv", opts)
map("n", "#", "#zzv", opts)
map("n", "g*", "g*zz", opts)
map("n", "g#", "g#zz", opts)

-- map ; to resume last search
map("n", ";", "<cmd>Telescope resume<cr>", opts)

-- search current buffer
map("n", "<C-s>", ":Telescope current_buffer_fuzzy_find<CR>", opts)

-- Split line with X
map("n", "X", ":keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>", { silent = true })

-- Select all
map("n", "<C-a>", "ggVG", opts)

map("n", "<C-P>", ':lua require("config.utils").toggle_go_test()<CR>', opts)

map("n", "<Esc>", ":nohlsearch<CR>", opts)

--------------------------------------

-- tabs
map("n", "<leader>tn", ":tabnew<CR>", { noremap = true }) -- open new tab
map("n", "<leader>to", ":tabonly<CR>", { noremap = true }) -- next tab
map("n", "<S-l>", ":tabnext<CR>", { noremap = true }) -- next tab
map("n", "<S-h>", ":tabprevious<CR>", { noremap = true }) -- next tab

map("n", "<leader>v", ":vsplit<CR>", { noremap = true }) -- split vertically
map("n", "<leader>h", ":split<CR>", { noremap = true }) -- split horizontally

-- opens lazygit in a new tmux window
map("n", "<leader>gg", "<cmd>!tmux new-window -c " .. vim.fn.getcwd() .. " -- lazygit <CR><CR>", { noremap = true })

-- rename globally
map("n", "<leader>rg", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

map("i", "<C-c>", "<Esc>", { noremap = true })

map("n", "<leader>bg", "<cmd> VimBeGood <CR>")

map("n", "<leader>rn", vim.lsp.buf.rename)
map("n", "<leader>a", vim.lsp.buf.code_action)

-- go to definition
map("n", "gd", function()
	vim.lsp.buf.definition()
end)

-- Diagnostic keymaps
map("n", "[x", vim.diagnostic.goto_prev)
map("n", "]x", vim.diagnostic.goto_next)
map("n", "<leader>i", vim.diagnostic.open_float)

-- yank and paste between tmux session
map({ "n", "v" }, "<leader>y", [["+y]], { noremap = true, silent = true })
map("n", "<leader>Y", [["+Y]], { noremap = true, silent = true })
map("n", "<leader>p", [["+p]], { noremap = true, silent = true })

-- open lazy menu
map("n", "<leader>l", "<cmd>Lazy<CR>", { noremap = true, silent = true })

-- close neovim, close tab, close anithing (without saving)
map("n", "<leader>0", ":q!<CR>", { noremap = true, silent = true })

map("n", "x", '"_x', { noremap = true, silent = true })
