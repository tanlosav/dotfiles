return {
    "ray-x/go.nvim",
    dependencies = {  -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup({
        tag_options = "json=omitempty",
      })

      require("which-key").register({
          g = {
                name = "GO",
                s = {
                  name = "Struct",
                  f = { "<cmd>GoFillStruct<CR>", "Fill struct" },
                  a = { "<cmd>GoAddTag json,yaml<CR>", "Add tags" },
                  r = { "<cmd>GoRmTag json,yaml<CR>", "Remove tags" },
                },
                t = { "<cmd>GoTest<CR>", "Run go test ./..." },
              },
          }, 
          { prefix = "<leader>" }
        )
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
}