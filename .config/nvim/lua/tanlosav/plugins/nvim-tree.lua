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

-- `<C-t>`           Open: New Tab              |nvim-tree-api.node.open.tab()|
-- `<C-v>`           Open: Vertical Split       |nvim-tree-api.node.open.vertical()|
-- `<C-x>`           Open: Horizontal Split     |nvim-tree-api.node.open.horizontal()|
-- `<BS>`            Close Directory            |nvim-tree-api.node.navigate.parent_close()|
-- `<CR>`            Open                       |nvim-tree-api.node.open.edit()|
-- `<Tab>`           Open Preview               |nvim-tree-api.node.open.preview()|
-- `-`               Up                         |nvim-tree-api.tree.change_root_to_parent()|
-- `a`               Create File Or Directory   |nvim-tree-api.fs.create()|
-- `bd`              Delete Bookmarked          |nvim-tree-api.marks.bulk.delete()|
-- `bt`              Trash Bookmarked           |nvim-tree-api.marks.bulk.trash()|
-- `bmv`             Move Bookmarked            |nvim-tree-api.marks.bulk.move()|
-- `c`               Copy                       |nvim-tree-api.fs.copy.node()|
-- `d`               Delete                     |nvim-tree-api.fs.remove()|
-- `D`               Trash                      |nvim-tree-api.fs.trash()|
-- `]e`              Next Diagnostic            |nvim-tree-api.node.navigate.diagnostics.next()|
-- `[e`              Prev Diagnostic            |nvim-tree-api.node.navigate.diagnostics.prev()|
-- `gy`              Copy Absolute Path         |nvim-tree-api.fs.copy.absolute_path()|
-- `ge`              Copy Basename              |nvim-tree-api.fs.copy.basename()|
-- `H`               Toggle Filter: Dotfiles    |nvim-tree-api.tree.toggle_hidden_filter()|
-- `I`               Toggle Filter: Git Ignore  |nvim-tree-api.tree.toggle_gitignore_filter()|
-- `m`               Toggle Bookmark            |nvim-tree-api.marks.toggle()|
-- `p`               Paste                      |nvim-tree-api.fs.paste()|
-- `r`               Rename                     |nvim-tree-api.fs.rename()|
-- `R`               Refresh                    |nvim-tree-api.tree.reload()|
-- `u`               Rename: Full Path          |nvim-tree-api.fs.rename_full()|
-- `U`               Toggle Filter: Hidden      |nvim-tree-api.tree.toggle_custom_filter()|
-- `W`               Collapse                   |nvim-tree-api.tree.collapse_all()|
-- `x`               Cut                        |nvim-tree-api.fs.cut()|
-- `y`               Copy Name                  |nvim-tree-api.fs.copy.filename()|
-- `Y`               Copy Relative Path         |nvim-tree-api.fs.copy.relative_path()|

    -- custom mappings
    local api = require "nvim-tree.api"
    keymap.set('n', 'h', api.node.open.horizontal, {desc = 'Open in horizontal split'})
    keymap.set('n', 'v', api.node.open.vertical, {desc = 'Open in vertical split'})

    require("which-key").add(
      {
        { "<leader>e", group = "Nvim Tree" },
        { "<leader>ee", "<cmd>NvimTreeFocus<CR>", desc = "Open the tree if it is closed, and then focus on the tree" },
        { "<leader>ec", "<cmd>NvimTreeCollapse<CR>", desc = "Collapse file explorer" },
        { "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", desc = "Toggle file explorer on current file" },
        { "<leader>er", "<cmd>NvimTreeRefresh<CR>", desc = "Refresh file explorer" },
        { "<leader>et", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
      }
    )

  end
}
