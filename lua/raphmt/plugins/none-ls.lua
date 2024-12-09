-- linters and formatter
return {
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-lua/plenary.nvim", "jay-babu/mason-null-ls.nvim" },
	opts = function()
		local mason_null_ls = require("mason-null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		-- local diagnostics = null_ls.builtins.diagnostics
		local null_ls_utils = require("null-ls.utils")

		mason_null_ls.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				-- "eslint_d", -- js linter
				-- "phpcs", -- php linter and formatter
				-- "pretty-php",
				-- "black", -- python formatter
				-- "pyright",
				-- "pylint",
				-- "mypy",
				-- "ruff",
			},
		})

		local opts = {
			-- add package.json as identifier for root (for typescript monorepos)
			root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),

			sources = {
				-- diagnostics.eslint,
				formatting.prettier,
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

		-- markdownlint
		local nls = require("null-ls")
		opts.sources = vim.list_extend(opts.sources or {}, {
			nls.builtins.diagnostics.markdownlint,
		})

		return opts
	end,
}
