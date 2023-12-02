require("nvim-autopairs").setup()

local pairs_map = {
	['"'] = '"',
	["("] = ")",
	["["] = "]",
	["{"] = "}",
	["`"] = "`",
	["```"] = "```",
	["<"] = ">",
}
local disable_filetype = { "TelescopePrompt" }
local break_line_filetype = nil -- mean all file type
local ignored_next_char = "[%w%.]"
