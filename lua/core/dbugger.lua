local dap = require('dap')
require('dap-go').setup()
local is_windows = vim.loop.os_uname().version:match('Windows')

-- Set up the dap adapter for cpp
local c_debugger_path = is_windows
  and vim.fn.expand('$localappdata') .. '/nvim-data/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7.exe'
  or vim.fn.expand('~/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7')

dap.adapters.cppdbg = {
    type = 'executable',
    command = c_debugger_path,
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

-- Set up the dap adapter for rust

local rust_debugger_path = is_windows
  and vim.fn.expand('$localappdata') .. '/nvim-data/mason/packages/codelldb/extension/adapter/codelldb.exe'
  or vim.fn.expand('~/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb')

dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = rust_debugger_path,
        args = { "--port", "${port}" },
    },
}

dap.configurations.rust = {
    {
        name = "Launch",
        type = "codelldb", -- Matches the adapter name
        request = "launch",
        program = function()
            vim.fn.jobstart({"cargo", "build"}, { cwd = vim.fn.getcwd() })
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {}, -- Additional arguments to pass to the program
    },
}


-- Set up the dap adapter for python

local python_debugger_path = is_windows
  and vim.fn.expand('$localappdata') .. '/nvim-data/mason/packages/debugpy/venv/Scripts/python.exe'
  or vim.fn.expand('~/.local/share/nvim/mason/packages/debugpy/venv/bin/python')

dap.adapters.python = {
  type = 'executable',
  command = python_debugger_path,
  args = { '-m', 'debugpy.adapter' },
}

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = 'Launch file',
    program = "${file}",
    pythonPath = function()
      return python_debugger_path
    end,
  },
}

require('persistent-breakpoints').setup{
	load_breakpoints_event = { "BufReadPost" }
}
