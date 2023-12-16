-- easy navigation between neovim and tmux panes
return {
	"alexghergh/nvim-tmux-navigation",
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
				-- TMUX >= 3.2: all yanks (and deletes) will get redirected to system
				-- clipboard by tmux
				redirect_to_clipboard = true,
			},
		})
	end,
}
