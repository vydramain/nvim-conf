local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Window resize
map("n", "<C-Up>",    ":resize +2<CR>", opts)
map("n", "<C-Down>",  ":resize -2<CR>", opts)
map("n", "<C-Left>",  ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Buffer navigation
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprev<CR>", opts)
map("n", "<leader>bd", ":bd<CR>", { noremap = true, silent = true, desc = "Close buffer" })

-- File explorer
map("n", "<leader>e", ":Neotree toggle<CR>", { noremap = true, silent = true, desc = "Toggle file tree" })

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>",          { desc = "Find files" })
map("n", "<leader>fg", ":Telescope live_grep<CR>",           { desc = "Live grep" })
map("n", "<leader>fb", ":Telescope buffers<CR>",             { desc = "Buffers" })
map("n", "<leader>fh", ":Telescope help_tags<CR>",           { desc = "Help tags" })
map("n", "<leader>fr", ":Telescope oldfiles<CR>",            { desc = "Recent files" })
map("n", "<leader>fw", ":Telescope grep_string<CR>",         { desc = "Find word under cursor" })
map("n", "<leader>fs", ":Telescope lsp_document_symbols<CR>", { desc = "Document symbols" })
map("n", "<leader>fd", ":Telescope diagnostics<CR>",         { desc = "Diagnostics" })

-- LSP (global fallbacks; per-buffer bindings set in on_attach)
map("n", "gd", vim.lsp.buf.definition,        { desc = "Go to definition" })
map("n", "gD", vim.lsp.buf.declaration,       { desc = "Go to declaration" })
map("n", "gr", vim.lsp.buf.references,        { desc = "Go to references" })
map("n", "gi", vim.lsp.buf.implementation,    { desc = "Go to implementation" })
map("n", "K",  vim.lsp.buf.hover,             { desc = "Hover docs" })
map("n", "<leader>rn", vim.lsp.buf.rename,    { desc = "Rename symbol" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<leader>D",  vim.diagnostic.open_float, { desc = "Show diagnostics" })
map("n", "[d", vim.diagnostic.goto_prev,      { desc = "Prev diagnostic" })
map("n", "]d", vim.diagnostic.goto_next,      { desc = "Next diagnostic" })

-- Formatting
map("n", "<leader>fm", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format file" })

-- Git
map("n", "<leader>gg", ":Neogit<CR>",                    { desc = "Neogit" })
map("n", "<leader>gd", ":DiffviewOpen<CR>",              { desc = "Diff view" })
map("n", "<leader>gh", ":DiffviewFileHistory %<CR>",     { desc = "File history" })
map("n", "<leader>gc", ":DiffviewClose<CR>",             { desc = "Close diff" })

-- Debugging (DAP)
map("n", "<F5>",        function() require("dap").continue() end,          { desc = "Debug: Continue" })
map("n", "<F10>",       function() require("dap").step_over() end,         { desc = "Debug: Step over" })
map("n", "<F11>",       function() require("dap").step_into() end,         { desc = "Debug: Step into" })
map("n", "<F12>",       function() require("dap").step_out() end,          { desc = "Debug: Step out" })
map("n", "<leader>bp",  function() require("dap").toggle_breakpoint() end, { desc = "Toggle breakpoint" })
map("n", "<leader>du",  function() require("dapui").toggle() end,          { desc = "Toggle DAP UI" })

-- Diagnostics panel (Trouble)
map("n", "<leader>xx", ":Trouble diagnostics toggle<CR>",            { desc = "Diagnostics" })
map("n", "<leader>xd", ":Trouble lsp_document_diagnostics toggle<CR>", { desc = "Document diagnostics" })
map("n", "<leader>xl", ":Trouble loclist toggle<CR>",                { desc = "Location list" })
map("n", "<leader>xq", ":Trouble qflist toggle<CR>",                 { desc = "Quickfix" })

-- Clear search highlight
map("n", "<Esc>", ":noh<CR>", opts)
