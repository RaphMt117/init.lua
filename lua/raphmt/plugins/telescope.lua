-- find anything
return {
	{
		"nvim-telescope/telescope.nvim",
		event = "InsertEnter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"BurntSushi/ripgrep",
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
					-- file_ignore_patterns = { "node_modules" },
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
				pickers = {},
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
					layout_strategy = "vertical",
					layout_config = {
						preview_height = 0.6,
					},
				},
			},
		},
		config = function(_, opts)
			require("telescope").setup(opts)
			require("telescope").load_extension("undo")
		end,
	},
}
