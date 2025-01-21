-- TODO: put descriptions
local map = vim.keymap.set

local opts = function(desc, expr)
	if desc then
		return {
			noremap = true,
			silent = true,
			desc = desc,
		}
	end
	if expr then
		return {
			expr = expr,
		}
	end
	return {
		noremap = true,
		silent = true,
	}
end

-- Keep cursor centered when scrolling
map("n", "<C-d>", "<C-d>zz", opts())
map("n", "<C-u>", "<C-u>zz", opts())

-- Move selected line / block of text in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", opts())
map("v", "K", ":m '<-2<CR>gv=gv", opts())

-- Fast saving - quiting
map("n", "<leader>w", ":w!<CR>", opts("save"))
map("n", "<leader>q", ":q!<CR>", opts("close"))

-- Remap for dealing with visual line wraps
map("n", "k", "v:count == 0 ? 'gk' : 'k'", opts(_, true))
map("n", "j", "v:count == 0 ? 'gj' : 'j'", opts(_, true))

-- better indenting
map("v", "<", "<gv", opts())
map("v", ">", ">gv", opts())

-- paste over currently selected text without yanking it
map("v", "p", '"_dp', opts())
map("v", "P", '"_dP', opts())

-- yank everything between { and } including the brackets
map("n", "YY", "va{Vy", opts())

-- Move line on the screen rather than by line in the file
map("n", "j", "gj", opts())
map("n", "k", "gk", opts())

-- Exit on jj and jk
map("i", "jj", "<ESC>", opts())
map("i", "jk", "<ESC>", opts())

-- Move to start/end of line
map({ "n", "x", "o" }, "H", "^", opts())
map({ "n", "x", "o" }, "L", "g_", opts())

-- Navigate buffers
map("n", "<Right>", ":bnext<CR>", opts())
map("n", "<Left>", ":bprevious<CR>", opts())

-- Panes resizing
map("n", "+", ":vertical resize +5<CR>", opts())
map("n", "_", ":vertical resize -5<CR>", opts())
map("n", "=", ":resize +5<CR>", opts())
map("n", "-", ":resize -5<CR>", opts())

-- Map enter to ciw in normal mode
map("n", "<CR>", "ciw", opts())
map("n", "<BS>", "ci", opts())

-- ??
map("n", "n", "nzzv", opts())
map("n", "N", "Nzzv", opts())
map("n", "*", "*zzv", opts())
map("n", "#", "#zzv", opts())
map("n", "g*", "g*zz", opts())
map("n", "g#", "g#zz", opts())

-- map ; to resume last search
map("n", ";", "<cmd>Telescope resume<cr>", opts())

-- search current buffer
map("n", "<C-s>", ":Telescope current_buffer_fuzzy_find<CR>", opts())

-- Split line with X
map("n", "X", ":keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>", opts())

-- Select all
map("n", "<C-a>", "ggVG", opts())

map("n", "<C-P>", ':lua require("config.utils").toggle_go_test()<CR>', opts())

map("n", "<Esc>", ":nohlsearch<CR>", opts())

-- tabs
map("n", "<leader>Tn", ":tabnew<CR>", opts()) -- open new tab
map("n", "<leader>To", ":tabonly<CR>", opts()) -- next tab
map("n", "<S-l>", ":tabnext<CR>", opts()) -- next tab
map("n", "<S-h>", ":tabprevious<CR>", opts()) -- next tab

map("n", "<leader>v", ":vsplit<CR>", opts()) -- split vertically
map("n", "<leader>h", ":split<CR>", opts()) -- split horizontally

-- rename globally
map("n", "<leader>rg", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts("rename globally"))

map("i", "<C-c>", "<Esc>", opts())

map("n", "<leader>b", "<cmd> VimBeGood <CR>", opts("vim be good"))

map("n", "x", '"_x', opts())
