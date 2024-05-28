return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore_enabled = true,
      auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
    })

    local keymap = vim.keymap

    -- keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
    -- keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory
    
    -- require("which-key").register({
    --   s = {
    --         name = "Session",
    --         r = { "<cmd>SessionRestore<CR>", "Restore session for cwd" },
    --         s = { "<cmd>SessionSave<CR>", "Save session for auto session root dir" },
    --       },
    --   }, 
    --   { prefix = "<leader>" }
    -- )
  end,
}
