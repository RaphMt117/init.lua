local M = {}
local builtin = require("telescope.builtin")

local is_inside_work_tree = {}

M.project_files = function()
	local opts = { "follow=true no_ignore=true hidden=true" } -- telescope opts

	local cwd = vim.fn.getcwd()
	if is_inside_work_tree[cwd] == nil then
		vim.fn.system("git rev-parse --is-inside-work-tree")
		is_inside_work_tree[cwd] = vim.v.shell_error == 0
	end

	builtin.find_files(opts)
end

return M
