return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim",                   opts = {} },
    },
    config = function()
        -- import lspconfig plugin
        local lspconfig = require("lspconfig")

        -- import mason_lspconfig plugin
        local mason_lspconfig = require("mason-lspconfig")

        -- import cmp-nvim-lsp plugin
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap -- for conciseness

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf, silent = true }

                opts.desc = "Restart LSP"
                keymap.set("n", "<leader>lx", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

                require("which-key").add(
                    {
                        { "<leader>d",   vim.diagnostic.open_float,                desc = "Show line diagnostics" },
                        { "<leader>D",   "<cmd>Telescope diagnostics bufnr=0<CR>", desc = "Show buffer diagnostics" },
                        { "<leader>[d]", vim.diagnostic.goto_prev,                 desc = "Go to previous diagnostic" },
                        { "<leader>]d",  vim.diagnostic.goto_next,                 desc = "Go to next diagnostic" },
                        { "<leader>l",   group = "LSP" },
                        { "<leader>lr",  vim.lsp.buf.rename,                       desc = "Smart rename" },
                        { "<leader>lx",  ":LspRestart<CR>",                        desc = "Restart LSP" },
                    }
                )
            end,
        })

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        -- (not in youtube nvim video)
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        mason_lspconfig.setup_handlers({
            -- default handler for installed servers
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                })
            end,
            -- ["svelte"] = function()
            --   -- configure svelte server
            --   lspconfig["svelte"].setup({
            --     capabilities = capabilities,
            --     on_attach = function(client, bufnr)
            --       vim.api.nvim_create_autocmd("BufWritePost", {
            --         pattern = { "*.js", "*.ts" },
            --         callback = function(ctx)
            --           -- Here use ctx.match instead of ctx.file
            --           client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
            --         end,
            --       })
            --     end,
            --   })
            -- end,
            -- ["graphql"] = function()
            --   -- configure graphql language server
            --   lspconfig["graphql"].setup({
            --     capabilities = capabilities,
            --     filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
            --   })
            -- end,
            -- ["emmet_ls"] = function()
            --   -- configure emmet language server
            --   lspconfig["emmet_ls"].setup({
            --     capabilities = capabilities,
            --     filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
            --   })
            -- end,
            ["lua_ls"] = function()
                -- configure lua server (with special settings)
                lspconfig["lua_ls"].setup({
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            -- make the language server recognize "vim" global
                            diagnostics = {
                                globals = { "vim" },
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                })
            end,
        })
    end,
}
