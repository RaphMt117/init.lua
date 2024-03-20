return {

	-- highlights based on language parsers
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		init = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"javascript",
					"python",
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
					"php",
				},

				sync_install = false,
				auto_install = true,
				indent = { enable = true },
				autotag = { enable = true },
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = true,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<leader>ss", -- set to `false` to disable one of the mappings
						node_incremental = "<leader>sk",
						node_decremental = "<leader>sj",
						scope_incremental = "<leader>sc",
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true,

						keymaps = {
							--
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ib"] = "@block.inner",
							["ab"] = "@block.outer",
							["ic"] = "@comment.inner",
							["ac"] = "@comment.outer",
							["ii"] = "@conditional.inner",
							["ai"] = "@conditional.outer",
							["sc"] = { query = "@scope", query_group = "locals" },
						},
						include_surrounding_whitespace = true,
					},
				},
			})
		end,
	},
}
