-- find anything
return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"BurntSushi/ripgrep",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					file_ignore_patterns = { "node_modules", ".git" },
					path_display = { "truncate " },
					mappings = {
						i = {
							["<S-k>"] = actions.move_selection_previous, -- move to prev result
							["<C-k>"] = actions.move_selection_previous, -- move to prev result
							["<C-j>"] = actions.move_selection_next, -- move to next result
							["<S-j>"] = actions.move_selection_next, -- move to next result
							["<S-v>"] = actions.select_vertical, -- open in vertical split
							["<S-h>"] = actions.select_horizontal, -- open in horizontal split
							["<S-s>"] = actions.select_horizontal, -- open in horizontal split
							["/"] = actions.select_vertical, -- open in vertical split
							["<S-l>"] = actions.toggle_selection, -- select
							["<S-Tab>"] = actions.toggle_selection, -- select
							["<C-h>"] = "which_key", -- show keys
							["<esc>"] = actions.close,
							["<C-d>"] = actions.delete_buffer + actions.move_to_top,
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
				pickers = {
					find_files = {
						hidden = true,
					},
					git_files = {
						hidden = true,
					},
				},
				extensions = {
					undo = {
						mappings = {
							-- undo
							["<cr>"] = require("telescope-undo.actions").yank_additions,
							["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
							["<C-cr>"] = require("telescope-undo.actions").restore,
							-- alternative defaults, for users whose terminals do questionable things with modified <cr>
							["<C-y>"] = require("telescope-undo.actions").yank_deletions,
							["<C-r>"] = require("telescope-undo.actions").restore,
							-- undo
							["y"] = require("telescope-undo.actions").yank_additions,
							["Y"] = require("telescope-undo.actions").yank_deletions,
							["u"] = require("telescope-undo.actions").restore,
						},
					},
				},
			})

			telescope.load_extension("fzf")
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
