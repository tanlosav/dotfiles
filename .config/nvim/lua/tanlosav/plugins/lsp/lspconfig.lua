return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim",                   opts = {} },
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- lspconfig.gopls.setup({
        --     capabilities = capabilities,
        --     settings = {
        --         gopls = {
        --             usePlaceholders = true,
        --             completeUnimported = true,
        --             staticcheck = true,
        --         },
        --     },
        -- })

        -- lspconfig.sourcekit.setup({
        --     capabilities = vim.tbl_deep_extend("force", capabilities, {
        --         workspace = {
        --             didChangeWatchedFiles = { dynamicRegistration = true },
        --         },
        --     }),
        -- })

        local keymap = vim.keymap -- for conciseness

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf, silent = true }

                require("which-key").add(
                    {
                        { "<leader>l",  group = "LSP" },
                        { "<leader>lr", vim.lsp.buf.rename, desc = "Smart rename" },
                        { "<leader>lx", ":LspRestart<CR>",  desc = "Restart LSP" },
                    }
                )
            end,
        })

        -- Change the Diagnostic symbols in the sign column (gutter)
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- -- used to enable autocompletion (assign to every lsp server config)
        -- local capabilities = cmp_nvim_lsp.default_capabilities()
    end,
}
