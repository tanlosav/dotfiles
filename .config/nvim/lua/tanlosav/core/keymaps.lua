vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set('n', '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })

-- window management
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- switch between splits (windows)
keymap.set("n", "<C>h", "<C-w>h", { desc = "Swith split to the left" })
keymap.set("n", "<C>l", "<C-w>l", { desc = "Swith split to the right" })
keymap.set("n", "<C>j", "<C-w>j", { desc = "Swith split to the down" })
keymap.set("n", "<C>k", "<C-w>k", { desc = "Swith split to the up" })

-- keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
-- keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
-- keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
-- keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
-- keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- scroll half page down and up, keeping the cursor centered
keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll downwards' })
keymap.set('n', '<C-u>', '<C-b>zz', { desc = 'Scroll upwards' })

-- Terminal mode
keymap.set("t", "<esc>",     "<C-\\><C-N>", opts)
keymap.set("t", "<C-H>",  "<C-\\><C-N><C-w>h", opts)
keymap.set("t", "<C-J>",    "<C-\\><C-N><C-w>j", opts)
keymap.set("t", "<C-K>",    "<C-\\><C-N><C-w>k", opts)
keymap.set("t", "<C-L>", "<C-\\><C-N><C-w>l", opts)

-- make U opposite to u (redo)
keymap.set('n', 'U', '<C-r>', { desc = 'Redo' })

-- word navigation in non-normal modes.
keymap.set({ 'i', 'c' }, '<C-h>', '<C-Left>', { desc = 'Move word(s) backwards' })
keymap.set({ 'i', 'c' }, '<C-l>', '<C-Right>', { desc = 'Move word(s) forwards' })

-- Prevent deleting from also copying
vim.keymap.set({'n', 'v'}, 'd', '"_d', { noremap = true })
vim.keymap.set('n', 'dd', '"_dd', { noremap = true })