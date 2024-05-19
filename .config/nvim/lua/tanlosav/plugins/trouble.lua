return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  -- keys = {
  --   { "<leader>xx", "<cmd>TroubleToggle<CR>", desc = "Open/close trouble list" },
  --   { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Open trouble workspace diagnostics" },
  --   { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Open trouble document diagnostics" },
  --   { "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", desc = "Open trouble quickfix list" },
  --   { "<leader>xl", "<cmd>TroubleToggle loclist<CR>", desc = "Open trouble location list" },
  --   { "<leader>xt", "<cmd>TodoTrouble<CR>", desc = "Open todos in trouble" },
  -- },
  config = function()
    require("which-key").register({
      x = {
            name = "Trouble",
            x = { "<cmd>TroubleToggle<CR>", "Open/close trouble list" },
            f = { "<cmd>TroubleToggle document_diagnostics<CR>", "Open trouble file diagnostics" },
            w = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "Open trouble workspace diagnostics" },
            f = { "<cmd>TroubleToggle quickfix<CR>", "Open trouble quickfix list" },
            l = { "<cmd>TroubleToggle loclist<CR>", "Open trouble location list" },
            t = { "<cmd>TodoTrouble<CR>", "Open todo list" },
          },
      }, 
      { prefix = "<leader>" }
    )
  end
}
