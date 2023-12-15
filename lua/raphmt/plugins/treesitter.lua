return {

	-- highlights based on language parsers
	{
		"nvim-treesitter/nvim-treesitter",
		init = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
		opts = {
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		},
		event = "VeryLazy",
		config = function()
			require("nvim-treesitter.configs").setup({

				ensure_installed = {
					"javascript",
					"typescript",
					"go",
					"html",
					"json",
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
		end,
	},

	-- install and manage lsp servers, linters and formatters easily
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			-- import mason
			local mason = require("mason")

			-- import mason-lspconfig
			local mason_lspconfig = require("mason-lspconfig")

			local mason_tool_installer = require("mason-tool-installer")

			-- enable mason and configure icons
			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			mason_lspconfig.setup({
				ensure_installed = {
					"tsserver",
					"html",
					"cssls",
					"tailwindcss",
					"lua_ls",
					"emmet_ls",
					"prismals",
				},
				-- auto-install configured servers (with lspconfig)
				automatic_installation = true, -- not the same as ensure_installed
			})

			mason_tool_installer.setup({
				ensure_installed = {
					"prettier", -- prettier formatter
					"stylua", -- lua formatter
					"eslint_d", -- js linter
				},
			})
		end,
	},
}
