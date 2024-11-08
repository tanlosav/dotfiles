return {
    "EvWilson/spelunk.nvim",
    dependencies = {
        'nvim-lua/plenary.nvim',         -- For window drawing utilities
        'nvim-telescope/telescope.nvim', -- Optional: for fuzzy search capabilities
    },
    config = function()
        require('spelunk').setup({
            base_mappings = {
                toggle = '<leader>bt',
                add = '<leader>ba',
                next_bookmark = '<leader>bn',
                prev_bookmark = '<leader>bp',
                search_bookmarks = '<leader>bf', -- Fuzzy-find all bookmarks
                search_current_bookmarks = '<leader>bc' -- Fuzzy-find bookmarks in current stack
            },
            window_mappings = {
                cursor_down = 'j',
                cursor_up = 'k',
                bookmark_down = '<C-j>',
                bookmark_up = '<C-k',
                goto_bookmark = '<CR>',
                goto_bookmark_hsplit = 'x',
                goto_bookmark_vsplit = 'v',
                delete_bookmark = 'd',
                next_stack = '<Tab>',
                previous_stack = '<S-Tab>',
                new_stack = 'n',
                delete_stack = 'D',
                edit_stack = 'E',
                close = 'q',
                help = 'h', -- Not rebindable
            },
            -- Flag to enable directory-scoped bookmark persistence
            enable_persist = true,
            -- Prefix for the Lualine integration
            -- (Change this if your terminal emulator lacks emoji support)
            statusline_prefix = '🔖',
        })
    end
}