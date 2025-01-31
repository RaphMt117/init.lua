local map = vim.keymap.set
local vscode = require("vscode")

-- Keep cursor centered when scrolling
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Move selected line / block of text in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Fast saving / quiting
map("n", "<leader>w", ":w!<CR>")
map("n", "<leader>q", ":Quit <CR>")

-- Remap for dealing with visual line wraps
map("n", "k", "v:count == 0 ? 'gk' : 'k'")
map("n", "j", "v:count == 0 ? 'gj' : 'j'")

-- paste over currently selected text without yanking it
map("v", "p", '"_dp')
map("v", "P", '"_dP')

-- yank everything between { and }
map("n", "YY", "va{Vy")

-- Move line on the screen rather than by line in the file
map("n", "j", "gj")
map("n", "k", "gk")

-- Panes resizing
map("n", "+", ":vertical resize +5<CR>")
map("n", "_", ":vertical resize -5<CR>")
map("n", "=", ":resize +5<CR>")
map("n", "-", ":resize -5<CR>")

-- Map enter to ciw in normal mode
map("n", "<CR>", "ciw")

-- Select all
map("n", "<C-a>", "ggVG")

-- code specific
map(
	"n",
	"<leader>fs",
	"<Cmd>lua require('vscode').action('workbench.action.findInFiles', { args = { query = vim.fn.expand('<cword>') } })<CR>"
)

map("n", "<leader>gd>", "<Cmd>lua require('vscode').action('editor.action.revealDefinitionAside')<CR>")
map("n", "<leader>f", "<Cmd> lua require('vscode').action('editor.action.formatDocument')<CR>")

map({ "n", "x" }, "<leader>rf", function()
	vscode.with_insert(function()
		vscode.action("editor.action.refactor")
	end)
end)

-- tabs
map("n", "<leader>t", ":Tabnew<CR>")
map("n", "<leader>o", ":Tabonly<CR>")
map("n", "<S-l>", ":Tabnext<CR>")
map("n", "<S-h>", ":Tabprevious<CR>")

-- splits
map("n", "<leader>v", "<cmd> Vsplit <CR>")
map("n", "<leader>h", "<cmd> Split <CR>")

-- rename globally
map("n", "<leader>rg", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

map("i", "<C-c>", "<Esc>")
