-- return {
-- 	"nvim-treesitter.configs",
-- 	opts({
-- 		ensure_installed = {
-- 			"javascript",
-- 			"typescript",
-- 			"go",
-- 			"html",
-- 			"css",
-- 			"bash",
-- 			"markdown",
-- 			"markdown_inline",
-- 			"lua",
-- 			"sql",
-- 			"regex",
-- 			"json",
-- 			"vimdoc",
-- 		},
--
-- 		sync_install = false,
-- 		auto_install = true,
-- 		indent = { enable = true },
-- 		autotag = { enable = true },
-- 		highlight = {
-- 			enable = true,
-- 			additional_vim_regex_highlighting = false,
-- 		},
-- 	}),
-- }
require("nvim-treesitter.configs").setup({

	ensure_installed = {
		"javascript",
		"typescript",
		"go",
		"html",
		"css",
		"bash",
		"markdown",
		"markdown_inline",
		"lua",
		"sql",
		"regex",
		"json",
		"vimdoc",
	},

	sync_install = false,
	auto_install = true,
	indent = { enable = true },
	autotag = { enable = true },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
