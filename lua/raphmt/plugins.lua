---@diagnostic disable: undefined-global
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- require("lazy").setup("raphmt.plugins", {
-- 	install = {},
-- 	checker = {
-- 		enabled = true,
-- 		notify = false,
-- 	},
-- 	change_detection = {
-- 		notify = false,
-- 	},
-- })

local plugins = {

	{
		"nvim-orgmode/orgmode",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter", lazy = true },
		},
		event = "VeryLazy",
		config = function()
			-- Load treesitter grammar for org
			require("orgmode").setup_ts_grammar()

			-- Setup treesitter
			require("nvim-treesitter.configs").setup({
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = { "org" },
				},
				ensure_installed = { "org" },
			})

			-- Setup orgmode
			require("orgmode").setup({
				org_agenda_files = "~/notes/",
				org_default_notes_file = "~/notes/reffile.org",
			})
		end,
	},

	-- cool highlights for markdown files
	{
		"lukas-reineke/headlines.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true, -- or `opts = {}`
		event = "VeryLazy",
	},

	-- quick navigation between functions, classes, methods...
	{
		"stevearc/aerial.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		event = "VeryLazy",
	},

	-- easy resize for nvim panes
	{ "mrjones2014/smart-splits.nvim" },

	-- quick navigation to a visible text
	{ "ggandor/leap.nvim", event = "VeryLazy" },

	-- highlight other uses of the word under the cursor
	{ "RRethy/vim-illuminate", event = "VeryLazy" },

	-- create, change and delete files like they are text in a buffer
	{
		"stevearc/oil.nvim",
		init = function()
			local netrw_bufname

			pcall(vim.api.nvim_clear_autocmds, { group = "FileExplorer" })

			vim.api.nvim_create_autocmd("VimEnter", {
				pattern = "*",
				once = true,
				callback = function()
					pcall(vim.api.nvim_clear_autocmds, { group = "FileExplorer" })
				end,
			})

			vim.api.nvim_create_autocmd("BufEnter", {
				group = vim.api.nvim_create_augroup("oil.nvim", { clear = true }),
				pattern = "*",
				callback = function()
					vim.schedule(function()
						if vim.bo[0].filetype == "netrw" then
							return
						end
						local bufname = vim.api.nvim_buf_get_name(0)
						if vim.fn.isdirectory(bufname) == 0 then
							_, netrw_bufname = pcall(vim.fn.expand, "#:p:h")
							return
						end

						-- prevents reopening of file-browser if exiting without selecting a file
						if netrw_bufname == bufname then
							netrw_bufname = nil
							return
						else
							netrw_bufname = bufname
						end

						-- ensure no buffers remain with the directory name
						vim.api.nvim_buf_set_option(0, "bufhidden", "wipe")

						require("oil").open_float()
					end)
				end,
				desc = "oil.nvim replacement for netrw",
			})
		end,
		opts = {
			keymaps = {
				["?"] = "actions.show_help",
				["<leader>v"] = "actions.select_split",
				["<leader>s"] = "actions.select_vsplt",
				["<leader>t"] = "actions.select_tab",
				["<leader>p"] = "actions.preview",
				["<leader>o"] = "actions.change_sort",
				["<leader>r"] = "actions.refresh",
				["<CR>"] = "actions.select",
				["<C-l>"] = "actions.select",
				["<Esc>"] = "actions.close",
				["<C-c>"] = "actions.close",
				["q"] = "actions.close",
				["H"] = "actions.toggle_hidden",
				["<C-h>"] = "actions.parent",
				["-"] = "actions.open_cwd",
				["."] = "actions.cd",
			},
			use_default_keymaps = false,
			columns = {
				"permissions",
				"size",
				"mtime",
				"icon",
			},
			default_file_explorer = false,
			view_options = {
				show_hidden = false,
				---@diagnostic disable-next-line: unused-local
				is_always_hidden = function(name, bufnr)
					return vim.startswith(name, ".DS_Store")
				end,
			},
			float = {
				padding = 3,
			},
		},
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter" },
			{ "nvim-tree/nvim-web-devicons", lazy = true },
		},
		event = "InsertEnter",
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

	-- easy navigation between neovim and tmux panes
	{
		"alexghergh/nvim-tmux-navigation",
		config = function()
			require("nvim-tmux-navigation").setup({
				disable_when_zoomed = true, -- defaults to false
				keybindings = {
					left = "<C-h>",
					down = "<C-j>",
					up = "<C-k>",
					right = "<C-l>",
					last_active = "<C-\\>",
					next = "<C-;>",
				},
				copy_sync = {
					-- TMUX >= 3.2: all yanks (and deletes) will get redirected to system
					-- clipboard by tmux
					redirect_to_clipboard = true,
				},
			})
		end,
	},

	-- better ui to nvim prompts
	{
		"stevearc/dressing.nvim",
		opts = {},
		event = "VeryLazy",
	},

	-- Autotriggered snippets, tabstops and other cool things
	{
		"L3MON4D3/LuaSnip",
		build = (not jit.os:find("Windows"))
				and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
			or nil,
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		opts = {
			history = true,
			delete_check_events = "TextChanged",
		},
		keys = {
			{
				"<tab>",
				function()
					return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
				end,
				expr = true,
				silent = true,
				mode = "i",
			},
			{
				"<tab>",
				function()
					require("luasnip").jump(1)
				end,
				mode = "s",
			},
			{
				"<s-tab>",
				function()
					require("luasnip").jump(-1)
				end,
				mode = { "i", "s" },
			},
		},
	},

	-- autocompletion for lsp, paths, snippets and in-line preview
	{
		"hrsh7th/nvim-cmp",
		version = false, -- last release is way too old
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
		},
		opts = function()
			vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
			local cmp = require("cmp")
			local defaults = require("cmp.config.default")()
			return {
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-h>"] = cmp.mapping.scroll_docs(-3),
					["<C-l>"] = cmp.mapping.scroll_docs(3),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<S-CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<C-CR>"] = function(fallback)
						cmp.abort()
						fallback()
					end,
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
					{ name = "orgmode" },
				}, {
					{ name = "buffer" },
				}),
				experimental = {
					ghost_text = {
						hl_group = "CmpGhostText",
					},
				},
				sorting = defaults.sorting,
			}
		end,
		---@diagnostic disable-next-line: undefined-doc-name
		---@param opts cmp.ConfigSchema
		config = function(_, opts)
			---@diagnostic disable-next-line: undefined-field
			for _, source in ipairs(opts.sources) do
				source.group_index = source.group_index or 1
			end
			require("cmp").setup(opts)
		end,
	},

	-- collection of lsp configs
	{
		"neovim/nvim-lspconfig",
		-- event = { "BufReadPre", "BufNewFile" },
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
			-- import lspconfig plugin
			local lspconfig = require("lspconfig")
			-- import cmp-nvim-lsp plugin
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			local keymap = vim.keymap -- for conciseness

			local opts = { noremap = true, silent = true }
			---@diagnostic disable-next-line: unused-local
			local on_attach = function(client, bufnr)
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
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
			end

			-- used to enable autocompletion (assign to every lsp server config)
			local capabilities = cmp_nvim_lsp.default_capabilities()

			-- Change the Diagnostic symbols in the sign column (gutter)
			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			-- configure html server
			lspconfig["html"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- configure typescript server with plugin
			lspconfig["tsserver"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- configure css server
			lspconfig["cssls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- configure tailwindcss server
			lspconfig["tailwindcss"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- configure emmet language server
			lspconfig["emmet_ls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
			})

			-- configure lua server (with special settings)
			lspconfig["lua_ls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = { -- custom settings for lua
					Lua = {
						-- make the language server recognize "vim" global
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							-- make language server aware of runtime files
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
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

	-- code actions, diagnostics and completion within LSP (null-ls, maintained by the community)
	{
		"nvimtools/none-ls.nvim", -- configure formatters & linters
		event = { "BufReadPre", "BufNewFile" }, -- to enable uncomment this
		dependencies = {
			"jay-babu/mason-null-ls.nvim",
		},
		config = function()
			local mason_null_ls = require("mason-null-ls")

			local null_ls = require("null-ls")

			local null_ls_utils = require("null-ls.utils")

			mason_null_ls.setup({
				ensure_installed = {
					"prettier", -- prettier formatter
					"stylua", -- lua formatter
					"eslint_d", -- js linter
				},
			})
			-- for conciseness
			local formatting = null_ls.builtins.formatting -- to setup formatters
			local diagnostics = null_ls.builtins.diagnostics -- to setup linters
			-- to setup format on save
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			-- configure null_ls
			null_ls.setup({
				-- add package.json as identifier for root (for typescript monorepos)
				root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
				-- setup formatters & linters
				sources = {
					--  to disable file types use
					--  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
					formatting.prettier, -- js/ts formatter
					diagnostics.eslint_d.with({ -- js/ts linter
						condition = function(utils)
							return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs" }) -- only enable if root has .eslintrc.js or .eslintrc.cjs
						end,
					}),
				},
				-- configure format on save
				on_attach = function(current_client, bufnr)
					if current_client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({
									filter = function(client)
										--  only use null-ls for formatting instead of lsp server
										return client.name == "null-ls"
									end,
									bufnr = bufnr,
								})
							end,
						})
					end
				end,
			})
		end,
	},

	-- collection of cool features for a quick start - using mini.move and mini.surround
	{ "echasnovski/mini.nvim", version = false, event = "VeryLazy" },

	-- color scheme, with tons of integrations
	{ "catppuccin/nvim", lazy = false, name = "catppuccin", priority = 1000 },

	-- find anything
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-tree/nvim-web-devicons",
		},
		extensions = {
			aerial = {
				-- Display symbols as <root>.<parent>.<symbol>
				show_nesting = {
					["_"] = false, -- This key will be the default
					json = true, -- You can set the option for specific filetypes
					yaml = true,
				},
			},
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					path_display = { "truncate " },
					mappings = {
						i = {
							["<S-k>"] = actions.move_selection_previous, -- move to prev result
							["<C-k>"] = actions.move_selection_previous, -- move to prev result
							["<S-j>"] = actions.move_selection_next, -- move to next result
							["<C-j>"] = actions.move_selection_next, -- move to next result
							["<S-v>"] = actions.select_vertical, -- open in vertical split
							["<S-h>"] = actions.select_horizontal, -- open in horizontal split
							["<S-s>"] = actions.select_horizontal, -- open in horizontal split
							["/"] = actions.select_vertical, -- open in horizontal split
							["<S-l>"] = actions.toggle_selection, -- select
							["<S-Tab>"] = actions.toggle_selection, -- select
							["<C-h>"] = "which_key", -- show keys
						},
						n = {
							["<S-v>"] = actions.select_vertical, -- open in vertical split
							["<S-h>"] = actions.select_horizontal, -- open in horizontal split
							["<S-s>"] = actions.select_horizontal, -- open in horizontal split
							["<S-l>"] = actions.toggle_selection, -- select
							["<C-h>"] = "which_key", -- show keys
						},
					},
				},
				pickers = {
					-- find_files = {
					-- 	theme = "ivy",
					-- },
				},
			})

			telescope.load_extension("fzf")
			telescope.load_extension("aerial")
		end,
	},

	-- telescope plugin for search last changes on current file
	{
		"debugloop/telescope-undo.nvim",
		dependencies = {
			{
				"nvim-telescope/telescope.nvim",
				dependencies = { "nvim-lua/plenary.nvim" },
			},
		},
		opts = {
			extensions = {
				undo = {
					side_by_side = true,
					diff_context_lines = vim.o.scrolloff,
					saved_only = false,
				},
			},
		},
		config = function(_, opts)
			require("telescope").setup(opts)
			require("telescope").load_extension("undo")
		end,
		event = "VeryLazy",
	},

	-- cool list of diagnostics, quickfix to help solving the trouble
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = { "TroubleToggle", "Trouble" },
		opts = { use_diagnostic_signs = true },
		keys = {
			{ "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
			{ "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
			{ "<leader>xL", "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
			{ "<leader>xQ", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
			{
				"[q",
				function()
					if require("trouble").is_open() then
						require("trouble").previous({ skip_groups = true, jump = true })
					else
						local ok, err = pcall(vim.cmd.cprev)
						if not ok then
							vim.notify(err, vim.log.levels.ERROR)
						end
					end
				end,
				desc = "Previous trouble/quickfix item",
			},
			{
				"]q",
				function()
					if require("trouble").is_open() then
						require("trouble").next({ skip_groups = true, jump = true })
					else
						local ok, err = pcall(vim.cmd.cnext)
						if not ok then
							vim.notify(err, vim.log.levels.ERROR)
						end
					end
				end,
				desc = "Next trouble/quickfix item",
			},
		},
		event = "VeryLazy",
	},

	-- easyly comment and uncomment lines and blocks
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
		event = "VeryLazy",
	},

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
	},

	-- formatter
	{ "stevearc/conform.nvim", event = "VeryLazy" },

	-- hot key to quick swap files in a list
	{ "theprimeagen/harpoon", event = "VeryLazy" },

	-- various common refactoring operations
	{
		"ThePrimeagen/refactoring.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("refactoring").setup()
		end,
	},

	-- git commands inside neovim
	{ "tpope/vim-fugitive", event = "VeryLazy" },

	-- see in buffer what is happening with git
	{ "lewis6991/gitsigns.nvim", event = "VeryLazy" },

	-- cool status line with lots of customization
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opts = true },
		event = "VeryLazy",
	},

	-- I mean {} " " ``
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
		event = "VeryLazy",
	},
}

local opts = {}

require("lazy").setup(plugins, opts)
