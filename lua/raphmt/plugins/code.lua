return {

	-- collection of cool features for a quick start - using mini.move and mini.surround
	{
		"echasnovski/mini.nvim",
		version = false,
		event = "VeryLazy",
		config = function()
			require("mini.move").setup({
				-- Module mappings. Use `''` (empty string) to disable one.
				mappings = {
					-- Visual mode.
					left = "<S-h>",
					right = "<S-l>",
					down = "<S-j>",
					up = "<S-k>",

					-- Normal mode - disabled
					line_left = "",
					line_right = "",
					line_down = "",
					line_up = "",
				},
				options = {
					reindent_linewise = true,
				},
			})

			require("mini.surround").setup({
				-- Add custom surroundings to be used on top of builtin ones. For more
				-- information with examples, see `:h MiniSurround.config`.
				custom_surroundings = nil,

				-- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
				highlight_duration = 500,

				-- Module mappings. Use `''` (empty string) to disable one.
				mappings = {
					add = "sa", -- Add surrounding in Normal and Visual modes
					delete = "sd", -- Delete surrounding
					find = "sf", -- Find surrounding (to the right)
					find_left = "sF", -- Find surrounding (to the left)
					highlight = "sh", -- Highlight surrounding
					replace = "sr", -- Replace surrounding
					update_n_lines = "sn", -- Update `n_lines`

					suffixlast = "l", -- Suffix to search with "prev" method
					suffix_next = "n", -- Suffix to search with "next" method
				},

				-- Number of lines within which surrounding is searched
				n_lines = 20,

				-- Whether to respect selection type:
				-- - Place surroundings on separate lines in linewise mode.
				-- - Place surroundings on each line in blockwise mode.
				respect_selection_type = false,

				-- How to search for surrounding (first inside current line, then inside
				-- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
				-- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
				-- see `:h MiniSurround.config`.
				search_method = "cover",

				-- Whether to disable showing non-error feedback
				silent = false,
			})
		end,
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
			require("Comment").setup({

				-- NORMAL mode
				toggler = {
					-- Line-comment
					line = "gcc",
					-- Block-comment
					block = "gbc",
				},
				-- NORMAL and VISUAL mode
				opleader = {
					-- -Line-comment
					line = "gc",
					---Block-comment
					block = "gb",
				},
				--- extra mappings
				extra = {
					--- line above
					above = "gcO",
					--- line below
					below = "gco",
					--- end of line
					eol = "gca",
				},
			})
		end,
		event = "VeryLazy",
	},

	-- I mean {} " " ``  - OK
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})

			-- local pairs_map = {
			-- 	['"'] = '"',
			-- 	["("] = ")",
			-- 	["["] = "]",
			-- 	["{"] = "}",
			-- 	["`"] = "`",
			-- 	["```"] = "```",
			-- 	["<"] = ">",
			-- }
			-- local disable_filetype = { "TelescopePrompt" }
			-- local break_line_filetype = nil -- mean all file type
			-- local ignored_next_char = "[%w%.]"
		end,
		event = "VeryLazy",
	},
},
-- highlight other uses of the word under the cursor
{
	"RRethy/vim-illuminate",
	event = "VeryLazy",
	config = function()
		require("illuminate").configure({
			providers = {
				"lsp",
				"treesitter",
				"regex",
			},
			delay = 50, -- ms
			filetype_overrides = {},
			under_cursor = false,
			-- large_file_cutoff: number of lines at which to use large_file_config
			-- The `under_cursor` option is disabled when this cutoff is hit
			large_file_cutoff = 2000,
			-- large_file_config: config to use for large files (based on large_file_cutoff).
			-- Supports the same keys passed to .configure
			-- If nil, vim-illuminate will be disabled for large files.
			large_file_overrides = nil,
		})
	end,
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
}
