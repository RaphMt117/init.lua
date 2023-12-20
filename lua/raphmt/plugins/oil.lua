-- create, change and delete files like they are text in a buffer
return {
	"stevearc/oil.nvim",
	lazy = false,
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter" },
		{ "nvim-tree/nvim-web-devicons", lazy = true },
	},
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
		columns = {
			-- "permissions",
			-- "size",
			-- "mtime",
			-- "icon",
		},
		keymaps = {
			-- open
			["<CR>"] = "actions.select",
			["<Space>o"] = "actions.select",
			-- split
			["<leader>v"] = "actions.select_vsplit",
			["<leader>h"] = "actions.select_split",

			-- go back one directory
			["<BS>"] = "actions.parent",
			["<leader>p"] = "actions.parent",

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
			["<leader>r"] = "actions.refresh",
			["?"] = "actions.show_help",
		},
		view_options = {
			-- This function defines what will never be shown, even when `show_hidden` is set
			---@diagnostic disable-next-line: unused-local
			is_always_hidden = function(name, bufnr)
				return vim.startswith(name, "node_modules/")
			end,
		},
		use_default_keymaps = false,
		default_file_explorer = true,
	},
}
