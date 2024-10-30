vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- line numbers
opt.relativenumber = false
opt.number = true

-- line wrapping
opt.wrap = false

-- soft-wrap text in insert mode (only visually) at the edge of the window
opt.number = true -- optional - will help to visually verify that it's working
opt.textwidth = 0
opt.wrapmargin = 0
opt.wrap = true
opt.linebreak = true -- optional - breaks by word rather than character

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
-- opt.background = "light" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- save undo history
opt.undofile = true

-- spell checking (use <z=> for spell suggestions)
vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- fuzzy completion
if vim.fn.has('nvim-0.11') == 1 then
    vim.opt.completeopt:append('fuzzy') -- Use fuzzy matching for built-in completion
end

-- enable auto save
vim.api.nvim_create_autocmd(
    { "FocusLost", "ModeChanged", "TextChanged", "BufEnter" }, { desc = "autosave", pattern = "*", command = "silent! update" }
)
