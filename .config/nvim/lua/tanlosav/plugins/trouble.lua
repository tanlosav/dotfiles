return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  config = function()
    require('trouble').setup({})

    require("which-key").add(
      {
        { "<leader>x", group = "Trouble" },
        { "<leader>xf", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer Diagnostics (Trouble)" },
        { "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<CR>", desc = "LSP Definitions/references/... (Trouble)" },
        { "<leader>xL", "<cmd>Trouble loclist toggle<CR>", desc = "Location List (Trouble)" },
        { "<leader>xq", "<cmd>Trouble qflist toggle<CR>", desc = "Quickfix List (Trouble)" },
        { "<leader>xs", "<cmd>Trouble symbols toggle pinned=true results.win.relative=win results.win.position=right<CR>", desc = "Symbols (Trouble)" },
        { "<leader>xS", "<cmd>Trouble lsp_document_symbols toggle pinned=true results.win.relative=win results.win.position=right<CR>", desc = "Symbols (LSP)" },
        { "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics (Trouble)" },
      }    
    )
  end
}
