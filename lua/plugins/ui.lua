return {
  -- Icons (required by many plugins)
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "nvim-lua/plenary.nvim",       lazy = true },
  { "MunifTanjim/nui.nvim",        lazy = true },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin",
          component_separators = "|",
          section_separators = { left = "", right = "" },
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { { "filename", path = 1 } },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },

  -- Buffer tabs (like VSCode tabs)
  {
    "akinsho/bufferline.nvim",
    event = "VimEnter",
    config = function()
      require("bufferline").setup({
        options = {
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(_, _, diag)
            local icons = { error = " ", warning = " ", info = " " }
            local result = {}
            for name, n in pairs(diag) do
              if icons[name] and n > 0 then
                table.insert(result, icons[name] .. n)
              end
            end
            return table.concat(result, " ")
          end,
          separator_style = "slant",
          offsets = {
            {
              filetype = "neo-tree",
              text = "File Explorer",
              highlight = "Directory",
              separator = true,
            },
          },
        },
      })
    end,
  },

  -- File explorer (VSCode-like sidebar)
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    keys = { { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle file explorer" } },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        popup_border_style = "rounded",
        window = { width = 35 },
        default_component_configs = {
          git_status = {
            symbols = {
              added     = "✚",
              modified  = "",
              deleted   = "✖",
              renamed   = "󰁕",
              untracked = "",
              ignored   = "",
              unstaged  = "󰄱",
              staged    = "",
              conflict  = "",
            },
          },
        },
        filesystem = {
          filtered_items = {
            visible = false,
            hide_dotfiles = false,
            hide_gitignored = true,
          },
          follow_current_file = { enabled = true },
          use_libuv_file_watcher = true,
        },
      })
    end,
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    main = "ibl",
    config = function()
      require("ibl").setup({
        indent = { char = "│" },
        scope  = { enabled = true },
      })
    end,
  },

  -- Keybinding hints popup
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup({ preset = "modern" })
      wk.add({
        { "<leader>f", group = "Find / Telescope" },
        { "<leader>g", group = "Git" },
        { "<leader>h", group = "Git hunks" },
        { "<leader>x", group = "Diagnostics (Trouble)" },
        { "<leader>b", group = "Buffer" },
        { "<leader>d", group = "Debug" },
        { "<leader>o", group = "TypeScript" },
        { "<leader>a", group = "TypeScript" },
        { "<leader>r", group = "TypeScript / Rename" },
      })
    end,
  },

  -- Diagnostics panel
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    config = function()
      require("trouble").setup({ use_diagnostic_signs = true })
    end,
  },

  -- Highlight word under cursor
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("illuminate").configure({
        delay = 200,
        large_file_cutoff = 2000,
      })
    end,
  },
}
