return {

	-- easy resize for nvim panes
	{
		"mrjones2014/smart-splits.nvim",
		lazy = true,
		config = function()
			require("smart-splits").setup()

			-- resizing splits
			-- these keymaps will also accept a range,
			-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
			vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
			vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
			vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
			vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)

			-- swapping buffers between windows
			vim.keymap.set("n", "<leader>bh", require("smart-splits").swap_buf_left)
			vim.keymap.set("n", "<leader>bj", require("smart-splits").swap_buf_down)
			vim.keymap.set("n", "<leader>bk", require("smart-splits").swap_buf_up)
			vim.keymap.set("n", "<leader>bl", require("smart-splits").swap_buf_right)
		end,
	},

	-- quick navigation to a visible text
	{
		"ggandor/leap.nvim",
		event = "VeryLazy",
		config = function()
			require("leap").add_default_mappings()

			-- vim.keymap.set("n", "<leader>s", function()
			-- 	local current_window = vim.fn.win_getid()
			-- 	require("leap").leap({ target_windows = { current_window } })
			-- end)

			require("leap").opts.special_keys = {
				next_target = "<tab>",
				prev_target = "<S-tab>",
			}
			require("leap").add_repeat_mappings(";", ",", {
				-- False by default. If set to true, the keys will work like the
				-- native semicolon/comma, i.e., forward/backward is understood in
				-- relation to the last motion.
				relative_directions = true,
				-- By default, all modes are included.
				modes = { "n", "x", "o" },
			})
		end,
	},
	-- quick navigation between functions, classes, methods...
	{
		"stevearc/aerial.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		event = "VeryLazy",
		config = function()
			require("aerial").setup({
				-- optionally use on_attach to set keymaps when aerial has attached to a buffer
				on_attach = function(bufnr)
					-- Jump forwards/backwards with '{' and '}'
					vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
					vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
				end,

				ignore = {
					filetypes = { "md", "markdown", ".md" },
				},
			})
			-- You probably also want to set a keymap to toggle aerial
			vim.keymap.set("n", "<leader>1", "<cmd>AerialToggle!<CR>")
		end,
	},

	-- find anything
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
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
				pickers = {
					-- find_files = {
					-- 	theme = "ivy",
					-- },
				},
			})

			telescope.load_extension("fzf")
			telescope.load_extension("aerial")
		end,
	},

	-- telescope plugin for search last changes on current file
	{
		"debugloop/telescope-undo.nvim",
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
		event = "VeryLazy",
	},

	-- easy navigation between neovim and tmux panes
	{
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
	},

	-- create, change and delete files like they are text in a buffer
	{
		"stevearc/oil.nvim",
		init = function()
			local netrw_bufname

			pcall(vim.api.nvim_clear_autocmds, { group = "FileExplorer" })

			vim.api.nvim_create_autocmd("VimEnter", {
				pattern = "*",
				once = true,
				callback = function()
					pcall(vim.api.nvim_clear_autocmds, { group = "FileExplorer" })
				end,
			})

			vim.api.nvim_create_autocmd("BufEnter", {
				group = vim.api.nvim_create_augroup("oil.nvim", { clear = true }),
				pattern = "*",
				callback = function()
					vim.schedule(function()
						if vim.bo[0].filetype == "netrw" then
							return
						end
						local bufname = vim.api.nvim_buf_get_name(0)
						if vim.fn.isdirectory(bufname) == 0 then
							_, netrw_bufname = pcall(vim.fn.expand, "#:p:h")
							return
						end

						-- prevents reopening of file-browser if exiting without selecting a file
						if netrw_bufname == bufname then
							netrw_bufname = nil
							return
						else
							netrw_bufname = bufname
						end

						-- ensure no buffers remain with the directory name
						vim.api.nvim_buf_set_option(0, "bufhidden", "wipe")

						require("oil").open()
					end)
				end,
				desc = "oil.nvim replacement for netrw",
			})
		end,
		opts = {
			keymaps = {
				["?"] = "actions.show_help",
				["<C-v>"] = "actions.select_split",
				["<C-s>"] = "actions.select_vsplt",
				["<leader>t"] = "actions.select_tab",
				["<leader>p"] = "actions.preview",
				["<leader>o"] = "actions.change_sort",
				["<leader>r"] = "actions.refresh",
				["<CR>"] = "actions.select",
				["<C-l>"] = "actions.select",
				["<Esc>"] = "actions.close",
				["<C-c>"] = "actions.close",
				["q"] = "actions.close",
				["H"] = "actions.toggle_hidden",
				["<C-h>"] = "actions.parent",
				["-"] = "actions.open_cwd",
				["."] = "actions.cd",
			},
			use_default_keymaps = false,
			columns = {
				"permissions",
				"size",
				"mtime",
				"icon",
			},
			default_file_explorer = false,
			view_options = {
				show_hidden = false,
				---@diagnostic disable-next-line: unused-local
				is_always_hidden = function(name, bufnr)
					return vim.startswith(name, ".DS_Store")
				end,
			},
		},
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter" },
			{ "nvim-tree/nvim-web-devicons", lazy = true },
		},
		event = "InsertEnter",
	},
}
