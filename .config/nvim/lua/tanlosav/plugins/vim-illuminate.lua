return {
    "RRethy/vim-illuminate",
    config = function()
        require('illuminate').configure({})

        -- You'll also get <a-n> and <a-p> as keymaps to move between references
        -- and <a-i> as a textobject for the reference illuminated under the cursor.
    end
}