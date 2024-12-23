-- collection of lsp configs
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "antosha417/nvim-lsp-file-operations", config = true },
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
		"williamboman/mason-lspconfig.nvim",
		"williamboman/mason.nvim",
		-- Snipnet Engine
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip", -- luasnip completion engine
		-- Actual Snipnes
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }

		local on_attach = function(_, bufnr)
			opts.buffer = bufnr

			-- set keybinds
			opts.desc = "Show LSP references"
			keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

			opts.desc = "Go to declaration"
			keymap.set("n", "gd", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gD", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.renam, opts) -- smart rename

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

			keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
		end

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local servers = {
			clangd = {},
			gopls = {
				filetypes = {
					"go",
					"gomod",
					"gowork",
					"gotmpl",
				},
			},
			tsserver = {},
			ts_ls = {},
			html = {},
			cssls = {},
			emmet_ls = {
				filetypes = {
					"html",
					"typescriptreact",
					"javascript",
					"javascriptreact",
					"css",
					"sass",
					"scss",
					"less",
				},
			},
			-- lua_ls = {
			-- 	Lua = {
			-- 		-- diagnostics = {
			-- 		-- 	globals = { "vim" },
			-- 		-- },
			-- 		workspace = { checkThirdParty = false },
			-- 		telemetry = { enable = false },
			-- 	},

			-- lua_ls = {
			-- 	Lua = {
			-- 		-- make the language server recognize "vim" global
			-- 		-- workspace = {
			-- 		-- 	-- make language server aware of runtime files
			-- 		-- 	library = {
			-- 		-- 		[vim.fn.expand("$VIMRUNTIME/lua")] = true,
			-- 		-- 		[vim.fn.stdpath("config") .. "/lua"] = true,
			-- 		-- 	},
			-- 		-- 	checkThirdParty = false,
			-- 		-- },
			-- 		-- 	telemetry = { enable = false },
			-- 	},
			-- },
		}

		-- Ensure the servers above are installed
		local mason_lspconfig = require("mason-lspconfig")

		-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
		local capabilities = vim.lsp.protocol.make_client_capabilities()

		mason_lspconfig.setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
					on_attach = on_attach,
					settings = servers[server_name],
					filetypes = (servers[server_name] or {}).filetypes,
				})
			end,
		})
	end,
}
