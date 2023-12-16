return {

	-- highlights based on language parsers
	{
		"nvim-treesitter/nvim-treesitter",
		init = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
		opts = {
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		},
		event = "VeryLazy",
		config = function()
			require("nvim-treesitter.configs").setup({

				ensure_installed = {
					"javascript",
					"typescript",
					"go",
					"html",
					"json",
					"css",
					"bash",
					"markdown",
					"markdown_inline",
					"lua",
					"sql",
					"regex",
					"json",
					"vimdoc",
				},

				sync_install = false,
				auto_install = true,
				indent = { enable = true },
				autotag = { enable = true },
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
			})
		end,
	},
}
