local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fj', builtin.jumplist, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ss', builtin.spell_suggest, { noremap = true, silent = true})

local actions = require "telescope.actions"
require("telescope").setup {
  pickers = {
    buffers = {
      mappings = {
        n = {
          ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
        }
      }
    },
    live_grep = {
      initial_mode = "insert"
    }
  },
  defaults = {
    initial_mode = "normal"
  }
}
