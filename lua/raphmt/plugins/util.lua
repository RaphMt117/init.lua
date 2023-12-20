return {
	-- measure startuptime
	{
		"dstein64/vim-startuptime",
		event = "InsertEnter",
		cmd = "StartupTime",
		config = function()
			vim.g.startuptime_tries = 10
		end,
	},
	-- library used by other plugins
	{ "nvim-lua/plenary.nvim", lazy = true },
	{ "nvim-tree/nvim-web-devicons", lazy = true },
}
