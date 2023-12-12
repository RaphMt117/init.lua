require("aerial").setup({
	-- optionally use on_attach to set keymaps when aerial has attached to a buffer
	on_attach = function(bufnr)
		-- Jump forwards/backwards with '{' and '}'
		vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
		vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
	end,

	ignore = {

		-- List of filetypes to ignore.
		filetypes = { "md", "markdown", ".md" },
	},
})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", "<leader>1", "<cmd>AerialToggle!<CR>")