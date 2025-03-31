return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        -- dashboard = { enabled = true },
        -- explorer = { enabled = true },
        indent = { enabled = true },
        -- input = { enabled = true },
        picker = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        -- scroll = { enabled = true },
        -- statuscolumn = { enabled = true },
        words = { enabled = true },
    },
    config = function()
        picker = require("snacks.picker")

        require("which-key").add(
            {
                { "<leader>fJ", function() picker.jumps() end,                                                              desc = "Jump list (snacks)" },
                { "<leader>l",  group = "LSP" },
                { "<leader>lL", function() picker.lsp_references({ layout = { preset = "vscode", preview = "main" } }) end, desc = "Links (snacks)" },
                { "<leader>ls", function() picker.lsp_symbols({ layout = { preset = "vscode", preview = "main" } }) end,    desc = "Document symbols (snacks)" },
                { "<leader>s",  group = "Search" },
                { "<leader>sF", function() picker.smart() end,                                                              desc = "Find files (snacks)" },
            }
        )
    end
}
