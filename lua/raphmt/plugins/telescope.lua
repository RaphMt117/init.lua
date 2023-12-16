-- find anything
return {
	{
		"nvim-telescope/telescope.nvim",
		event = "InsertEnter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-tree/nvim-web-devicons",
		},
		extensions = {
			aerial = {
				-- Display symbols as <root>.<parent>.<symbol>
				show_nesting = {
					["_"] = false, -- This key will be the default
					json = true, -- You can set the option for specific filetypes
					yaml = true,
				},
			},
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					path_display = { "truncate " },
					mappings = {
						i = {
							["<S-k>"] = actions.move_selection_previous, -- move to prev result
							["<C-k>"] = actions.move_selection_previous, -- move to prev result
							["<S-j>"] = actions.move_selection_next, -- move to next result
							["<C-j>"] = actions.move_selection_next, -- move to next result
							["<S-v>"] = actions.select_vertical, -- open in vertical split
							["<S-h>"] = actions.select_horizontal, -- open in horizontal split
							["<S-s>"] = actions.select_horizontal, -- open in horizontal split
							["/"] = actions.select_vertical, -- open in horizontal split
							["<S-l>"] = actions.toggle_selection, -- select
							["<S-Tab>"] = actions.toggle_selection, -- select
							["<C-h>"] = "which_key", -- show keys
						},
						n = {
							["<S-v>"] = actions.select_vertical, -- open in vertical split
							["<S-h>"] = actions.select_horizontal, -- open in horizontal split
							["<S-s>"] = actions.select_horizontal, -- open in horizontal split
							["<S-l>"] = actions.toggle_selection, -- select
							["<C-h>"] = "which_key", -- show keys
						},
					},
				},
				pickers = {},
			})

			telescope.load_extension("fzf")
			telescope.load_extension("aerial")
		end,
	},

	-- telescope plugin for search last changes on current file
	{
		"debugloop/telescope-undo.nvim",
		event = "VeryLazy",
		dependencies = {
			{
				"nvim-telescope/telescope.nvim",
				dependencies = { "nvim-lua/plenary.nvim" },
			},
		},
		opts = {
			extensions = {
				undo = {
					side_by_side = true,
					diff_context_lines = vim.o.scrolloff,
					saved_only = false,
				},
			},
		},
		config = function(_, opts)
			require("telescope").setup(opts)
			require("telescope").load_extension("undo")
		end,
	},
}
