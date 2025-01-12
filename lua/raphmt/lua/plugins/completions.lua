return {
	-- "hrsh7th/nvim-cmp",
	-- version = false, -- last release is way too old
	-- event = "InsertEnter",
	-- dependencies = {
	-- 	{
	-- 		-- cmp sources plugins
	-- 		"saadparwaiz1/cmp_luasnip",
	-- 		"hrsh7th/cmp-nvim-lua",
	-- 		"hrsh7th/cmp-nvim-lsp",
	-- 		"hrsh7th/cmp-buffer",
	-- 		"hrsh7th/cmp-path",
	-- 	},
	-- 	{
	-- 		-- snippet plugin
	-- 		"L3MON4D3/LuaSnip",
	-- 		dependencies = "rafamadriz/friendly-snippets",
	-- 		opts = { history = true, updateevents = "TextChanged,TextChangedI" },
	-- 		config = function()
	-- 			Luasnip = function(opts)
	-- 				require("luasnip").config.set_config(opts)
	--
	-- 				require("luasnip.loaders.from_vscode").lazy_load()
	-- 				require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.g.vscode_snippets_path or "" })
	--
	-- 				require("luasnip.loaders.from_snipmate").load()
	-- 				require("luasnip.loaders.from_snipmate").lazy_load({ paths = vim.g.snipmate_snippets_path or "" })
	--
	-- 				require("luasnip.loaders.from_lua").load()
	-- 				require("luasnip.loaders.from_lua").lazy_load({ paths = vim.g.lua_snippets_path or "" })
	--
	-- 				vim.api.nvim_create_autocmd("InsertLeave", {
	-- 					callback = function()
	-- 						if
	-- 							require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
	-- 							and not require("luasnip").session.jump_active
	-- 						then
	-- 							require("luasnip").unlink_current()
	-- 						end
	-- 					end,
	-- 				})
	-- 			end
	-- 		end,
	-- 	},
	--
	-- 	{
	-- 		"windwp/nvim-autopairs",
	-- 		opts = {
	-- 			fast_wrap = {},
	-- 			disable_filetype = { "TelescopePrompt", "vim" },
	-- 		},
	-- 		config = function(_, opts)
	-- 			require("nvim-autopairs").setup(opts)
	--
	-- 			-- setup cmp for autopairs
	-- 			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	-- 			require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
	-- 		end,
	-- 	},
	-- },
	--
	-- opts = function(_, _)
	-- 	vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
	-- 	local cmp = require("cmp")
	-- 	local defaults = require("cmp.config.default")()
	-- 	return {
	-- 		completion = {
	-- 			completeopt = "menu,menuone,noinsert",
	-- 		},
	--
	-- 		snippet = {
	-- 			expand = function(args)
	-- 				require("luasnip").lsp_expand(args.body)
	-- 			end,
	-- 		},
	--
	-- 		mapping = cmp.mapping.preset.insert({
	-- 			["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
	-- 			["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
	-- 			["<S-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
	-- 			["<S-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
	--
	-- 			["<S-h>"] = cmp.mapping.scroll_docs(-3),
	-- 			["<S-l>"] = cmp.mapping.scroll_docs(3),
	--
	-- 			-- Accept currently selected item. Set `select` to `false` to only confirm
	-- 			-- explicitly selected items.
	-- 			["<CR>"] = cmp.mapping.confirm({ select = true }),
	--
	-- 			["<ESC>"] = cmp.mapping.abort(),
	--
	-- 			-- Accept currently selected item. Set `select` to `false` to only confirm
	-- 			-- explicitly selected items.
	-- 			["<S-CR>"] = cmp.mapping.confirm({
	-- 				behavior = cmp.ConfirmBehavior.Replace,
	-- 				select = true,
	-- 			}),
	--
	-- 			["<C-CR>"] = function(fallback)
	-- 				cmp.abort()
	-- 				fallback()
	-- 			end,
	-- 		}),
	-- 		sources = cmp.config.sources({
	-- 			{ name = "nvim_lsp" },
	-- 			{ name = "luasnip" },
	-- 			{ name = "path" },
	-- 			{ name = "buffer" },
	-- 		}),
	-- 		sorting = defaults.sorting,
	-- 	}
	-- end,
	-- ---@param opts cmp.ConfigSchema
	-- config = function(_, opts)
	-- 	for _, source in ipairs(opts.sources) do
	-- 		source.group_index = source.group_index or 1
	-- 	end
	-- 	require("cmp").setup(opts)
	-- end,

	----------------------------
	-- Autocompletion
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		-- Snippet Engine & its associated nvim-cmp source
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",

		-- Adds LSP completion capabilities
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",

		-- Adds a number of user-friendly snippets
		"rafamadriz/friendly-snippets",

		-- Adds vscode-like pictograms
		"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		local kind_icons = {
			Text = "",
			Method = "󰆧",
			Function = "󰊕",
			Constructor = "",
			Field = "󰇽",
			Variable = "󰂡",
			Class = "󰠱",
			Interface = "",
			Module = "",
			Property = "󰜢",
			Unit = "",
			Value = "󰎠",
			Enum = "",
			Keyword = "󰌋",
			Snippet = "",
			Color = "󰏘",
			File = "󰈙",
			Reference = "",
			Folder = "󰉋",
			EnumMember = "",
			Constant = "󰏿",
			Struct = "",
			Event = "",
			Operator = "󰆕",
			TypeParameter = "󰅲",
		}
		require("luasnip.loaders.from_vscode").lazy_load()
		luasnip.config.setup({})

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			mapping = cmp.mapping.preset.insert({
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-h>"] = cmp.mapping.scroll_docs(-4),
				["<C-l>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete({}),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "calc" },
				{ name = "emoji" },
				{ name = "treesitter" },
				{ name = "crates" },
				{ name = "tmux" },
			},
			formatting = {
				format = function(entry, vim_item)
					local lspkind_ok, lspkind = pcall(require, "lspkind")
					if not lspkind_ok then
						-- From kind_icons array
						vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
						-- Source
						vim_item.menu = ({
							nvim_lsp = "[LSP]",
							nvim_lua = "[Lua]",
							luasnip = "[LuaSnip]",
							buffer = "[Buffer]",
							latex_symbols = "[LaTeX]",
						})[entry.source.name]
						return vim_item
					else
						-- From lspkind
						return lspkind.cmp_format()(entry, vim_item)
					end
				end,
			},
		})
	end,
}
