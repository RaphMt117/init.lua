return {
	"lukas-reineke/indent-blankline.nvim",
	event = "VeryLazy",
	main = "ibl",
	opts = {},
	config = function()
		local api = vim.api

		local exclude_ft = { "help", "git", "markdown", "snippets", "norg", "text", "gitconfig", "alpha", "dashboard" }

		require("ibl").setup({
			indent = {
				char = "▏",
				-- char = "│",
			},
			scope = {
				show_start = false,
				show_end = false,
			},
			exclude = {
				filetypes = exclude_ft,
				buftypes = { "terminal" },
			},
		})

		local gid = api.nvim_create_augroup("indent_blankline", { clear = true })

		api.nvim_create_autocmd("InsertLeave", {
			pattern = "*",
			group = gid,
			callback = function()
				if not vim.tbl_contains(exclude_ft, vim.bo.filetype) then
					vim.cmd([[IBLEnable]])
				end
			end,
		})
	end,
}
