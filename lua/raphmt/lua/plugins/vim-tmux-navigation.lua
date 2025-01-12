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
