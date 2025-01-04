local dap = require('dap')
if vim.fn.has('win32') == 1 then
  dap.adapters.cppdbg = {
    type = 'executable',
    command = 'C:/Users/frode/AppData/Local/nvim-data/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7.exe',
    name = 'cppdbg',
    options = {
      detached = false,
    },
  }
else
  dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode',
    name = 'lldb'
  }
end

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}

require('persistent-breakpoints').setup{
	load_breakpoints_event = { "BufReadPost" }
}
