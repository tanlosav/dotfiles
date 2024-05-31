return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  config = function()
    require('trouble').setup({})

    require("which-key").register({
      x = {
            name = "Trouble",
            f = { "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", "Buffer Diagnostics (Trouble)" },
            l = { "<cmd>Trouble lsp toggle focus=false win.position=right<CR>", "LSP Definitions/references/... (Trouble)" },
            L = { "<cmd>Trouble loclist toggle<CR>", "Location List (Trouble)" },
            q = { "<cmd>Trouble qflist toggle<CR>", "Quickfix List (Trouble)" },
            s = { "<cmd>Trouble symbols toggle pinned=true results.win.relative=win results.win.position=right<CR>", "Symbols (Trouble)" },
            S = { "<cmd>Trouble lsp_document_symbols toggle pinned=true results.win.relative=win results.win.position=right<CR>", "Symbols (LSP)" },
            x = { "<cmd>Trouble diagnostics toggle<CR>", "Diagnostics (Trouble)" },
          },
      }, 
      { prefix = "<leader>" }
    )
  end
}
