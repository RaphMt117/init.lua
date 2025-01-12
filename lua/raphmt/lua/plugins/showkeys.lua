return {
	"nvchad/showkeys",
	cmd = "ShowkeysToggle",
	opts = {
		timeout = 1,
		maxkeys = 6,
		-- bottom-left, bottom-right, bottom-center, top-left, top-right, top-center
		position = "bottom-right",
	},

	keys = {
		{
			"<leader>sk",
			function()
				vim.cmd("ShowkeysToggle")
			end,
			desc = "Show key presses",
		},
	},
}
