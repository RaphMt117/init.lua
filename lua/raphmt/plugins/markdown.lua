return {
	-- cool highlights for markdown files
	-- {
	-- 	"lukas-reineke/headlines.nvim",
	-- 	event = "VeryLazy",
	-- 	dependencies = "nvim-treesitter/nvim-treesitter",
	-- 	opts = {
	-- 		norg = {
	-- 			headline_highlights = false,
	-- 		},
	-- 		md = {
	-- 			headline_highlights = false,
	-- 		},
	-- 	},
	-- },

	-- markdown preview in your broser tab
	{
		"iamcco/markdown-preview.nvim",
		event = "VeryLazy",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
}
