-- cool list of diagnostics, quickfix to help solving the trouble
return {
	"folke/trouble.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = { use_diagnostic_signs = true },
}
