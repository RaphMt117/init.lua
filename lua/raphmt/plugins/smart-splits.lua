-- easy resize for nvim panes
return {
	"mrjones2014/smart-splits.nvim",
	event = "VeryLazy",
	config = function()
		-- 	require("smart-splits").setup()
		--
		-- 	-- resizing splits
		-- 	-- these keymaps will also accept a range,
		-- 	-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
		-- 	vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
		-- 	vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
		-- 	vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
		-- 	vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
		--
		-- 	-- swapping buffers between windows
		-- 	vim.keymap.set("n", "<leader>bh", require("smart-splits").swap_buf_left)
		-- 	vim.keymap.set("n", "<leader>bj", require("smart-splits").swap_buf_down)
		-- 	vim.keymap.set("n", "<leader>bk", require("smart-splits").swap_buf_up)
		-- 	vim.keymap.set("n", "<leader>bl", require("smart-splits").swap_buf_right)
	end,
}
