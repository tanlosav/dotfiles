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

        require("which-key").register({
            t = {
                  name = "Terminal",
                  a = { "<cmd>ToggleTermToggleAll<CR>", "Toggle all terminals" },
                  t = { "<cmd>ToggleTerm direction=float<CR>", "Toggle terminal in float mode" },
                  h = { "<cmd>ToggleTerm direction=horizontal<CR>", "Toggle terminal in horizontal mode" },
                },
            }, 
            { prefix = "<leader>" }
          )
    end
}