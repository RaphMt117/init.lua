return {
	"stevearc/oil.nvim",
	tag = "v2.10.0",
	lazy = false,
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter" },
		{ "nvim-tree/nvim-web-devicons", lazy = true },
	},
	keys = {
		-- { "<leader>e", ":Oil<CR>", silent = true, desc = "Oil" },
		{ "<leader>e", "<cmd>Oil --float<CR>", silent = true, desc = "Oil float" },
	},
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

					require("oil").open()
				end)
			end,
			desc = "oil.nvim replacement for netrw",
		})
	end,

	opts = {
		columns = {
			-- "permissions",
			-- "size",
			-- "mtime",
			-- "icon",
		},
		keymaps = {
			-- open
			["<CR>"] = "actions.select",
			["<C-l>"] = "actions.select",

			-- split
			["<leader>v"] = "actions.select_vsplit",
			["<leader>h"] = "actions.select_split",

			-- go back one directory
			["<BS>"] = "actions.parent",
			["C-h"] = "actions.parent",

			-- close
			["<Esc>"] = "actions.close",
			["<C-c>"] = "actions.close",
			["q"] = "actions.close",

			-- others
			["."] = "actions.cd", -- mark as root
			["H"] = "actions.toggle_hidden", -- show dotflies
			["-"] = "actions.open_cwd", -- open root
			["<leader>s"] = "actions.change_sort",
			["<C-p>"] = "actions.preview",
			["C-r"] = "actions.refresh",
			["?"] = "actions.show_help",
		},
		float = {
			padding = 8,
			max_width = 70,
			max_height = 60,
			border = "rounded",
			preview_split = "right", -- "auto", "left", "right", "above", "below".
		},
		buf_options = {
			buflisted = false,
			bufhidden = "hide",
		},
		view_options = {
			show_hidden = true,
		},
		use_default_keymaps = false,
		default_file_explorer = true,
	},
}
