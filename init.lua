vim.loader.enable()

require("raphmt")

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if vim.fn.argv(0) == "" then
			-- open telescope
			require("raphmt.util.telescope-config").project_files()
		end
	end,
})
