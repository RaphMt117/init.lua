-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap

-- toggle file exporer
keymap.set("n", "<Leader>e", ":lua require('oil').open()<CR>", { noremap = true })

-- debugging
keymap.set("n", "<Leader>db", "<cmd> DapToggleBreakpoint <CR>", { noremap = true }) -- toggle breakpoint
keymap.set("n", "<Leader>dr", "<cmd> DapContinue <CR>", { noremap = true }) -- run debugger, next line if already running

-- C-Backspace to delete word in insert mode
vim.api.nvim_set_keymap("i", "<C-H>", "<C-W>", { noremap = true })

-- tabs
keymap.set("n", "tn", ":tabnew<CR>", { noremap = true }) -- open new tab
keymap.set("n", "<leader>q", ":tabclose<CR>", { noremap = true }) -- close current tab

-- new buffer
keymap.set("n", "<leader>b", "<cmd> enew <CR>", { noremap = true })

-- splits
keymap.set("n", "<leader>v", ":vsplit<CR>", { noremap = true }) -- split vertically
keymap.set("n", "<leader>h", ":split<CR>", { noremap = true }) -- split horizontally

-- zen mode
keymap.set("n", "<leader>zz", "<cmd>ZenMode<CR>", { noremap = true })

-- opens lazygit in a new tmux window
keymap.set(
	"n",
	"<leader>lg",
	"<cmd>!tmux new-window -c " .. vim.fn.getcwd() .. " -- lazygit <CR><CR>",
	{ noremap = true }
)

-- open terminal
keymap.set("n", "<leader>t", "<cmd>!tmux split-window -l 10 <CR>", { noremap = true })

-- rename
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- put line below to the end of this line
keymap.set("n", "J", "mzJ`z", { noremap = true })

-- Increment/decrement
keymap.set("n", "<leader>=", "<C-a>", { noremap = true })
keymap.set("n", "<leader>-", "<C-x>", { noremap = true })

-- salvar
keymap.set("n", "<leader>w", "<cmd> w <CR>", { noremap = true })
keymap.set({ "n", "i" }, "<C-s>", "<cmd> w <CR>", { noremap = true })

-- sair
keymap.set("n", "<leader>q", "<cmd> q <CR>", { noremap = true })

-- up and down centering cursor
keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })

-- normal mode on C-c and jk
keymap.set("i", "<C-c>", "<Esc>", { noremap = true })
keymap.set("i", "jk", "<ESC>", { noremap = true })

-- vim be good
vim.keymap.set("n", "<leader>bg", "<cmd> VimBeGood <CR>")

-- TODO: make leader xx to find warnings
-- make sh file executable
-- keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { noremap = true, silent = true })

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
keymap.set("n", "<leader>o", "<cmd> Telescope oldfiles <cr>", { noremap = true, silent = true }) -- search last files opened

-- nvim
keymap.set("n", "<leader>fh", "<cmd> Telescope help_tags <CR>", { noremap = true, silent = true }) -- search help tags
keymap.set("n", "<leader>fm", "<cmd> Telescope man_pages <cr>", { noremap = true, silent = true }) -- search man pages
keymap.set("n", "<leader>fb", "<cmd> Telescope buffers <CR>", { noremap = true, silent = true }) -- search open buffers
keymap.set("n", "<leader>km", "<cmd> Telescope keymaps <CR>", { noremap = true, silent = true }) -- search your keymaps

-- code
keymap.set("n", "<leader>fx", "<cmd> Telescope diagnostics <CR>", { noremap = true, silent = true }) -- search diagnostics in current file
keymap.set("n", "<leader>fs", "<cmd> Telescope live_grep <cr>", { noremap = true, silent = true }) -- search a string in current directory
keymap.set("n", "<leader>f.", "<cmd> Telescope current_buffer_fuzzy_find <CR>", { noremap = true, silent = true }) -- search a string in current file
keymap.set("n", "<leader>fv", "<cmd> Telescope aerial <CR>", { noremap = true, silent = true }) -- find functions in current file using aerial

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
