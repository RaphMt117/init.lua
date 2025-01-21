return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
		delay = 300,
		icons = {
			rules = false,
			breadcrumb = " ", -- symbol used in the command line area that shows your active key combo
			separator = "󱦰  ", -- symbol used between a key and it's label
			group = "󰹍 ", -- symbol prepended to a group
		},
		plugins = {
			spelling = {
				enabled = false,
			},
		},
		win = {
			height = {
				max = math.huge,
			},
		},
		spec = {
			{
				mode = { "n", "v" },
				{ "<leader>f", group = "Find" },
				{ "<leader>g", group = "Git" },
				{ "<leader>gc", group = "Checkout" },
				{ "<leader>gb", group = "Blame" },

				{ "<leader>T", group = "Tabs" },

				{ "<leader>r", group = "Replace" },
				{ "<leader>l", group = "LSP" },
				{ "<leader>t", group = "Test" },
				-- { "<leader>s", group = "Show" },
				{ "<leader>x", group = "Trouble" },
				{ "<leader>n", group = "Neorg" },
				-- { "<leader>N", group = "Package Info" },

				-- { "<leader>W", group = "Workspace" },
				{ "[", group = "prev" },
				{ "]", group = "next" },
				{ "g", group = "goto" },
			},
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
		{
			"<leader>L",
			function()
				require("lazy").show()
			end,
			desc = "Lazy",
		},
	},
}
