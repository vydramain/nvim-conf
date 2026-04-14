return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = {
          -- Core
          "lua", "vim", "vimdoc", "query",
          "bash", "json", "yaml", "toml",
          "markdown", "markdown_inline",
          -- TypeScript / Node
          "typescript", "tsx", "javascript", "jsdoc",
          "html", "css", "graphql",
          -- C++
          "c", "cpp", "cmake",
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        -- Smart text objects: select/move by function, class, argument
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = { query = "@function.outer", desc = "outer function" },
              ["if"] = { query = "@function.inner", desc = "inner function" },
              ["ac"] = { query = "@class.outer",    desc = "outer class" },
              ["ic"] = { query = "@class.inner",    desc = "inner class" },
              ["aa"] = { query = "@parameter.outer", desc = "outer argument" },
              ["ia"] = { query = "@parameter.inner", desc = "inner argument" },
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]f"] = "@function.outer",
              ["]c"] = "@class.outer",
            },
            goto_prev_start = {
              ["[f"] = "@function.outer",
              ["[c"] = "@class.outer",
            },
          },
        },
      })
    end,
  },
}
