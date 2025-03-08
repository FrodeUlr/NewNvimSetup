-- General Mappings
vim.keymap.set('i', 'kj', '<Esc>', { desc = "Use 'kj' keys in quick succession for ESC" })

-- Pane Navigation (Using built-in window commands for consistency)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', { desc = "Move to down pane" })
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', { desc = "Move to up pane" })
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', { desc = "Move to left pane" })
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', { desc = "Move to right pane" })

-- Paste without overwriting register
vim.keymap.set("v", "p", '"_dP', { desc = "Paste without overwriting register"})

-- Yank/Copy to Clipboard
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y", { desc = "Yank into \" register" })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = "Yank into \" register" })

-- Delete to Black Hole Register
vim.keymap.set("n", "<leader>D", "\"_d", { desc = "Delete into \" register" })
vim.keymap.set("v", "<leader>D", "\"_d", { desc = "Delete into \" register" })

-- Move Lines Up/Down in Visual Mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep Window Centered While Scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Clear Search Highlighting
vim.keymap.set("n", "<space><space>", "<cmd> :noh<CR>", { desc = "Clear search highlighting" })

-- Open Terminal in Current File's Directory
vim.keymap.set("n", "<leader>t", ":belowright split | terminal | startinsert | cd %:p:h<CR>", { desc = "Open terminal in folder of current file"})

-- Find and Replace Visual Selection Using CTRL-r
vim.keymap.set("v", "<C-r>", "\"hy:%s/<C-r>h//gc<left><left><left>")

-- Buffer Navigation and Management
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
vim.api.nvim_set_keymap('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

-- Goto Buffer in Position
if vim.fn.has('win32') == 1 then
  for i = 1, 9 do
    vim.api.nvim_set_keymap('n', '<M-' .. i .. '>', '<Cmd>BufferGoto ' .. i .. '<CR>', opts)
  end
else
  for i = 1, 9 do
    vim.api.nvim_set_keymap('n', '<C-' .. i .. '>', '<Cmd>BufferGoto ' .. i .. '<CR>', opts)
  end
end
vim.api.nvim_set_keymap('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

-- Pin/Unpin Buffer & Close Buffer
vim.api.nvim_set_keymap('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)

-- LazyGit Integration
vim.api.nvim_set_keymap('n', '<Leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })

-- Terminal Keymaps
vim.api.nvim_set_keymap('n', '<Leader>tt', ':ToggleTerm<CR>', { noremap = true, silent = true })

function _G.set_terminal_keymaps()
    local opts2 = { buffer = 0 }
    vim.keymap.set('t', '<C-q>', [[<C-\><C-n>]], opts2)
    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts2)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts2)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts2)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts2)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts2)
    vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts2)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- FineCmd Integration
vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})

-- Copilot Integration
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-f>", "copilot#Accept('<CR>')", { expr = true, silent = true })
vim.keymap.set("i", "<C-j>", "<Plug>(copilot-next)", { noremap = false })

