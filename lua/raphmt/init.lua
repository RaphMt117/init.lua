require("raphmt.lazy")
require("raphmt.set")
require("raphmt.mappings")

local augroup = vim.api.nvim_create_augroup
local RaphMtGroup = augroup("RaphMt", {})

local autocmd = vim.api.nvim_create_autocmd

function R(name)
	require("plenary.reload").reload_module(name)
end

local yank_group = augroup("HighlightYank", {})

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

autocmd({ "BufWritePre" }, {
	group = RaphMtGroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if vim.fn.argv(0) == "" then
			-- open telescope
			require("raphmt.util.telescope-config").project_files()
		end
	end,
})

autocmd("LspAttach", {
	group = RaphMtGroup,
	callback = function(e)
		local opts = { buffer = e.buf }
		vim.keymap.set("n", "<leader>vr", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, opts)
	end,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
