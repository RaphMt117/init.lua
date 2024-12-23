-- linters and formatter
return {
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-lua/plenary.nvim", "jay-babu/mason-null-ls.nvim" },
	opts = function()
		local mason_null_ls = require("mason-null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local null_ls = require("null-ls")
		local null_ls_utils = require("null-ls.utils")
		local formatting = null_ls.builtins.formatting

		mason_null_ls.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
			},
		})

		local opts = {
			root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),

			sources = {
				-- diagnostics.eslint,
				-- formatting.prettier,
				formatting.gofumpt,
				formatting.goimports_reviser,
				-- reduce long lines
				-- formatting.golines,
				-- simpler version
				-- formatting.goimports,

				-- formatting.black.with({
				-- 	extra_args = { "--line-length=120" },
				-- }),
				-- diagnostics.mypy,
			},

			-- formatting on save
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({
						group = augroup,
						buffer = bufnr,
					})
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		}

		return opts
	end,
}
