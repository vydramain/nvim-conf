return {
  -- Git signs in the gutter + hunk navigation
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        signs = {
          add          = { text = "▎" },
          change       = { text = "▎" },
          delete       = { text = "" },
          topdelete    = { text = "" },
          changedelete = { text = "▎" },
          untracked    = { text = "▎" },
        },
        current_line_blame = false,
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          local map = function(mode, keys, func, desc)
            vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = "Git: " .. desc })
          end

          -- Hunk navigation
          map("n", "]h", gs.next_hunk,     "Next hunk")
          map("n", "[h", gs.prev_hunk,     "Prev hunk")

          -- Hunk actions
          map("n", "<leader>hs", gs.stage_hunk,   "Stage hunk")
          map("n", "<leader>hr", gs.reset_hunk,   "Reset hunk")
          map("v", "<leader>hs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage hunk")
          map("v", "<leader>hr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset hunk")
          map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
          map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")

          -- Diff / blame
          map("n", "<leader>hd", gs.diffthis,                               "Diff this")
          map("n", "<leader>hD", function() gs.diffthis("~") end,           "Diff this ~")
          map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame line")
          map("n", "<leader>tb", gs.toggle_current_line_blame,              "Toggle line blame")
        end,
      })
    end,
  },

  -- Full git UI: commit, rebase, branch management (like Magit / GitLens)
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    keys = { { "<leader>gg", "<cmd>Neogit<cr>", desc = "Git: Open Neogit" } },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("neogit").setup({
        integrations = {
          diffview  = true,
          telescope = true,
        },
        -- Show signs similar to gitsigns
        signs = {
          hunk    = { "", "" },
          item    = { ">", "v" },
          section = { ">", "v" },
        },
      })
    end,
  },

  -- Diff viewer + full file / branch history review
  -- <leader>gd  → open diff for current changes
  -- <leader>gh  → open history for current file
  -- <leader>gc  → close
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewFileHistory",
    },
    config = function()
      require("diffview").setup({
        enhanced_diff_hl = true,
        view = {
          default = { layout = "diff2_horizontal" },
          merge_tool = {
            layout = "diff3_horizontal",
            disable_diagnostics = true,
          },
        },
      })
    end,
  },
}
