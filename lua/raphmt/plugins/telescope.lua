local actions = require('telescope.actions')
    local toggle_modes = function()
        local mode = api.nvim_get_mode().mode
        if mode == "n" then
            cmd [[startinsert]]
            return
        elseif mode == "i" then
            cmd [[stopinsert]]
            return
        end
    end
    require('telescope').setup{
    extensions = {
    undo = {},
    },
        defaults = {
            --horizontal vertical flex center
            layout_strategy='horizontal',
            mappings = {
                i = {
                    ["<esc>"] = actions.close,
                    ["<c-j>"] = actions.move_selection_next,
                    ["<c-k>"] = actions.move_selection_previous,
                    ["<tab>"] = toggle_modes,
                    ["<c-s>"] = actions.toggle_selection,
                    ["<C-q>"] = actions.send_to_qflist,
                },
            },
        },
    }

require("telescope").load_extension("undo")
