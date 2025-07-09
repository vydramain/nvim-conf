require("conform").setup({
  formatters_by_ft = {
    cpp = { "clang_format" },
    c = { "clang_format" },
  },
  format_on_save = {
    timeout_ms = 1000,
    lsp_fallback = true,
  },
})

