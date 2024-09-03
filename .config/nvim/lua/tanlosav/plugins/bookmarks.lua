return {
    "MattesGroeger/vim-bookmarks",
    config = function()
        -- Add/remove bookmark at current line	mm	:BookmarkToggle
        -- Jump to next bookmark in buffer	mn	:BookmarkNext
        -- Add/edit/remove annotation at current line	mi	:BookmarkAnnotate <TEXT>
        -- Jump to previous bookmark in buffer	mp	:BookmarkPrev
        -- Show all bookmarks (toggle)	ma	:BookmarkShowAll
        -- Clear bookmarks in current buffer only	mc	:BookmarkClear
        -- Clear bookmarks in all buffers	mx	:BookmarkClearAll
        -- Save all bookmarks to a file		:BookmarkSave <FILE_PATH>
        -- Load bookmarks from a file		:BookmarkLoad <FILE_PATH>

        -- Save bookmarks per working dir, the folder you opened vim from
        vim.cmd("let g:bookmark_save_per_working_dir = 1")
        vim.cmd("let g:bookmark_auto_save = 1")

        -- Enables/disables warning when toggling to clear a bookmark with annotation
        vim.cmd("let g:bookmark_show_toggle_warning = 0")
        
        -- Use the location list to show all bookmarks
        vim.cmd("let g:bookmark_location_list = 1")

        -- Display annotation text on the status line
        vim.cmd("let g:bookmark_disable_ctrlp = 1")
    end
}