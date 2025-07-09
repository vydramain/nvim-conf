local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- File ops
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)

-- LSP
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "gr", vim.lsp.buf.references, opts)
map("n", "K", vim.lsp.buf.hover, opts)
map("n", "<leader>rn", vim.lsp.buf.rename, opts)

-- DAP (debugger)
map("n", "<F5>", ":lua require'dap'.continue()<CR>", opts)
map("n", "<F10>", ":lua require'dap'.step_over()<CR>", opts)
map("n", "<F11>", ":lua require'dap'.step_into()<CR>", opts)
map("n", "<F12>", ":lua require'dap'.step_out()<CR>", opts)

