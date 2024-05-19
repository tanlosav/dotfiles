return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        width = 35,
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    -- add keymaps and groups for those keybindings using a leader key with which-key group
    require("which-key").register({
      e = {
            name = "Nvim Tree",
            e = { "<cmd>NvimTreeFocus<CR>", "Open the tree if it is closed, and then focus on the tree" },
            t = { "<cmd>NvimTreeToggle<CR>", "Toggle file explorer" },
            f = { "<cmd>NvimTreeFindFileToggle<CR>", "Toggle file explorer on current file" },
            c = { "<cmd>NvimTreeCollapse<CR>", "Collapse file explorer" },
            r = { "<cmd>NvimTreeRefresh<CR>", "Refresh file explorer" },
          },
      }, 
      { prefix = "<leader>" }
    )

  end
}
