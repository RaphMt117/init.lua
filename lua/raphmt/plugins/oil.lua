-- create, change and delete files like they are text in a buffer
return {
	"stevearc/oil.nvim",
	event = "InsertEnter",
	init = function()
		-- open oil as default file explorer
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

					require("oil").open()
				end)
			end,
			desc = "oil.nvim replacement for netrw",
		})
	end,

	opts = {
		keymaps = {
			["?"] = "actions.show_help",
			["<C-v>"] = "actions.select_split",
			["<C-s>"] = "actions.select_vsplt",
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
			-- "permissions",
			-- "size",
			-- "mtime",
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
	},
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter" },
		{ "nvim-tree/nvim-web-devicons", lazy = true },
	},
}
