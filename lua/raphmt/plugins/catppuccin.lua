-- color scheme, with tons of integrations
return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", --  frappe, macchiato, mocha
			background = { -- :h background
				light = "mocha",
				dark = "mocha",
			},
			transparent_background = false, -- disables setting the background color.
			show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
			term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
			dim_inactive = {
				enabled = true, -- dims the background color of inactive window
				shade = "light",
				percentage = 0.4, -- percentage of the shade to apply to the inactive window
			},
			no_italic = false, -- Force no italic
			no_bold = false, -- Force no bold
			no_underline = false, -- Force no underline
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" }, -- Change the style of comments
				conditionals = { "italic" },
				loops = { "italic" },
				functions = { "italic" },
				keywords = { "bold" },
				strings = { "italic" },
				variables = { "bold" },
				numbers = { "italic" },
				booleans = { "italic" },
				properties = {},
				types = {},
				operators = {},
			},
			color_overrides = {},
			custom_highlights = function(colors)
				return {
					Comment = { fg = "#89AEB1" },
					LineNr = { fg = colors.overlay0 },
				}
			end,
			integrations = {
				cmp = true,
				gitsigns = true,
				treesitter = true,
				notify = true,
				mini = true,
				telescope = {
					enabled = true,
					style = "nvchad",
				},
				noice = true,
				markdown = true,
				coc_nvim = true,
				leap = true,
				harpoon = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
				illuminate = {
					enabled = true,
					lsp = true,
				},
				headlines = true,
				indent_blankline = {
					enabled = true,
					scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
					colored_indent_levels = false,
				},

				-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
			},
		})

		-- setup must be called before loading
		vim.cmd.colorscheme("catppuccin")

		local colors = require("catppuccin.palettes").get_palette()
		local TelescopeColor = {
			TelescopeMatching = { fg = colors.red },
			TelescopeSelection = { fg = colors.flamingo, bg = colors.mantle, bold = true },

			TelescopePromptPrefix = { bg = colors.mantle, fg = colors.flamingo }, -- ">" border
			TelescopePromptNormal = { bg = colors.mantle }, -- typing field
			TelescopeResultsNormal = { bg = colors.mantle }, -- results background
			TelescopePreviewNormal = { bg = colors.mantle }, -- preview background

			-- line border
			TelescopePromptBorder = { bg = colors.mantle, fg = colors.mantle },
			TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
			TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },

			-- tittles
			TelescopePromptTitle = { bg = colors.mantle, fg = colors.surface0 },
			TelescopeResultsTitle = { bg = colors.mantle, fg = colors.surface0, bold = true },
			TelescopePreviewTitle = { bg = colors.mantle, fg = colors.surface0 },
		}

		for hl, col in pairs(TelescopeColor) do
			vim.api.nvim_set_hl(0, hl, col)
		end
	end,
}