-- DAP (Debug Adapter Protocol) Mappings
vim.keymap.set('n', '<leader>dB', function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, { desc = "Breakpoint Condition" })
vim.keymap.set('n', '<leader>db', function() require("dap").toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
vim.keymap.set('n', '<leader>dc', function() require("dap").continue() end, { desc = "Run/Continue" })
vim.keymap.set('n', '<leader>da', function() require("dap").continue({ before = get_args }) end, { desc = "Run with Args" })
vim.keymap.set('n', '<leader>dC', function() require("dap").run_to_cursor() end, { desc = "Run to Cursor" })
vim.keymap.set('n', '<leader>dg', function() require("dap").goto_() end, { desc = "Go to Line (No Execute)" })
vim.keymap.set('n', '<leader>di', function() require("dap").step_into() end, { desc = "Step Into" })
vim.keymap.set('n', '<leader>dj', function() require("dap").down() end, { desc = "Down" })
vim.keymap.set('n', '<leader>dk', function() require("dap").up() end, { desc = "Up" })
vim.keymap.set('n', '<leader>dl', function() require("dap").run_last() end, { desc = "Run Last" })
vim.keymap.set('n', '<leader>do', function() require("dap").step_out() end, { desc = "Step Out" })
vim.keymap.set('n', '<leader>dO', function() require("dap").step_over() end, { desc = "Step Over" })
vim.keymap.set('n', '<leader>dP', function() require("dap").pause() end, { desc = "Pause" })
vim.keymap.set('n', '<leader>dr', function() require("dap").repl.toggle() end, { desc = "Toggle REPL" })
vim.keymap.set('n', '<leader>ds', function() require("dap").session() end, { desc = "Session" })
vim.keymap.set('n', '<leader>dt', function() require("dap").terminate() end, { desc = "Terminate" })
vim.keymap.set('n', '<leader>dw', function() require("dap.ui.widgets").hover() end, { desc = "Widgets" })

-- DAP UI Mappings
vim.keymap.set('n', '<leader>du', function() require("dapui").toggle() end, { desc = "DAP UI" })
vim.keymap.set({'n', 'v'}, '<leader>de', function() require("dapui").eval() end, { desc = "Eval" })

-- Minimap Mappings
-- Global Minimap Controls
vim.keymap.set("n", "<leader>nm", "<cmd>Neominimap toggle<cr>", { desc = "Toggle global minimap" })
vim.keymap.set("n", "<leader>no", "<cmd>Neominimap on<cr>", { desc = "Enable global minimap" })
vim.keymap.set("n", "<leader>nc", "<cmd>Neominimap off<cr>", { desc = "Disable global minimap" })
vim.keymap.set("n", "<leader>nr", "<cmd>Neominimap refresh<cr>", { desc = "Refresh global minimap" })

-- Window-Specific Minimap Controls
vim.keymap.set("n", "<leader>nwt", "<cmd>Neominimap winToggle<cr>", { desc = "Toggle minimap for current window" })
vim.keymap.set("n", "<leader>nwr", "<cmd>Neominimap winRefresh<cr>", { desc = "Refresh minimap for current window" })
vim.keymap.set("n", "<leader>nwo", "<cmd>Neominimap winOn<cr>", { desc = "Enable minimap for current window" })
vim.keymap.set("n", "<leader>nwc", "<cmd>Neominimap winOff<cr>", { desc = "Disable minimap for current window" })

-- Tab-Specific Minimap Controls
vim.keymap.set("n", "<leader>ntt", "<cmd>Neominimap tabToggle<cr>", { desc = "Toggle minimap for current tab" })
vim.keymap.set("n", "<leader>ntr", "<cmd>Neominimap tabRefresh<cr>", { desc = "Refresh minimap for current tab" })
vim.keymap.set("n", "<leader>nto", "<cmd>Neominimap tabOn<cr>", { desc = "Enable minimap for current tab" })
vim.keymap.set("n", "<leader>ntc", "<cmd>Neominimap tabOff<cr>", { desc = "Disable minimap for current tab" })

-- Buffer-Specific Minimap Controls
vim.keymap.set("n", "<leader>nbt", "<cmd>Neominimap bufToggle<cr>", { desc = "Toggle minimap for current buffer" })
vim.keymap.set("n", "<leader>nbr", "<cmd>Neominimap bufRefresh<cr>", { desc = "Refresh minimap for current buffer" })
vim.keymap.set("n", "<leader>nbo", "<cmd>Neominimap bufOn<cr>", { desc = "Enable minimap for current buffer" })
vim.keymap.set("n", "<leader>nbc", "<cmd>Neominimap bufOff<cr>", { desc = "Disable minimap for current buffer" })

-- Focus Controls
vim.keymap.set("n", "<leader>nf", "<cmd>Neominimap focus<cr>", { desc = "Focus on minimap" })
vim.keymap.set("n", "<leader>nu", "<cmd>Neominimap unfocus<cr>", { desc = "Unfocus minimap" })
vim.keymap.set("n", "<leader>ns", "<cmd>Neominimap toggleFocus<cr>", { desc = "Switch focus on minimap" })


local keymap = vim.api.nvim_set_keymap
-- Save breakpoints to file automatically.
keymap("n", "<leader>dbt", "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>", {desc = "Toggle breakpoint"})
keymap("n", "<leader>dbs", "<cmd>lua require('persistent-breakpoints.api').set_conditional_breakpoint()<cr>", {desc = "Set conditional breakpoint"})
keymap("n", "<leader>dbc", "<cmd>lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>", {desc = "Clear all breakpoints"})
keymap("n", "<leader>dbl", "<cmd>lua require('persistent-breakpoints.api').set_log_point()<cr>", {desc = "Set log point"})
