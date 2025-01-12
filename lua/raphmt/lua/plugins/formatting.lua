return {
	-- formatter
	{
		"stevearc/conform.nvim",
		event = "VeryLazy",

		config = function()
			require("conform").setup({
				log_level = vim.log.levels.DEBUG,
				formatters_by_ft = {
					lua = { "stylua" },
					markdown = { "markdown-toc" },
					php = { "intelephense" },
					python = { "black" },
				},

				format_on_save = function(bufnr)
					-- Disable autoformat on certain filetypes
					local ignore_filetypes = { "sql", "norg" }
					if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
						return
					end
					-- Disable with a global or buffer-local variable
					if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
						return
					end
					-- Disable autoformat for files in a certain path
					local bufname = vim.api.nvim_buf_get_name(bufnr)
					if bufname:match("/node_modules/") then
						return
					end
					-- ...additional logic...
					return { timeout_ms = 500, async = false, quiet = false }
				end,

				format_after_save = function(bufnr)
					if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
						return
					end

					-- ...additional logic...
					return { lsp_fallback = true }
				end,
			})
			-- require("conform").formatters.black = {
			-- 	inherit = false,
			-- 	command = "black",
			-- 	args = { "-l", "120", "$FILENAME" },
			-- }
		end,
	},
}
