return {
  -- Встроенная подсветка через treesitter (без nvim-treesitter)
  {
    "neovim/nvim-lspconfig",  -- опционально, для полной интеграции
    config = function()
      -- Отключаем классическую подсветку
      vim.opt.syntax = false

      -- Включаем treesitter highlighting для всех файлов
      vim.api.nvim_create_autocmd({ "FileType" }, {
        pattern = "*",
        callback = function()
          -- Пропускаем файлы, где treesitter может конфликтовать
          local ft = vim.bo.filetype
          if ft == "markdown" then
            -- Для markdown: используем гибридный режим
            vim.opt_local.syntax = true  -- vim regex для списков/заголовков
            pcall(vim.treesitter.start, 0, "markdown")
          else
            pcall(vim.treesitter.start)
          end
        end,
      })
    end,
  },

  -- Autotag — оставляем, он совместим!
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup({
        filetypes = { "html", "javascript", "typescript", "jsx", "tsx", "xml", "svelte" },
      })
    end,
  },

  -- Опционально: индентация через treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = false,  -- ❌ Отключаем основной плагин
  },
}


-- return {
--     "nvim-treesitter/nvim-treesitter",
--     event = { "BufReadPre", "BufNewFile" },
--     lazy = false,
--     build = ":TSUpdate",
--     dependencies = {
--         "windwp/nvim-ts-autotag",
--     },
--     config = function()
--         local treesitter = require("nvim-treesitter.configs")

--         treesitter.setup({
--             highlight = {
--                 enable = true,
--                 additional_vim_regex_highlighting = { "markdown" },
--             },
--             indent = { enable = true },
--             autotag = {
--                 enable = true,
--             },
--             -- ensure these language parsers are installed
--             ensure_installed = {
--                 "json",
--                 "javascript",
--                 "typescript",
--                 "tsx",
--                 "yaml",
--                 "html",
--                 "css",
--                 "prisma",
--                 "markdown",
--                 "markdown_inline",
--                 "svelte",
--                 "graphql",
--                 "bash",
--                 "lua",
--                 "vim",
--                 "dockerfile",
--                 "gitignore",
--                 "query",
--                 "vimdoc",
--                 "c",
--             },
--             incremental_selection = {
--                 enable = true,
--                 keymaps = {
--                     init_selection = "<C-space>",
--                     node_incremental = "<C-space>",
--                     scope_incremental = false,
--                     node_decremental = "<bs>",
--                 },
--             },
--         })
--     end,
-- }
