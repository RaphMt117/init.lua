-- easyly comment and uncomment lines and blocks
return {
	"numToStr/Comment.nvim",
	event = "VeryLazy",
	config = function()
		require("Comment").setup({

			-- NORMAL mode
			toggler = {
				-- Line-comment
				line = "gcc",
				-- Block-comment
				block = "gbc",
			},
			-- NORMAL and VISUAL mode
			opleader = {
				-- -Line-comment
				line = "gc",
				---Block-comment
				block = "gb",
			},
			--- extra mappings
			extra = {
				--- line above
				above = "gcO",
				--- line below
				below = "gco",
				--- end of line
				eol = "gca",
			},
		})
	end,
}
