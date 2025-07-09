require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "c", "cpp", "cmake", "lua", "bash", "json", "markdown", "vim"
  },
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<leader>ss",
      node_incremental = "<leader>si",
      node_decremental = "<leader>sd",
    },
  },
})

