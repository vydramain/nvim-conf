local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- C/C++ follow ~/.clang-format (Linux-Kernel-Inspired Readable C++ Style):
-- real tabs displayed 4 wide; the 128-column limit is a convention enforced
-- visually (colorcolumn), not by clang-format (ColumnLimit: 0 keeps manual breaks)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.colorcolumn = "128"
  end,
})

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

-- Terminal tab title: "nvim | <repo-name>"
opt.title = true

local function update_title()
  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel 2>/dev/null")[1]
  local dir
  if vim.v.shell_error == 0 and git_root and git_root ~= "" then
    dir = vim.fn.fnamemodify(git_root, ":t")
  else
    dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
  end
  vim.opt.titlestring = "nvim | " .. dir
end

update_title()

vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged", "BufEnter" }, {
  callback = update_title,
})
