-- neorg
return {
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope" },
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.highlights"] = {},
					["core.integrations.treesitter"] = {},
					["core.completion"] = {
						config = {
							engine = "nvim-cmp",
							name = "[Neorg]",
						},
					}, -- Adds completion
					["core.integrations.telescope"] = {},
					["core.keybinds"] = {
						config = {
							hook = function(keybinds)
								-- Unmaps any Neorg key from the `norg` mode
								-- keybinds.unmap("norg", "n", "<C-space>")

								-- Binds the `gtd` key in `norg` mode to execute `:echo 'Hello'`
								keybinds.map(
									"norg",
									"n",
									"<leader><leader>",
									"<cmd>Telescope neorg find_norg_files<CR>"
								)
								keybinds.map("norg", "n", "<leader>fh", "<cmd>Telescope neorg search_headings<CR>")
								keybinds.map("norg", "n", "<leader>fw", "<cmd>Telescope neorg switch_workspace<CR>")
								keybinds.map("norg", "n", "<leader>l", "<cmd>Telescope neorg insert_file_link<CR>")

								-- Remap unbinds the current key then rebinds it to have a different action
								-- associated with it.
								-- The following is the equivalent of the `unmap` and `map` calls you saw above:
								keybinds.remap("norg", "n", "gtd", "<cmd>echo 'Hello!'<CR>")

								-- Sometimes you may simply want to rebind the Neorg action something is bound to
								-- versus remapping the entire keybind. This remap is essentially the same as if you
								-- did `keybinds.remap("norg", "n", "<C-Space>, "<cmd>Neorg keybind norg core.qol.todo_items.todo.task_done<CR>")
								keybinds.remap_event("norg", "n", "<C-Space>", "core.qol.todo_items.todo.task_done")
								keybinds.remap_event("norg", "n", "<C-CR>", "core.itero.next-iteration")

								-- Want to move one keybind into the other? `remap_key` moves the data of the
								-- first keybind to the second keybind, then unbinds the first keybind.
								keybinds.remap_key("norg", "n", "<M-CR>", "<leader>ov")
							end,
						},
					},
					["core.export"] = {},
					["core.summary"] = { config = { strategy = "default" } },
					["core.neorgcmd"] = { config = {} },
					["core.presenter"] = {
						config = {
							zen_mode = "zen-mode",
						},
					},
					["core.integrations.zen_mode"] = {},
					["core.ui"] = {},
					["core.export.markdown"] = {},
					["core.concealer"] = {
						config = {
							icon_preset = "diamond",
							conceal = true,
							init_open_folds = "always",
						},
					}, -- Adds pretty icons to your documents
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								work = "~/maindir/notes/work/",
								personal = "~/maindir/notes/personal/",
							},
						},
					},
				},
			})
		end,
	},
}
