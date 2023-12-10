require("illuminate").configure({
	providers = {
		"lsp",
		"treesitter",
		"regex",
	},
	delay = 50,
	filetype_overrides = {},
	under_cursor = false,
})
