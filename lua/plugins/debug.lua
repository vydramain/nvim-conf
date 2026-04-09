return {
  { "nvim-neotest/nvim-nio", lazy = true },

  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "nvim-neotest/nvim-nio",

      -- DAP UI (auto-opens on debug start)
      {
        "rcarriga/nvim-dap-ui",
        config = function()
          local dap    = require("dap")
          local dapui  = require("dapui")

          dapui.setup({
            layouts = {
              {
                elements = {
                  { id = "scopes",      size = 0.4 },
                  { id = "breakpoints", size = 0.2 },
                  { id = "stacks",      size = 0.2 },
                  { id = "watches",     size = 0.2 },
                },
                size = 40, position = "left",
              },
              {
                elements = {
                  { id = "repl",    size = 0.5 },
                  { id = "console", size = 0.5 },
                },
                size = 10, position = "bottom",
              },
            },
          })

          -- Auto open/close UI with debug session
          dap.listeners.after.event_initialized["dapui_config"]  = function() dapui.open() end
          dap.listeners.before.event_terminated["dapui_config"]  = function() dapui.close() end
          dap.listeners.before.event_exited["dapui_config"]      = function() dapui.close() end
        end,
      },

      -- Auto-install debug adapters via mason
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = "williamboman/mason.nvim",
        config = function()
          require("mason-nvim-dap").setup({
            ensure_installed  = { "codelldb" }, -- C/C++ debugger (LLDB)
            automatic_installation = true,
            handlers = {},
          })
        end,
      },
    },

    keys = {
      { "<F5>",        function() require("dap").continue() end,                        desc = "Debug: Continue" },
      { "<F10>",       function() require("dap").step_over() end,                       desc = "Debug: Step over" },
      { "<F11>",       function() require("dap").step_into() end,                       desc = "Debug: Step into" },
      { "<F12>",       function() require("dap").step_out() end,                        desc = "Debug: Step out" },
      { "<leader>bp",  function() require("dap").toggle_breakpoint() end,               desc = "Toggle breakpoint" },
      { "<leader>bP",  function() require("dap").set_breakpoint(vim.fn.input("Condition: ")) end, desc = "Conditional breakpoint" },
      { "<leader>du",  function() require("dapui").toggle() end,                        desc = "Toggle DAP UI" },
      { "<leader>dr",  function() require("dap").repl.open() end,                       desc = "Open REPL" },
      { "<leader>dl",  function() require("dap").run_last() end,                        desc = "Run last" },
    },

    config = function()
      local dap = require("dap")

      -- C / C++ via codelldb (installed by mason-nvim-dap above)
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
          args    = { "--port", "${port}" },
        },
      }

      dap.configurations.cpp = {
        {
          name    = "Launch (codelldb)",
          type    = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd          = "${workspaceFolder}",
          stopOnEntry  = false,
          args         = {},
        },
        {
          name    = "Attach to process",
          type    = "codelldb",
          request = "attach",
          pid     = require("dap.utils").pick_process,
          cwd     = "${workspaceFolder}",
        },
      }
      dap.configurations.c = dap.configurations.cpp

      -- Breakpoint signs
      vim.fn.sign_define("DapBreakpoint",          { text = "🔴", texthl = "DiagnosticError" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "🟡", texthl = "DiagnosticWarn" })
      vim.fn.sign_define("DapStopped",             { text = "▶",  texthl = "DiagnosticInfo", linehl = "DapStoppedLine" })
    end,
  },
}
