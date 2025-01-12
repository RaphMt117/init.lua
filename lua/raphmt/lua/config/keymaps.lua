local opts = { noremap = true, silent = true }
-- local map = vim.keymap.set

-- Keep cursor centered when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Move selected line / block of text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Fast saving
-- vim.keymap.set("n", "<leader>w", ":write!<CR>", { silent = true, desc = "Save file" })
-- vim.keymap.set("n", "<leader>q", ":q!<CR>", opts)

-- Remap for dealing with visual line wraps
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- paste over currently selected text without yanking it
vim.keymap.set("v", "p", '"_dp')
vim.keymap.set("v", "P", '"_dP')

-- copy everything between { and } including the brackets
-- p puts text after the cursor,
-- P puts text before the cursor.
vim.keymap.set("n", "YY", "va{Vy", opts)

-- Move line on the screen rather than by line in the file
vim.keymap.set("n", "j", "gj", opts)
vim.keymap.set("n", "k", "gk", opts)

-- Exit on jj and jk
vim.keymap.set("i", "jj", "<ESC>", opts)
vim.keymap.set("i", "jk", "<ESC>", opts)

-- Move to start/end of line
vim.keymap.set({ "n", "x", "o" }, "H", "^", opts)
vim.keymap.set({ "n", "x", "o" }, "L", "g_", opts)

-- Navigate buffers
vim.keymap.set("n", "<Right>", ":bnext<CR>", opts)
vim.keymap.set("n", "<Left>", ":bprevious<CR>", opts)

-- Panes resizing
vim.keymap.set("n", "+", ":vertical resize +5<CR>")
vim.keymap.set("n", "_", ":vertical resize -5<CR>")
vim.keymap.set("n", "=", ":resize +5<CR>")
vim.keymap.set("n", "-", ":resize -5<CR>")

-- Map enter to ciw in normal mode
vim.keymap.set("n", "<CR>", "ciw", opts)
vim.keymap.set("n", "<BS>", "ci", opts)

vim.keymap.set("n", "n", "nzzv", opts)
vim.keymap.set("n", "N", "Nzzv", opts)
vim.keymap.set("n", "*", "*zzv", opts)
vim.keymap.set("n", "#", "#zzv", opts)
vim.keymap.set("n", "g*", "g*zz", opts)
vim.keymap.set("n", "g#", "g#zz", opts)

-- map ; to resume last search
-- map("n", ";", "<cmd>Telescope resume<cr>", opts)

-- search current buffer
vim.keymap.set("n", "<C-s>", ":Telescope current_buffer_fuzzy_find<CR>", opts)

-- Split line with X
vim.keymap.set("n", "X", ":keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>", { silent = true })

-- ctrl + x to cut full line
vim.keymap.set("n", "<C-x>", "dd", opts)

-- Select all
vim.keymap.set("n", "<C-a>", "ggVG", opts)

-- write file in current directory
-- :w %:h/<new-file-name>
vim.keymap.set("n", "<C-n>", ":w %:h/", opts)

-- delete forward
-- w{number}dw
-- delete backward
-- w{number}db

vim.keymap.set("n", "<C-P>", ':lua require("config.utils").toggle_go_test()<CR>', opts)

vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", opts)

--------------------------------------

local keymap = vim.keymap

-- toggle oil
keymap.set("n", "<Leader>e", ":lua require('oil').open()<CR>", { noremap = true })

-- toggle neotree
keymap.set("n", "<Leader>2", ":Neotree toggle <CR>", { noremap = true })

-- tabs
keymap.set("n", "<leader>t", ":tabnew<CR>", { noremap = true }) -- open new tab
keymap.set("n", "<S-l>", ":tabnext<CR>", { noremap = true }) -- next tab
keymap.set("n", "<S-h>", ":tabprevious<CR>", { noremap = true }) -- next tab
keymap.set("n", "<leader>o", ":tabonly<CR>", { noremap = true }) -- next tab

keymap.set("n", "<leader>q", ":tabclose<CR>", { noremap = true }) -- close current tab

