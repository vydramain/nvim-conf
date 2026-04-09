return {
  -- Auto-close brackets, quotes, etc.
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({ check_ts = true })
      -- Integrate with cmp so ( after function completion adds closing )
      local ok_cmp, cmp = pcall(require, "cmp")
      if ok_cmp then
        cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
      end
    end,
  },

  -- Toggle comments with gcc / gc (supports TS embedded languages)
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
  },

  -- Surround: ys, cs, ds — add/change/delete surrounding chars
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = true,
  },

  -- Auto-close HTML/JSX tags
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "typescript", "typescriptreact", "javascript", "javascriptreact", "xml" },
    config = true,
  },
}
