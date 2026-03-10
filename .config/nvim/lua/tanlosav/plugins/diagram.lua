return {
  "3rd/diagram.nvim",
  dependencies = {
    {
      "3rd/image.nvim",
      opts = {
        backend = "kitty",
        processor = "magick_cli",
      },
    },
  },

  opts = {
    events = {
      render_buffer = { "InsertLeave", "BufWinEnter", "TextChanged" },
      clear_buffer = { "BufLeave" },
    },

    renderer_options = {
      mermaid = {
        background = nil,
        theme = nil,
        scale = 1,
        width = nil,
        height = nil,
        cli_args = nil,
      },
      plantuml = {
        charset = nil,
        cli_args = nil,
      },
      d2 = {
        theme_id = nil,
        dark_theme_id = nil,
        scale = nil,
        layout = nil,
        sketch = nil,
        cli_args = nil,
      },
      gnuplot = {
        size = nil,
        font = nil,
        theme = nil,
        cli_args = nil,
      },
    },
  },
  keys = {
    {
      "K", -- or any key you prefer
      function()
        require("diagram").show_diagram_hover()
      end,
      mode = "n",
      ft = { "markdown", "mermaid" }, -- Only in these filetypes
      desc = "Show diagram in new tab",
    },
  },
}
