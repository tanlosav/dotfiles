return {
    "rmagatti/auto-session",
    config = function()
        local auto_session = require("auto-session")

        auto_session.setup({
            auto_restore = true,
            suppressed_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" }
        })

        vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

        -- require("which-key").register({
        --   s = {
        --         name = "Session",
        --         r = { "<cmd>SessionRestore<CR>", "Restore session for cwd" },
        --         s = { "<cmd>SessionSave<CR>", "Save session for auto session root dir" },
        --       },
        --   },
        --   { prefix = "<leader>" }
        -- )
    end,
}
