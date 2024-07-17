return {
    "akinsho/toggleterm.nvim",
    config = function()
        local toggleterm = require("toggleterm")
        
        toggleterm.setup({
            size = 20,
            dir = "git_dir",
            -- direction = "horizontal",
            -- direction = "float",
        })

        -- require("which-key").register({
        --     t = {
        --           name = "Terminal",
        --           a = { "<cmd>ToggleTermToggleAll<CR>", "Toggle all terminals" },
        --           t = { "<cmd>ToggleTerm direction=float<CR>", "Toggle terminal in float mode" },
        --           h = { "<cmd>ToggleTerm direction=horizontal<CR>", "Toggle terminal in horizontal mode" },
        --         },
        --     }, 
        --     { prefix = "<leader>" }
        --   )
        require("which-key").add(
            {
                { "<leader>t", group = "Terminal" },
                { "<leader>ta", "<cmd>ToggleTermToggleAll<CR>", desc = "Toggle all terminals" },
                { "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", desc = "Toggle terminal in horizontal mode" },
                { "<leader>tt", "<cmd>ToggleTerm direction=float<CR>", desc = "Toggle terminal in float mode" },
            }            
        )
    end
}