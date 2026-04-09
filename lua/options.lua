local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- Display
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false
opt.conceallevel = 2

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Performance
opt.updatetime = 250
opt.timeoutlen = 500

-- Files
opt.undofile = true
opt.swapfile = false
opt.backup = false

-- Misc
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect"

-- Disable netrw (we use neo-tree instead)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
