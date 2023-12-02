local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- require("lazy").setup("raphmt.plugins", {
-- 	install = {},
-- 	checker = {
-- 		enabled = true,
-- 		notify = false,
-- 	},
-- 	change_detection = {
-- 		notify = false,
-- 	},
-- })

local plugins = {

	--colorscheme
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	-- nvim tree - neotree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	},
	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					path_display = { "truncate " },
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous, -- move to prev result
							["<C-j>"] = actions.move_selection_next, -- move to next result
						},
					},
				},
			})

			telescope.load_extension("fzf")
		end,
	},
	-- old telescope
	-- {
	-- 	"nvim-telescope/telescope.nvim",
	-- 	tag = "0.1.4",
	-- 	-- or                              , branch = '0.1.x',
	-- 	dependencies = {
	-- 		{
	-- 			"nvim-lua/plenary.nvim",
	-- 			"nvim-treesitter/nvim-treesitter",
	-- 			"nvim-tree/nvim-web-devicons",
	-- 			"debugloop/telescope-undo.nvim",
	-- 		},
	-- 	},
	-- },
	--
	-- plenary
	"nvim-lua/plenary.nvim",

	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},

	-- comments
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- surrounds
	{ "echasnovski/mini.nvim", branch = "stable" },

	-- neodev
	-- "folke/neodev.nvim",

	-- startup
	-- {
	-- 	"startup-nvim/startup.nvim",
	-- 	requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	-- 	config = function()
	-- 		require("startup").setup()
	-- 	end,
	-- },

	-- theme
	{ "catppuccin/nvim", as = "catppuccin" },

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},

	-- formatter
	"stevearc/conform.nvim",
	-- harpoon
	"theprimeagen/harpoon",
	-- refactoring
	"theprimeagen/refactoring.nvim",
	-- vim fugitive
	"tpope/vim-fugitive",
	-- git signs
	"lewis6991/gitsigns.nvim",
	-- blank line
	"lukas-reineke/indent-blankline.nvim",

	-- lualine
	{
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	},

	-- autopairs
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	-- lsp
}

local opts = {}

require("lazy").setup(plugins, opts)
