return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "tabs",
      -- style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
      -- name_formatter = function(buf)  -- buf contains:
      --   -- name                | str        | the basename of the active file
      --   -- path                | str        | the full path of the active file
      --   -- bufnr (buffer only) | int        | the number of the active buffer
      --   -- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
      --   -- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
      -- end,
      -- max_name_length = 18,
      -- max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
      -- truncate_names = true, -- whether or not tab names should be truncated
      -- tab_size = 18,
      -- diagnostics = false | "nvim_lsp" | "coc",
      -- offsets = {
      --   {
      --       filetype = "NvimTree",
      --       text = "File Explorer" | function ,
      --       text_align = "left" | "center" | "right"
      --       separator = true
      --   }
      -- },
      -- color_icons = true | false, -- whether or not to add the filetype icon highlights
      -- show_buffer_icons = true | false, -- disable filetype icons for buffers
      -- show_buffer_close_icons = true | false,
      -- show_close_icon = true | false,
      -- show_tab_indicators = true | false,
      -- show_duplicate_prefix = true | false, -- whether to show duplicate buffer prefix
      -- separator_style = "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
      separator_style = "slope",
    },
  },
  keys = {
    { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Previous buffer' },
    { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Next buffer' },
    { '<leader>bc', '<cmd>BufferLinePickClose<cr>', desc = 'Select a buffer to close' },
    { '<leader>bo', '<cmd>BufferLinePick<cr>', desc = 'Select a buffer to open' },
  },
}
