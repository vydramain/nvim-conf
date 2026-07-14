return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "markdown.mdx" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      -- Render only in normal mode; show raw markdown while editing a line.
      render_modes = { "n", "c" },
      anti_conceal = { enabled = true },
      heading = {
        sign = false,
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      },
      code = {
        style = "full",
        border = "thin",
        position = "left",
      },
      checkbox = {
        checked = { icon = "󰄲 " },
        unchecked = { icon = "󰄱 " },
      },
    },
    keys = {
      { "<leader>mp", "<cmd>RenderMarkdown toggle<cr>", desc = "Markdown: toggle preview" },
    },
  },
}
