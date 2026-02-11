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
        local util = require("lspconfig.util")

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        lspconfig.sourcekit.setup({
            -- cmd = (vim.fn.has("mac") == 1) and { "xcrun", "sourcekit-lsp" } or { "sourcekit-lsp" },
            cmd = { "/usr/bin/sourcekit-lsp" },
            root_dir = util.root_pattern("Package.swift", ".git"),
            capabilities = capabilities,
        })

        local keymap = vim.keymap -- for conciseness

        -- vim.api.nvim_create_autocmd("LspAttach", {
        --     group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        --     callback = function(ev)
        --         -- Buffer local mappings.
        --         -- See `:help vim.lsp.*` for documentation on any of the below functions
        --         local opts = { buffer = ev.buf, silent = true }

        --         require("which-key").add(
        --             {
        --                 { "<leader>l",  group = "LSP" },
        --                 { "<leader>lr", vim.lsp.buf.rename, desc = "Smart rename" },
        --                 { "<leader>lx", ":LspRestart<CR>",  desc = "Restart LSP" },
        --             }
        --         )
        --     end,
        -- })
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local bufnr = ev.buf
                local client = vim.lsp.get_client_by_id(ev.data.client_id)

                -- Пусть :tag / Ctrl-] используют LSP вместо ctags (уберёт "no tags")
                vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"

                -- Базовая LSP-навигация (lspsaga уже даёт хоткеи; эти — на всякий случай)
                local map = function(lhs, rhs, desc)
                    vim.keymap.set("n", lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
                end
                map("gd", vim.lsp.buf.definition, "LSP: Go to definition")
                map("gr", vim.lsp.buf.references, "LSP: References")
                map("gI", vim.lsp.buf.implementation, "LSP: Implementations")
                map("gy", vim.lsp.buf.type_definition, "LSP: Type definition")
                -- Примечание: 'K' у тебя уже на lspsaga hover_doc. :contentReference[oaicite:2]{index=2}

                -- Inlay hints (типы/подсказки прямо в коде)
                if client.server_capabilities and (client.server_capabilities.inlayHintProvider ~= nil) then
                    local ok = pcall(function()
                        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                    end)
                    if not ok then
                        pcall(vim.lsp.inlay_hint, bufnr, true) -- fallback для старого API
                    end
                    map("<leader>li", function()
                        local enabled = false
                        pcall(function()
                            enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
                        end)
                        pcall(function()
                            vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
                        end)
                    end, "LSP: Toggle inlay hints")
                end
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
