-- cool status line with lots of customization
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", opts = true },
	event = "VeryLazy",
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "catppuccin",
				component_separators = { left = "", right = "|" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
				},
			},

			-- +-------------------------------------------------+
			-- | A | B | C                             X | Y | Z |
			-- +-------------------------------------------------+

			sections = {
				lualine_a = {
					"mode",
				},
				lualine_b = {},
				lualine_c = {
					{
						"filename",
						file_status = true, -- Displays file status (readonly status, modified status)
						newfile_status = false, -- Display new file status (new file means no write after created)
						path = 0, -- 0: Just the filename
						-- 1: Relative path
						-- 2: Absolute path
						-- 3: Absolute path, with tilde as the home directory
						-- 4: Filename and parent dir, with tilde as the home directory

						shorting_target = 40, -- Shortens path to leave 40 spaces in the window
						symbols = {
							modified = "[+]", -- Text to show when the file is modified.
							readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
							unnamed = "[Unnamed file duh]", -- Text to show for unnamed buffers.
							newfile = "[Omg a new file!!]", -- Text to show for newly created file before first write
						},
					},
				},
				lualine_x = { "diagnostics" },
				lualine_y = { "branch", "diff", "progress" },
				lualine_z = { "searchcount" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 0 } },
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			-- top
			winbar = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},

				lualine_y = {},
				lualine_z = {},
			},
			tabline = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "aerial" },
				lualine_x = {
					{
						"filename",
						path = 2, -- 2: Absolute path
						file_status = false, -- Displays file status (readonly status, modified status)
					},
				},
				lualine_y = {},
				lualine_z = {
					-- show pomodoro in line

					function()
						local ok, pomo = pcall(require, "pomo")
						if not ok then
							return ""
						end

						local timer = pomo.get_first_to_finish()
						if timer == nil then
							return ""
						end

						return "󰄉 " .. tostring(timer)
					end,
				},
			},

			extensions = {},
		})

		-- Sections:

		-- branch (git branch)
		-- buffers (shows currently available buffers)
		-- diagnostics (diagnostics count from your preferred source)
		-- diff (git diff status)
		-- encoding (file encoding)
		-- fileformat (file format)
		-- filename
		-- filesize
		-- filetype
		-- hostname
		-- location (location in file in line:column format)
		-- mode (vim mode)
		-- progress (%progress in file)
		-- searchcount (number of search matches when hlsearch is active)
		-- selectioncount (number of selected characters or lines)
		-- tabs (shows currently available tabs)
		-- windows (shows currently available windows)
	end,
}
