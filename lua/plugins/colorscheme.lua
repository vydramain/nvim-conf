return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- load before everything else
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- dark theme with purple/blue/teal accents
        integrations = {
          cmp = true,
          gitsigns = true,
          neotree = true,
          telescope = { enabled = true },
          treesitter = true,
          which_key = true,
          lsp_trouble = true,
          indent_blankline = { enabled = true },
          mason = true,
          dap = { enabled = true, enable_ui = true },
          neogit = true,
          bufferline = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
          },
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
