vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

-- case insensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- show line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- scroll before reaching edge of screen
vim.opt.scrolloff = 8

-- Color the colum to the right of the limit
vim.opt.colorcolumn = ""

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.md", "*.mdx", "*.rst", "*/COMMIT_EDITMSG"},
  callback = function()
    vim.opt.spell = true
  end
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "NvimTree_*",
  callback = function()
    require('neominimap').off()
  end
})

vim.api.nvim_create_autocmd("BufLeave", {
  pattern = "NvimTree_*",
  callback = function()
    require('neominimap').on()
  end
})

-- show trailing whitespace
vim.opt.list = true
vim.opt.listchars = { tab = '╞ ',
                      trail = '●',
                      extends = '…',
                      precedes = '…' }

if vim.fn.has('win32') == 1 then
    vim.opt.shell = 'pwsh'
    -- Configure shell options for PowerShell
    vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
    vim.opt.shellquote = "\""
    vim.opt.shellxquote = ""
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '',
    spacing = 2,
  },
  underline = true,
  signs = true,
  update_in_insert = false,
})
