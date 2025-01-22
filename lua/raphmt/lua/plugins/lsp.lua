return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
		{ "b0o/schemastore.nvim" },
		{ "hrsh7th/cmp-nvim-lsp" },
	},
	config = function()
		require("mason").setup({
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
		require("mason-lspconfig").setup({
			ensure_installed = vim.tbl_keys(require("raphmt.lua.plugins.lsp.servers")),
		})
		require("lspconfig.ui.windows").default_options.border = "single"

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
				map("gD", vim.lsp.buf.declaration, "Goto Declaration")
				map("gr", require("telescope.builtin").lsp_references, "Goto References")
				map("gi", require("telescope.builtin").lsp_implementations, "Goto Implementation")
				map("gt", require("telescope.builtin").lsp_type_definitions, "Type Definition")

				map("<leader>ls", require("telescope.builtin").lsp_document_symbols, "Document Symbols")

				map("<leader>lk", vim.diagnostic.open_float, "Open Diagnostic Float")

				map("K", vim.lsp.buf.hover, "Hover Documentation")
				map("J", vim.lsp.buf.signature_help, "Signature Documentation")

				map("<leader>d", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Goto Definition in Vertical Split")

				local wk = require("which-key")
				wk.add({
					{ "<leader>la", vim.lsp.buf.code_action, desc = "Code Action" },
					{
						"<leader>ls",
						vim.lsp.buf.signature_help,
						desc = "Display Signature Information",
					},
					{ "<leader>lr", vim.lsp.buf.rename, desc = "Rename all references" },
					{ "<leader>lf", vim.lsp.buf.format, desc = "Format" },
					{ "<leader>lw", require("telescope.builtin").diagnostics, desc = "Diagnostics" },
					{
						"<leader>lc",
						require("raphmt.lua.config.utils").copyFilePathAndLineNumber,
						desc = "Copy file path and line number",
					},
				})

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					local highlight_augroup = vim.api.nvim_create_augroup("nvim-lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})
					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("nvim-lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "nvim-lsp-highlight", buffer = event2.buf })
						end,
					})
				end
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		local mason_lspconfig = require("mason-lspconfig")

		mason_lspconfig.setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
					-- on_attach = require("plugins.lsp.on_attach").on_attach,
					settings = require("raphmt.lua.plugins.lsp.servers")[server_name],
					filetypes = (require("raphmt.lua.plugins.lsp.servers")[server_name] or {}).filetypes,
				})
			end,
		})

		vim.diagnostic.config({
			title = false,
			underline = true,
			virtual_text = true,
			signs = true,
			update_in_insert = true,
			severity_sort = false,
			float = {
				source = "if_many",
				style = "minimal",
				border = "rounded",
				header = "",
				prefix = "",
			},
		})

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end
	end,
}
