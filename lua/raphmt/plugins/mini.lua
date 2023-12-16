-- collection of cool features for a quick start - using mini.move and mini.surround
return {
	"echasnovski/mini.nvim",
	event = "VeryLazy",
	version = false,
	config = function()
		require("mini.move").setup({
			-- Module mappings. Use `''` (empty string) to disable one.
			mappings = {
				-- Visual mode.
				left = "<S-h>",
				right = "<S-l>",
				down = "<S-j>",
				up = "<S-k>",

				-- Normal mode - disabled
				line_left = "",
				line_right = "",
				line_down = "",
				line_up = "",
			},
			options = {
				reindent_linewise = true,
			},
		})

		require("mini.surround").setup({
			custom_surroundings = nil,

			-- Module mappings. Use `''` (empty string) to disable one.
			mappings = {
				add = "sa", -- Add surrounding in Normal and Visual modes
				delete = "sd", -- Delete surrounding
				find = "sf", -- Find surrounding (to the right)
				find_left = "sF", -- Find surrounding (to the left)
				highlight = "sh", -- Highlight surrounding
				replace = "sc", -- Replace surrounding
				update_n_lines = "sn", -- Update `n_lines`

				suffixlast = "l", -- Suffix to search with "prev" method
				suffix_next = "n", -- Suffix to search with "next" method
			},
		})
	end,
}
