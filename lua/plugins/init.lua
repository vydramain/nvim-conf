return {
  -- UI
  { "nvim-lualine/lualine.nvim", config = true },
  { "nvim-tree/nvim-tree.lua", config = true },
  { "nvim-telescope/telescope.nvim", tag = "0.1.5", dependencies = { "nvim-lua/plenary.nvim" }, config = true },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("config.cmp_config")
    end,
  },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("config.treesitter_config")
    end,
  },

  -- LSP
  { "williamboman/mason.nvim", config = true },
  { "williamboman/mason-lspconfig.nvim", config = true },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("config.lsp_config")
    end,
  },

  -- Git
  { "lewis6991/gitsigns.nvim", config = true },
  { "tpope/vim-fugitive" },  -- classic git plugin, optional but useful

  -- Git blame toggle plugin (needed for your blame keymaps)
  {
    "f-person/git-blame.nvim",
    config = function()
      vim.cmd [[let g:gitblame_enabled = 0]] -- disabled by default
    end,
  },

  -- Debugging
  { "nvim-neotest/nvim-nio" },  -- no config needed
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("config.dap_config")
    end,
  },
  { "rcarriga/nvim-dap-ui", config = true },

  -- Formatting
  {
    "stevearc/conform.nvim",
    config = function()
      require("config.formatter_config")
    end,
  },
}