keymap.set("n", "<leader>v", ":vsplit<CR>", { noremap = true }) -- split vertically
keymap.set("n", "<leader>h", ":split<CR>", { noremap = true }) -- split horizontally

vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover()
end)

-- opens lazygit in a new tmux window
keymap.set(
	"n",
	"<leader>gg",
	"<cmd>!tmux new-window -c " .. vim.fn.getcwd() .. " -- lazygit <CR><CR>",
	{ noremap = true }
)

-- rename globally
keymap.set("n", "<leader>rg", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Increment/decrement
keymap.set("n", "<leader>=", "<C-a>", { noremap = true })
keymap.set("n", "<leader>-", "<C-x>", { noremap = true })

keymap.set("n", "<leader>w", "<cmd> w <CR>", { noremap = true })
keymap.set("n", "<leader>q", "<cmd> q <CR>", { noremap = true })

keymap.set("i", "<C-c>", "<Esc>", { noremap = true })
keymap.set("i", "kj", "<ESC>", { noremap = true })

keymap.set("n", "<leader>bg", "<cmd> VimBeGood <CR>")

keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
keymap.set("n", "<leader>a", vim.lsp.buf.code_action)

-- go to definition
vim.keymap.set("n", "gd", function()
	vim.lsp.buf.definition()
end)

-- Diagnostic keymaps
keymap.set("n", "[x", vim.diagnostic.goto_prev)
keymap.set("n", "]x", vim.diagnostic.goto_next)
keymap.set("n", "<leader>i", vim.diagnostic.open_float)

-- telescope
-- find git project files if its a repository, just find files if it is not
keymap.set(
	"n",
	"<leader><Space>",
	"<cmd> lua require'raphmt.lua.telescope.telescope-config'.project_files() <CR>",
	{ noremap = true, silent = true }
)
keymap.set("n", "<leader>fg", "<cmd> Telescope git_status <CR>", { noremap = true, silent = true }) -- git status in current repo
keymap.set("n", "<leader>fc", "<cmd> Telescope git_commits <cr>", { noremap = true, silent = true }) -- search last commits
keymap.set("n", "<leader>u", "<cmd> Telescope undo <cr>", { noremap = true, silent = true }) -- telescope undo telescope undo
keymap.set("n", "<leader>fo", "<cmd> Telescope oldfiles <cr>", { noremap = true, silent = true }) -- search last files opened

-- nvim
keymap.set("n", "<leader>fh", "<cmd> Telescope help_tags <CR>", { noremap = true, silent = true }) -- search help tags
keymap.set("n", "<leader>fm", "<cmd> Telescope man_pages <cr>", { noremap = true, silent = true }) -- search man pages
keymap.set("n", "<leader>fb", "<cmd> Telescope buffers <CR>", { noremap = true, silent = true }) -- search open buffers
keymap.set("n", "<leader>km", "<cmd> Telescope keymaps <CR>", { noremap = true, silent = true }) -- search your keymaps

-- code
keymap.set("n", "<leader>fx", "<cmd> Telescope diagnostics <CR>", { noremap = true, silent = true }) -- search diagnostics in current file
keymap.set("n", "<leader>fs", "<cmd> Telescope live_grep <cr>", { noremap = true, silent = true }) -- search a string in current directory
keymap.set("n", "<leader>f.", "<cmd> Telescope current_buffer_fuzzy_find <CR>", { noremap = true, silent = true }) -- search a string in current file

-- search all telescope pickers
keymap.set("n", "<leader>ff", "<cmd> Telescope builtin <CR>", { noremap = true, silent = true }) -- search telescope commands

-- yank and paste between tmux session
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { noremap = true, silent = true })
vim.keymap.set("n", "<leader>Y", [["+Y]], { noremap = true, silent = true })
vim.keymap.set("n", "<leader>p", [["+p]], { noremap = true, silent = true })

-- open lazy menu
keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { noremap = true, silent = true })

-- close neovim, close tab, close anithing (without saving)
keymap.set("n", "<leader>0", ":q!<CR>", { noremap = true, silent = true })

keymap.set("n", "x", '"_x', { noremap = true, silent = true })
