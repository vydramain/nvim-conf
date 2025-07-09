local dap = require("dap")

dap.adapters.cppdbg = {
  id = "cppdbg",
  type = "executable",
  command = "/path/to/OpenDebugAD7", -- from vscode-cpptools
}

dap.configurations.cpp = {
  {
    name = "Launch C++ Binary",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = true,
  },
}

