return {
  -- Claude Code in Neovim: same MCP/WebSocket protocol as the VS Code extension,
  -- so Claude sees the current file/selection and shows diffs in real buffers.
  {
    "coder/claudecode.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    version = "*",
    opts = {
      terminal = {
        -- native provider: no snacks.nvim dependency
        provider = "native",
        split_side = "right",
        split_width_percentage = 0.35,
      },
      diff_opts = {
        vertical_split = true,
        open_in_current_tab = true,
      },
    },
    cmd = {
      "ClaudeCode",
      "ClaudeCodeFocus",
      "ClaudeCodeSend",
      "ClaudeCodeAdd",
      "ClaudeCodeTreeAdd",
      "ClaudeCodeDiffAccept",
      "ClaudeCodeDiffDeny",
    },
    keys = {
      { "<leader>cc", "<cmd>ClaudeCode<cr>",         desc = "Claude: toggle" },
      { "<leader>cf", "<cmd>ClaudeCodeFocus<cr>",    desc = "Claude: focus" },
      { "<leader>cr", "<cmd>ClaudeCode --resume<cr>", desc = "Claude: resume session" },
      { "<leader>cb", "<cmd>ClaudeCodeAdd %<cr>",    desc = "Claude: add current buffer" },
      { "<leader>cs", "<cmd>ClaudeCodeSend<cr>",     mode = "v", desc = "Claude: send selection" },
      -- Add file(s) from the neo-tree sidebar
      {
        "<leader>cs",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Claude: add file from tree",
        ft = { "neo-tree", "neo-tree-popup" },
      },
      -- Diff review
      { "<leader>cy", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Claude: accept diff" },
      { "<leader>cn", "<cmd>ClaudeCodeDiffDeny<cr>",   desc = "Claude: reject diff" },
    },
  },
}
