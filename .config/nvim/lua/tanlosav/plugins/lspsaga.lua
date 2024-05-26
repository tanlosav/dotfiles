return {
    'nvimdev/lspsaga.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    },
    config = function()
        require('lspsaga').setup({
            finder = {
                max_height = 0.5,
                left_width = 0.4,
                methods = {},
                default = 'ref+imp',
                layout = 'float',
                silent = false,
                filter = {},
                fname_sub = nil,
                sp_inexist = false,
                sp_global = false,
                ly_botright = false,
                keys = {
                  shuttle = '[w',
                  toggle_or_open = '<CR>',
                  vsplit = 'v',
                  split = 'h',
                  tabe = 't',
                  tabnew = 'r',
                  quit = 'q',
                  close = '<C-c>k',
                },
              },
            -- callhierarchy = {
            --     layout = 'float',
            --     left_width = 0.2,
            --     keys = {
            --       edit = '<CR>',
            --       vsplit = 'v',
            --       split = 'h',
            --       tabe = 't',
            --       close = '<C-c>k',
            --       quit = 'q',
            --       shuttle = '[w',
            --       toggle_or_req = 'u',
            --     },
            --   },
            typehierarchy = {
                layout = 'float',
                left_width = 0.2,
                keys = {
                  edit = '<CR>',
                  vsplit = 'v',
                  split = 'h',
                  tabe = 't',
                  close = '<C-c>k',
                  quit = 'q',
                  shuttle = '[w',
                  toggle_or_req = 'u',
                },
              },
            implement = {
                enable = true,
                sign = true,
                lang = {},
                virtual_text = true,
                priority = 100,
              },
              outline = {
                win_position = 'right',
                win_width = 30,
                auto_preview = true,
                detail = true,
                auto_close = true,
                close_after_jump = true,
                layout = 'normal',
                max_height = 0.5,
                left_width = 0.3,
                keys = {
                  toggle_or_jump = '<CR>',
                  quit = 'q',
                  jump = 'e',
                },
              },
            lightbulb = {
                enable = false,
                sign = true,
                debounce = 10,
                sign_priority = 40,
                virtual_text = true,
                enable_in_insert = true,
              },
        })

        vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', { desc = "Show documentation" })

        require("which-key").register({
            l = {
            --   s = {
            --     name = "LSP Saga",
                -- c = { "<cmd>Lspsaga incoming_calls<CR>", "Calls" },
                d = { "<cmd>Lspsaga peek_definition<CR>", "Peek definition" },
                l = { "<cmd>Lspsaga finder tyd+def+ref+imp<CR>", "Links" },
                o = { "<cmd>Lspsaga outline<CR>", "Outline" },
                t = { "<cmd>Lspsaga peek_type_definition<CR>", "Type definition" },
                g = {
                    name = "Go to",
                    d = { "<cmd>Lspsaga goto_definition<CR>", "Go to definition" },
                    t = { "<cmd>Lspsaga goto_type_definition<CR>", "Go to type definition" },
                },
            --   },
            },
          },
          { prefix = "<leader>" }
        )
    end,
}