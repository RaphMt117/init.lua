require("raphmt.set")
require("raphmt.keybind")
require("raphmt.plugins")

--  plugins
require("raphmt.plugins.autopairs")
require("raphmt.plugins.bufferline")
require("raphmt.plugins.comment")
require("raphmt.plugins.conform")
require("raphmt.plugins.gitsigns")
require("raphmt.plugins.harpoon")
require("raphmt.plugins.leap")
-- require("raphmt.plugins.lsp")
require("raphmt.plugins.lualine")
require("raphmt.plugins.treesitter")
require("raphmt.plugins.surrounds")
require("raphmt.plugins.tabline")
require("raphmt.plugins.telescope")
require("raphmt.plugins.theme")
require("raphmt.plugins.treesitter")

-- load neotree on launch
-- vim.api.nvim_create_augroup("neotree", {})
-- vim.api.nvim_create_autocmd("UiEnter", {
-- 	desc = "Open Neotree automatically",
-- 	group = "neotree",
-- 	callback = function()
-- 		if vim.fn.argc() == 0 then
-- 			vim.cmd("Neotree toggle")
-- 		end
-- 	end,
-- })
