return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local transform_mod = require("telescope.actions.mt").transform_mod

    local trouble = require("trouble")
    local trouble_telescope = require("trouble.providers.telescope")

    -- or create your custom action
    local custom_actions = transform_mod({
      open_trouble_qflist = function(prompt_bufnr)
        trouble.toggle("quickfix")
      end,
    })

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
            ["<C-t>"] = trouble_telescope.smart_open_with_trouble,
          },
        },
      },
      pickers = {
        oldfiles = {
          cwd_only = true,
        }
      }
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    -- keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    -- keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    -- keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    -- keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    -- keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
    -- add keymaps and groups for those keybindings using a leader key with which-key group
    require("which-key").register({
      f = {
            name = "Telescope",
            b = { "<cmd>Telescope buffers<CR>", "Lists open buffers in current neovim instance" },
            r = { "<cmd>Telescope oldfiles<CR>", "List recent files" },
            f = { "<cmd>Telescope find_files<CR>", "Fuzzy find files in cwd" },
            s = { "<cmd>Telescope live_grep<CR>", "Find string in cwd" },
            c = { "<cmd>Telescope grep_string<CR>", "Find string under cursor in cwd" },
            t = { "<cmd>TodoTelescope<CR>", "Find todos" },
          },
      }, 
      { prefix = "<leader>" }
    )
  end,
}
