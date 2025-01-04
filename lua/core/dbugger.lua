local dap = require('dap')

local is_windows = vim.loop.os_uname().version:match('Windows')
local debugger_path = is_windows
  and vim.fn.expand('$localappdata') .. '/nvim-data/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7.exe'
  or vim.fn.expand('~/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7')

dap.adapters.cppdbg = {
    type = 'executable',
    command = debugger_path,
    name = 'cppdbg',
    options = {
      detached = false,
    },
 }

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
