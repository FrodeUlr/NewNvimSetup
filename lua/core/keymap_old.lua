vim.keymap.set('i', 'kj', '<Esc>', { desc = "Use 'kj' keys in quick succession for ESC" })

-- remap pane navigation
vim.keymap.set('n', '<C-j>', '<CMD>NavigatorDown<CR>', { desc = "Move to down pane" })
vim.keymap.set('n', '<C-k>', '<CMD>NavigatorUp<CR>', { desc = "Move to up pane" })
vim.keymap.set('n', '<C-h>', '<CMD>NavigatorLeft<CR>', { desc = "Move to left pane" })
vim.keymap.set('n', '<C-l>', '<CMD>NavigatorRight<CR>', { desc = "Move to right pane" })

-- Paste without overwriting register
vim.keymap.set("v", "p", '"_dP', { desc = "Paste without overwriting register"})

-- Copy text to " register
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y", { desc = "Yank into \" register" })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = "Yank into \" register" })

-- Delete text to " register
vim.keymap.set("n", "<leader>d", "\"_d", { desc = "Delete into \" register" })
vim.keymap.set("v", "<leader>d", "\"_d", { desc = "Delete into \" register" })

-- Move lines up or down when in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep window centered when going up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<space><space>", "<cmd> :noh<CR>", { desc = "Clear search highlighting" })

vim.keymap.set("n", "<leader>t", function()
   vim.cmd("cd %:p:h")
   vim.cmd("belowright split | terminal")
   vim.cmd("startinsert")
end, { desc = "Open terminal in folder of current file"})

-- Find and replace visual selection using CTRL-r
vim.keymap.set("v", "<C-r>", "\"hy:%s/<C-r>h//gc<left><left><left>")

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)

vim.api.nvim_set_keymap('n', '<Leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })

-- Toggle terminal mappings
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

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- FineCmd
vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})

-- Copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-f>", "copilot#Accept('<CR>')", { expr = true, silent = true })
vim.keymap.set("i", "<C-j>", "<Plug>(copilot-next)", { noremap = false })
