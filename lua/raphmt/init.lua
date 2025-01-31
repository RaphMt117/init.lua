if vim.g.vscode then
	require("raphmt.lua.config.code.options")
	require("raphmt.lua.config.code.keymaps")
else
	require("raphmt.lua.config.options")
	require("raphmt.lua.config.keymaps")
	require("raphmt.lua.config.autocmds")
	require("raphmt.lua.config.abbreviations")
	require("raphmt.lua.config.lazy")
end
