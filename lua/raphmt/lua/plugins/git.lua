return {
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		config = function()
			-- local icons = require("raphmt.lua.config.icons")
			require("gitsigns").setup({
				-- signs = {
				-- 	add = {
				--
				-- 		text = icons.ui.BoldLineLeft,
				-- 		numhl = "GitSignsAddNr",
				-- 		linehl = "GitSignsAddLn",
				-- 	},
				-- 	change = {
				-- 		hl = "GitSignsChange",
				-- 		text = icons.ui.BoldLineLeft,
				-- 		numhl = "GitSignsChangeNr",
				-- 		linehl = "GitSignsChangeLn",
				-- 	},
				-- 	delete = {
				-- 		hl = "GitSignsDelete",
				-- 		text = icons.ui.TriangleShortArrowRight,
				-- 		numhl = "GitSignsDeleteNr",
				-- 		linehl = "GitSignsDeleteLn",
				-- 	},
				-- 	topdelete = {
				-- 		hl = "GitSignsDelete",
				-- 		text = icons.ui.TriangleShortArrowRight,
				-- 		numhl = "GitSignsDeleteNr",
				-- 		linehl = "GitSignsDeleteLn",
				-- 	},
				-- 	changedelete = {
				-- 		hl = "GitSignsChange",
				-- 		text = icons.ui.BoldLineLeft,
				-- 		numhl = "GitSignsChangeNr",
				-- 		linehl = "GitSignsChangeLn",
				-- 	},
				-- },
				signcolumn = true,
				numhl = false,
				linehl = false,
				word_diff = false,
				watch_gitdir = {
					interval = 1000,
					follow_files = true,
				},
				attach_to_untracked = true,
				current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
					delay = 1000,
					ignore_whitespace = false,
				},
				current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
				sign_priority = 6,
				status_formatter = nil,
				update_debounce = 200,
				max_file_length = 40000,
				preview_config = {
					border = "rounded",
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
			})
		end,
		keys = {
			{
				"<leader>gg",
				function()
					vim.cmd("!tmux new-window -c" .. vim.fn.getcwd() .. " -- lazygit")
				end,
				desc = "Lazygit",
			},
			{
				"<leader>gk",
				function()
					require("gitsigns").nav_hunk("prev")
				end,
				desc = "Prev change",
			},
			{
				"<leader>gj",
				function()
					require("gitsigns").nav_hunk("next")
				end,
				desc = "Next change",
			},
			{
				"<leader>gbf",
				function()
					require("gitsigns").blame()
				end,
				desc = "Blame file",
			},
			{
				"<leader>gbl",
				function()
					require("gitsigns").blame_line()
				end,
				desc = "Blame line",
			},
			{
				"<leader>gp",
				function()
					require("gitsigns").preview_hunk()
				end,
				desc = "Changes bellow cursor",
			},
			{
				"<leader>gr",
				function()
					require("gitsigns").reset_buffer()
				end,
				desc = "Reset current buffer changes",
			},
			{
				"<leader>go",
				require("telescope.builtin").git_status,
				desc = "Changed files",
			},
			{
				"<leader>gcb",
				require("telescope.builtin").git_branches,
				desc = "Branch",
			},
			{
				"<leader>gcc",
				require("telescope.builtin").git_commits,
				desc = "Commit",
			},
			{
				"<leader>gcC",
				require("telescope.builtin").git_bcommits,
				desc = "Commit (for current file)",
			},
			{
				"<leader>gd",
				function()
					vim.cmd("Gitsigns diffthis HEAD")
				end,
				desc = "Git Diff",
			},
		},
	},
	{
		"sindrets/diffview.nvim",
		event = "VeryLazy",
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
	},
}
