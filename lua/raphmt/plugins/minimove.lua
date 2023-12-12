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
