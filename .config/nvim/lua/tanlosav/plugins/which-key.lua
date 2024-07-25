return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
    end,
    opts = {
        preset = "helix",
        delay = 500,
        win = {
            no_overlap = false,
            height = { min = 4, max = 25 },
        },
    },
}
