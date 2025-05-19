return {
    "andythigpen/nvim-coverage",
    version = "*",
    config = function()
        require("coverage").setup({
            auto_reload = true,
            lang = {
                go = {
                    coverage_file = vim.fn.getcwd() .. "/coverage.out",
                },
            },
        })
    end,
}
