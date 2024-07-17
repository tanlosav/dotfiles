return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
    "debugloop/telescope-undo.nvim"
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local transform_mod = require("telescope.actions.mt").transform_mod

    -- local trouble = require("trouble")
    -- local trouble_telescope = require("trouble.providers.telescope")

    -- -- or create your custom action
    -- local custom_actions = transform_mod({
    --   open_trouble_qflist = function(prompt_bufnr)
    --     trouble.toggle("quickfix")
    --   end,
    -- })

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            -- ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
            -- ["<C-t>"] = trouble_telescope.smart_open_with_trouble,
          },
        },
      },
      pickers = {
        oldfiles = {
          cwd_only = true,
        }
      },
      extensions = {
        undo = {},
      }
    })

    telescope.load_extension("fzf")
    telescope.load_extension("undo")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set('n', '<leader><leader>', "<cmd>Telescope oldfiles<CR>", {desc = 'Recent files'})

    -- require("which-key").register({
    --     f = {
    --       name = "Telescope",
    --       b = { "<cmd>Telescope buffers<CR>", "Open buffers" },
    --       f = { "<cmd>Telescope oldfiles<CR>", "Recent files" },
    --       g = {
    --         name = "Git",
    --         h = { "<cmd>Telescope git_bcommits<CR>", "Buffer's history" },
    --       },
    --       j = { "<cmd>Telescope jumplist<CR>", "Jump list" },
    --       k = { "<cmd>Telescope keymaps<CR>", "Keymappings" },
    --       l = {
    --         name = "LSP",
    --         c = { "<cmd>Telescope lsp_incoming_calls<CR>", "Calls" },
    --         d = { "<cmd>Telescope lsp_definitions<CR>", "Definitions" },
    --         e = { "<cmd>Telescope diagnostics bufnr=0<CR>", "Diagnostics" },
    --         i = { "<cmd>Telescope lsp_implementations<CR>", "Implementations" },
    --         r = { "<cmd>Telescope lsp_references<CR>", "References" },
    --         s = { "<cmd>Telescope lsp_document_symbols<CR>", "Symbols" },
    --         t = { "<cmd>Telescope lsp_type_definitions<CR>", "Type definition" },
    --       },
    --       m = { "<cmd>Telescope marks<CR>", "Marks" },
    --       o = { "<cmd>Telescope vim_options<CR>", "Vim options" },
    --       r = { "<cmd>Telescope registers<CR>", "Registers" },
    --       t = { "<cmd>TodoTelescope<CR>", "Todo" },
    --       u = { "<cmd>Telescope undo<cr>", "Undo" },
    --     },
    --     s = {
    --       name = "Search",
    --       c = { "<cmd>Telescope grep_string<CR>", "Find string under cursor in cwd" },
    --       f = { "<cmd>Telescope find_files<CR>", "Fuzzy find files in cwd" },
    --       h = { "<cmd>Telescope search_history<CR>", "Search history" },
    --       s = { "<cmd>Telescope live_grep<CR>", "Find string in cwd" },
    --     },

    --   },
    --   { prefix = "<leader>" }
    -- )
    require("which-key").add(
      {
        { "<leader>f", group = "Telescope" },
        { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Open buffers" },
        { "<leader>ff", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },
        { "<leader>fg", group = "Git" },
        { "<leader>fgh", "<cmd>Telescope git_bcommits<CR>", desc = "Buffer's history" },
        { "<leader>fj", "<cmd>Telescope jumplist<CR>", desc = "Jump list" },
        { "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Keymappings" },
        { "<leader>fl", group = "LSP" },
        { "<leader>flc", "<cmd>Telescope lsp_incoming_calls<CR>", desc = "Calls" },
        { "<leader>fld", "<cmd>Telescope lsp_definitions<CR>", desc = "Definitions" },
        { "<leader>fle", "<cmd>Telescope diagnostics bufnr=0<CR>", desc = "Diagnostics" },
        { "<leader>fli", "<cmd>Telescope lsp_implementations<CR>", desc = "Implementations" },
        { "<leader>flr", "<cmd>Telescope lsp_references<CR>", desc = "References" },
        { "<leader>fls", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Symbols" },
        { "<leader>flt", "<cmd>Telescope lsp_type_definitions<CR>", desc = "Type definition" },
        { "<leader>fm", "<cmd>Telescope marks<CR>", desc = "Marks" },
        { "<leader>fo", "<cmd>Telescope vim_options<CR>", desc = "Vim options" },
        { "<leader>fr", "<cmd>Telescope registers<CR>", desc = "Registers" },
        { "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "Todo" },
        { "<leader>fu", "<cmd>Telescope undo<cr>", desc = "Undo" },
        { "<leader>s", group = "Search" },
        { "<leader>sc", "<cmd>Telescope grep_string<CR>", desc = "Find string under cursor in cwd" },
        { "<leader>sf", "<cmd>Telescope find_files<CR>", desc = "Fuzzy find files in cwd" },
        { "<leader>sh", "<cmd>Telescope search_history<CR>", desc = "Search history" },
        { "<leader>ss", "<cmd>Telescope live_grep<CR>", desc = "Find string in cwd" },
      }
    )
  end,
}
