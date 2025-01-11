-- -- easy navigation between neovim and tmux panes
return {
	"alexghergh/nvim-tmux-navigation",
	event = "VeryLazy",
	config = function()
		require("nvim-tmux-navigation").setup({
			disable_when_zoomed = true, -- defaults to false
			keybindings = {
				left = "<C-h>",
				down = "<C-j>",
				up = "<C-k>",
				right = "<C-l>",
				last_active = "<C-\\>",
				next = "<C-;>",
			},
			copy_sync = {
				-- TMUX >= 3.2
				redirect_to_clipboard = true,
			},
		})
	end,
}

-- return {
-- 	"christoomey/vim-tmux-navigator",
-- 	cmd = {
-- 		"TmuxNavigateLeft",
-- 		"TmuxNavigateDown",
-- 		"TmuxNavigateUp",
-- 		"TmuxNavigateRight",
-- 		"TmuxNavigatePrevious",
-- 		"TmuxNavigatorProcessList",
-- 	},
-- 	keys = {
-- 		{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
-- 		{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
-- 		{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
-- 		{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
-- 		{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
-- 	},
-- }
