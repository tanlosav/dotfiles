return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "tabs",
    },
  },
  keys = {
    -- Buffer navigation.
    { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Previous buffer' },
    { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Next buffer' },
    { '<leader>bc', '<cmd>BufferLinePickClose<cr>', desc = 'Select a buffer to close' },
    { '<leader>bo', '<cmd>BufferLinePick<cr>', desc = 'Select a buffer to open' },
  },
}
