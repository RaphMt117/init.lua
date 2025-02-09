return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		version = false,
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"debugloop/telescope-undo.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-ui-select.nvim",
			"kkharji/sqlite.lua",
		},

		keys = {
			{
				"<leader>f?",
				function()
					require("telescope.builtin").help_tags()
				end,
				desc = "Find Help",
			},

			{
				"<leader>fh",
				function()
					require("telescope.builtin").highlights()
				end,
				desc = "Find highlight groups",
			},

			{
				"<leader>fm",
				function()
					require("telescope.builtin").man_pages()
				end,
				desc = "Man Pages",
			},

			{
				"<leader>fo",
				function()
					require("telescope.builtin").oldfiles()
				end,
				desc = "Open Recent File",
			},

			{
				"<leader>fs",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Live Grep",
			},

			{
				"<leader>fx",
				function()
					require("telescope.builtin").diagnostics()
				end,
				desc = "Diagnostics",
			},

			{
				"<leader>fS",
				function()
					require("telescope.builtin").grep_string()
				end,
				desc = "Grep String",
			},

			{
				"<leader>fk",
				function()
					require("telescope.builtin").keymaps()
				end,
				desc = "Keymaps",
			},

			{
				"<leader>fc",
				function()
					require("telescope.builtin").commands()
				end,
				desc = "Commands",
			},

			{
				"<leader>f.",
				function()
					require("telescope.builtin").current_buffer_fuzzy_find()
				end,
				desc = "Find in current buffer",
			},

			{
				"<leader>ff",
				function()
					require("telescope.builtin").builtin()
				end,
				desc = "Commands",
			},

			{
				"<leader>fo",
				function()
					require("telescope.builtin").oldfiles()
				end,
				desc = "Old files",
			},

			{
				"<leader>fu",
				"<cmd>Telescope undo<cr>",
				desc = "Undo history",
			},

			{
				"<leader>fl",
				function()
					require("telescope.builtin").resume()
				end,
				desc = "Resume last search",
			},
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local trouble = require("trouble.sources.telescope")
			local icons = require("raphmt.lua.config.icons")

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "TelescopeResults",
				callback = function(ctx)
					vim.api.nvim_buf_call(ctx.buf, function()
						vim.fn.matchadd("TelescopeParent", "\t\t.*$")
						vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
					end)
				end,
			})

			local function document_symbols_for_selected(prompt_bufnr)
				local action_state = require("telescope.actions.state")
				local entry = action_state.get_selected_entry()

				if entry == nil then
					print("No file selected")
					return
				end

				actions.close(prompt_bufnr)

				vim.schedule(function()
					local bufnr = vim.fn.bufadd(entry.path)
					vim.fn.bufload(bufnr)

					local params = { textDocument = vim.lsp.util.make_text_document_params(bufnr) }

					vim.lsp.buf_request(bufnr, "textDocument/documentSymbol", params, function(err, result, _, _)
						if err then
							print("Error getting document symbols: " .. vim.inspect(err))
							return
						end

						if not result or vim.tbl_isempty(result) then
							print("No symbols found")
							return
						end

						local function flatten_symbols(symbols, parent_name)
							local flattened = {}
							for _, symbol in ipairs(symbols) do
								local name = symbol.name
								if parent_name then
									name = parent_name .. "." .. name
								end
								table.insert(flattened, {
									name = name,
									kind = symbol.kind,
									range = symbol.range,
									selectionRange = symbol.selectionRange,
								})
								if symbol.children then
									local children = flatten_symbols(symbol.children, name)
									for _, child in ipairs(children) do
										table.insert(flattened, child)
									end
								end
							end
							return flattened
						end

						local flat_symbols = flatten_symbols(result)

						-- Define highlight group for symbol kind
						vim.cmd([[highlight TelescopeSymbolKind guifg=#61AFEF]])

						require("telescope.pickers")
							.new({}, {
								prompt_title = "Document Symbols: " .. vim.fn.fnamemodify(entry.path, ":t"),
								finder = require("telescope.finders").new_table({
									results = flat_symbols,
									entry_maker = function(symbol)
										local kind = vim.lsp.protocol.SymbolKind[symbol.kind] or "Other"
										return {
											value = symbol,
											display = function(entry)
												local display_text = string.format("%-50s %s", entry.value.name, kind)
												return display_text,
													{
														{
															{ #entry.value.name + 1, #display_text },
															"TelescopeSymbolKind",
														},
													}
											end,
											ordinal = symbol.name,
											filename = entry.path,
											lnum = symbol.selectionRange.start.line + 1,
											col = symbol.selectionRange.start.character + 1,
										}
									end,
								}),
								sorter = require("telescope.config").values.generic_sorter({}),
								previewer = require("telescope.config").values.qflist_previewer({}),
								attach_mappings = function(_, map)
									map("i", "<CR>", function(prompt_bufnr)
										local selection = action_state.get_selected_entry()
										actions.close(prompt_bufnr)
										vim.cmd("edit " .. selection.filename)
										vim.api.nvim_win_set_cursor(0, { selection.lnum, selection.col - 1 })
									end)
									return true
								end,
							})
							:find()
					end)
				end)
			end

			telescope.setup({
				file_ignore_patterns = { "%.git/." },
				defaults = {
					mappings = {
						i = {
							["<esc>"] = actions.close,
							["<C-t>"] = trouble.open,

							["<C-s>"] = document_symbols_for_selected,
							["<C-k>"] = actions.move_selection_previous, -- move to prev result
							["<C-j>"] = actions.move_selection_next, -- move to next result
							["<C-v>"] = actions.select_vertical, -- open in vertical split
							["C-/"] = actions.select_horizontal, -- open in horizontal split
							["C-h"] = actions.select_horizontal, -- open in horizontal split
							["<C-l>"] = actions.toggle_selection, -- select
							["<S-Tab>"] = actions.toggle_selection, -- select
							["<C-?>"] = "which_key", -- show keys
							["<C-d>"] = actions.delete_buffer + actions.move_to_top,
						},

						n = {
							["<C-t>"] = trouble.open,
							["<esc>"] = actions.close,

							["<C-s>"] = document_symbols_for_selected,
							["<C-k>"] = actions.move_selection_previous, -- move to prev result
							["<C-j>"] = actions.move_selection_next, -- move to next result
							["<C-v>"] = actions.select_vertical, -- open in vertical split
							["C-/"] = actions.select_horizontal, -- open in horizontal split
							["C-h"] = actions.select_horizontal, -- open in horizontal split
							["<C-l>"] = actions.toggle_selection, -- select
							["<S-Tab>"] = actions.toggle_selection, -- select
							["<C-?>"] = "which_key", -- show keys
							["<C-d>"] = actions.delete_buffer + actions.move_to_top,
						},
					},
					-- path_display = formattedName,
					path_display = {
						"filename_first",
					},
					previewer = false,
					prompt_prefix = " " .. icons.ui.Telescope .. " ",
					selection_caret = icons.ui.BoldArrowRight .. " ",
					file_ignore_patterns = { "node_modules", "package-lock.json" },
					initial_mode = "insert",
					select_strategy = "reset",
					sorting_strategy = "ascending",
					color_devicons = true,
					set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
					layout_config = {
						prompt_position = "top",
						preview_cutoff = 120,
					},
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden",
						"--glob=!.git/",
					},
				},
				pickers = {
					find_files = {
						previewer = false,
						-- path_display = formattedName,
						layout_config = {
							height = 0.4,
							prompt_position = "top",
							preview_cutoff = 120,
						},
					},
					git_files = {
						previewer = false,
						-- path_display = formattedName,
						layout_config = {
							height = 0.4,
							prompt_position = "top",
							preview_cutoff = 120,
						},
					},
					buffers = {
						mappings = {
							i = {
								["<c-x>"] = actions.delete_buffer,
							},
							n = {
								["<c-x>"] = actions.delete_buffer,
							},
						},
						previewer = false,
						initial_mode = "insert",
						-- theme = "dropdown",
						layout_config = {
							height = 0.4,
							width = 0.6,
							prompt_position = "top",
							preview_cutoff = 120,
						},
					},
					current_buffer_fuzzy_find = {
						previewer = true,
						layout_config = {
							prompt_position = "top",
							preview_cutoff = 120,
						},
					},
					live_grep = {
						only_sort_text = true,
						previewer = true,
						layout_config = {
							prompt_position = "top",
							preview_cutoff = 120,
						},
					},
					grep_string = {
						only_sort_text = true,
						previewer = true,
						layout_config = {
							prompt_position = "top",
							preview_cutoff = 120,
						},
					},
					lsp_references = {
						show_line = false,
						previewer = true,
					},
					treesitter = {
						show_line = false,
						previewer = true,
					},
					colorscheme = {
						enable_preview = true,
					},
				},
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "ignore_case", -- "ignore_case"
					},
					undo = {
						side_by_side = true,
						-- diff_context_lines = vim.o.scrolloff,
						vim_diff_opts = { ctxlen = 0 },
						saved_only = false,
					},
				},
			})
			telescope.load_extension("fzf")
			telescope.load_extension("ui-select")
			-- telescope.load_extension("refactoring")
			-- telescope.load_extension("dap")
			telescope.load_extension("undo")
		end,
	},
}
