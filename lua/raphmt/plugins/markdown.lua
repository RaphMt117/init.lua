return {
	-- cool highlights for markdown files
	{
		"lukas-reineke/headlines.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		opts = {
			norg = {
				headline_highlights = false,
			},
		},
		event = "VeryLazy",
	},

	-- markdown preview in your broser tab
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		event = "VeryLazy",
	},
}
