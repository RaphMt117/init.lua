return {
	{
		"gbprod/yanky.nvim",
		event = "VeryLazy",
		-- dependencies = { { "kkharji/sqlite.lua", enabled = not jit.os:find("Windows") } },
		opts = {
			highlight = { timer = 250 },
			-- ring = { storage = jit.os:find("Windows") and "shada" or "sqlite" },
		},
		keys = {
      -- stylua: ignore
    { "<leader>p", function() require("telescope").extensions.yank_history.yank_history({ }) end, desc = "Open Yank History" },
			{ "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
			{ "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor" },
			{ "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before cursor" },
		},
	},
}
