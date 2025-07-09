local lspconfig = require("lspconfig")

-- Setup clangd with useful flags
lspconfig.clangd.setup({
  cmd = { "clangd", "--background-index", "--clang-tidy", "--completion-style=detailed" },
  on_attach = function(_, bufnr)
    local map = vim.keymap.set
    local opts = { buffer = bufnr, noremap = true, silent = true }

    map("n", "gd", vim.lsp.buf.definition, opts)
    map("n", "gr", vim.lsp.buf.references, opts)
    map("n", "K", vim.lsp.buf.hover, opts)
    map("n", "<leader>rn", vim.lsp.buf.rename, opts)
    map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  end,
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

