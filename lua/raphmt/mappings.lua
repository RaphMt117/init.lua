local keymap = vim.keymap

-- toggle file exporer
keymap.set("n", "<Leader>e", ":lua require('oil').open()<CR>", { noremap = true })

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
	"<cmd> lua require'raphmt.util.telescope-config'.project_files() <CR>",
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
