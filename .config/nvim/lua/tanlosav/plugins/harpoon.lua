return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
    },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        -- basic telescope configuration
        local telescope = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            local make_finder = function()
                local paths = {}

                for _, item in ipairs(harpoon_files.items) do
                    table.insert(paths, item.value)
                end

                return require("telescope.finders").new_table({
                    results = paths,
                })
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = telescope.file_previewer({}),
                sorter = telescope.generic_sorter({}),
                attach_mappings = function(prompt_buffer_number, map)
                    map("i", "<c-d>", function()
                        local state = require("telescope.actions.state")
                        local selected_entry = state.get_selected_entry()
                        local current_picker = state.get_current_picker(prompt_buffer_number)

                        harpoon:list():remove(selected_entry)
                        current_picker:refresh(make_finder())
                    end)
                    return true
                end,
            }):find()
        end

        require("which-key").add(
            {
                { "<leader>m",  group = "Marks" },
                { "<leader>mm", function() harpoon:list():add() end,                         desc = "Add mark" },
                { "<leader>ml", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "List marks" },
                { "<leader>f",  group = "Telescope" },
                { "<leader>fm", function() toggle_telescope(harpoon:list()) end,             desc = "Marks" },
            }
        )
    end
}
