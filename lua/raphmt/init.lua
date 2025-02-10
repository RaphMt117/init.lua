if vim.g.vscode then
	-- vscode/codium extension specific config
	require("raphmt.lua.config.code.options")
	require("raphmt.lua.config.code.keymaps")
else
	-- neovim specific config
	require("raphmt.lua.config.options")
	require("raphmt.lua.config.keymaps")
	require("raphmt.lua.config.autocmds")
	require("raphmt.lua.config.abbreviations")
	require("raphmt.lua.config.lazy")
end
