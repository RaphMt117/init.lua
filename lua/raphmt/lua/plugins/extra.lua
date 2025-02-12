return {
	-- Autotags
	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},

	-- autopairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	-- comments
	{
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
	},
	-- useful when there are embedded languages in certain types of files (e.g. Vue or React)
	{ "joosepalviste/nvim-ts-context-commentstring", lazy = true },

	-- Neovim plugin to improve the default vim.ui interfaces
	{
		"stevearc/dressing.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {},
		config = function()
			require("dressing").setup()
		end,
	},

	-- Neovim notifications and LSP progress messages
	{
		"j-hui/fidget.nvim",
		branch = "legacy",
		enabled = true,
		config = function()
			require("fidget").setup({
				window = { blend = 0 },
			})
		end,
	},

	-- find and replace
	{
		"windwp/nvim-spectre",
		enabled = true,
		event = "BufRead",
		keys = {
			{
				"<leader>rr",
				function()
					require("spectre").open()
				end,
				desc = "Replace",
			},
			{
				"<leader>rw",
				function()
					require("spectre").open_visual({ select_word = true })
				end,
				desc = "Replace Word",
			},
			{
				"<leader>rf",
				function()
					require("spectre").open_file_search()
				end,
				desc = "Replace Buffer",
			},
		},
	},

	-- Add/change/delete surrounding delimiter pairs with ease
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},

	{
		{
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "luvit-meta/library", words = { "vim%.uv" } },
				},
			},
		},
		{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
		{ -- optional completion source for require statements and module annotations
			"hrsh7th/nvim-cmp",
			opts = function(_, opts)
				opts.sources = opts.sources or {}
				table.insert(opts.sources, {
					name = "lazydev",
					group_index = 0, -- set group index to 0 to skip loading LuaLS completions
				})
			end,
		},
	},

	-- Enhanced f/t motions for Leap
	-- {
	-- 	"ggandor/flit.nvim",
	-- 	keys = function()
	-- 		---@type LazyKeys[]
	-- 		local ret = {}
	-- 		for _, key in ipairs({ "f", "F", "t", "T" }) do
	-- 			ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
	-- 		end
	-- 		return ret
	-- 	end,
	-- 	opts = { labeled_modes = "nx" },
	-- },
	-- mouse replacement
	-- {
	-- 	"ggandor/leap.nvim",
	-- 	keys = {
	-- 		{ "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
	-- 		{ "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
	-- 		{ "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
	-- 	},
	-- 	config = function(_, opts)
	-- 		local leap = require("leap")
	-- 		for k, v in pairs(opts) do
	-- 			leap.opts[k] = v
	-- 		end
	-- 		leap.add_default_mappings(true)
	-- 		vim.keymap.del({ "x", "o" }, "x")
	-- 		vim.keymap.del({ "x", "o" }, "X")
	-- 	end,
	-- },

	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		enabled = false,
		opts = {
			-- configurations go here
		},
		config = function()
			require("barbecue").setup({
				create_autocmd = false, -- prevent barbecue from updating itself automatically
			})

			vim.api.nvim_create_autocmd({
				"WinScrolled", -- or WinResized on NVIM-v0.9 and higher
				"BufWinEnter",
				"CursorHold",
				"InsertLeave",

				-- include this if you have set `show_modified` to `true`
				-- "BufModifiedSet",
			}, {
				group = vim.api.nvim_create_augroup("barbecue.updater", {}),
				callback = function()
					require("barbecue.ui").update()
				end,
			})
		end,
	},

	{
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

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup({
				custom_surroundings = nil,
			})

			-- require("mini.pairs").setup()

			-- local statusline = require("mini.statusline")
			-- statusline.setup({
			-- 	use_icons = vim.g.have_nerd_font,
			-- })
			-- ---@diagnostic disable-next-line: duplicate-set-field
			-- statusline.section_location = function()
			-- 	return "%2l:%-2v"
			-- end
		end,
	},

	{
		"ThePrimeagen/vim-be-good",
		event = "VeryLazy",
	},

	{ "tpope/vim-fugitive", event = "VeryLazy" },
}
