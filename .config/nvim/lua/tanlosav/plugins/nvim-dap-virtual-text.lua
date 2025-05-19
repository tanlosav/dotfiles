return {
    'theHamsta/nvim-dap-virtual-text',
    config = function()
        local dvt = require("nvim-dap-virtual-text")
        dvt.setup({
            only_first_definition = false,
            all_references = true,
            virt_text_pos = "eol"
        })
    end
}
