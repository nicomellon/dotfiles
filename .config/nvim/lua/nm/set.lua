-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false
vim.o.incsearch = true

-- Line numbers
vim.o.nu = true
vim.o.relativenumber = true

-- Enable cursorline highlight
vim.o.cursorline = true
vim.o.cursorcolumn = true

-- Folds
vim.o.foldmethod = "syntax"
vim.o.foldlevelstart = 99

-- Disable wrapping
vim.o.wrap = false

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Don't keep swap files or backups
vim.o.swapfile = false
vim.o.backup = false

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set true colors
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Keep at least 8 lines between cursor and edge of screen while scrolling vertically
vim.o.scrolloff = 8

