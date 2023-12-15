return {

	-- hot key to quick swap files in a list
	{
		"theprimeagen/harpoon",
		event = "VeryLazy",
		config = function()
			local harpoon = require("harpoon")

			harpoon:setup()

			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():append()
			end)
			vim.keymap.set("n", "<C-p>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			vim.keymap.set("n", "<p-1>", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "<p-2>", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "<p-3>", function()
				harpoon:list():select(3)
			end)
			vim.keymap.set("n", "<p-4>", function()
				harpoon:list():select(4)
			end)
		end,
	},
}
