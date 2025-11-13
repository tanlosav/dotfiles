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
        picker = {
            enabled = true,
            matcher = {
                frecency = true,
            },
            debug = {
                scores = false,
            },
            layout = {
                preset = "ivy",
                -- When reaching the bottom of the results in the picker, I don't want
                -- it to cycle and go back to the top
                cycle = false,
            },
            layouts = {
                ivy = {
                    layout = {
                        box = "vertical",
                        backdrop = false,
                        row = -1,
                        width = 0,
                        height = 0.5,
                        border = "top",
                        title = " {title} {live} {flags}",
                        title_pos = "left",
                        { win = "input", height = 1, border = "bottom" },
                        {
                            box = "horizontal",
                            { win = "list",    border = "none" },
                            { win = "preview", title = "{preview}", width = 0.5, border = "left" },
                        },
                    },
                },
                vertical = {
                    layout = {
                        backdrop = false,
                        width = 0.8,
                        min_width = 80,
                        height = 0.8,
                        min_height = 30,
                        box = "vertical",
                        border = "rounded",
                        title = "{title} {live} {flags}",
                        title_pos = "center",
                        { win = "input",   height = 1,          border = "bottom" },
                        { win = "list",    border = "none" },
                        { win = "preview", title = "{preview}", height = 0.4,     border = "top" },
                    },
                },
            },
            win = {
                input = {
                    keys = {
                        -- to close the picker on ESC instead of going to normal mode,
                        -- add the following keymap to your config
                        ["<Esc>"] = { "close", mode = { "n", "i" } },
                        -- I'm used to scrolling like this in LazyGit
                        ["J"] = { "preview_scroll_down", mode = { "i", "n" } },
                        ["K"] = { "preview_scroll_up", mode = { "i", "n" } },
                        ["H"] = { "preview_scroll_left", mode = { "i", "n" } },
                        ["L"] = { "preview_scroll_right", mode = { "i", "n" } },
                    },
                },
            },
            -- formatters = {
            --     file = {
            --         filename_first = true, -- display filename before the file path
            --         truncate = 80,
            --     },
            -- },
        },
        -- notifier = { enabled = true },
        notifier = {
            enabled = true,
            top_down = false, -- place notifications from top to bottom
        },
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
                { "<leader>bg",  group = "Git actions" },
                { "<leader>bgl", function() Snacks.picker.git_log_file() end,                                                desc = "Git log file" },
                { "<leader>fJ",  function() picker.jumps() end,                                                              desc = "Jump list (snacks)" },
                { "<leader>l",   group = "LSP" },
                { "<leader>lL",  function() picker.lsp_references({ layout = { preset = "vscode", preview = "main" } }) end, desc = "Links (snacks)" },
                { "<leader>ls",  function() picker.lsp_symbols({ layout = { preset = "vscode", preview = "main" } }) end,    desc = "Document symbols (snacks)" },
                { "<leader>s",   group = "Search" },
                { "<leader>sf",  function() picker.smart() end,                                                              desc = "Find files (snacks)" },
                { "<leader>sP",  group = "Snacks Picker" },
                { "<leader>sPH", function() picker.highlights({ pattern = "hl_group:^Snacks" }) end,                         desc = "Highlighs" },
                {
                    "<leader>ep",
                    function()
                        picker.explorer({
                            cwd = vim.fn.expand("%:p:h"),
                            reveal = vim.api.nvim_buf_get_name(0),
                            layout = { preset = "vscode" },
                            follow = true,
                            focus = "input",
                            filtered = { gitignored = true, dotfiles = false },
                            on_confirm = "open",
                            auto_close = true,
                        })
                    end,
                    desc = "Explorer (float)",
                },
            }
        )
    end
}
