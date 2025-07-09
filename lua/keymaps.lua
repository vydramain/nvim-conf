local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = "\\"  -- Set leader key to backslash

-- File operations
map("n", "<leader>t", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)

-- LSP keybindings
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "gr", vim.lsp.buf.references, opts)
map("n", "K", vim.lsp.buf.hover, opts)
map("n", "<leader>rn", vim.lsp.buf.rename, opts)

-- Debugging (DAP) keybindings
map("n", "<F5>", function() require("dap").continue() end, opts)
map("n", "<F10>", function() require("dap").step_over() end, opts)
map("n", "<F11>", function() require("dap").step_into() end, opts)
map("n", "<F12>", function() require("dap").step_out() end, opts)

-- Add // comment on current line (Ctrl+/ mapped to Ctrl+_)
map("n", "<C-_>", "I// <Esc>", opts)  -- <C-/> often sends <C-_> in terminals

-- Git blame line keybindings
map("n", "<leader>eb", ":ToggleBlameLine<CR>", opts)
map("n", "<leader>db", ":DisableBlameLine<CR>", opts)

