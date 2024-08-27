local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  'ellisonleao/gruvbox.nvim',
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  'nvim-lualine/lualine.nvim',
  'nvim-treesitter/nvim-treesitter',
  'kylechui/nvim-surround',
  'windwp/nvim-autopairs',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-buffer',
  'lewis6991/gitsigns.nvim',
  'rose-pine/neovim',
  'tomasiser/vim-code-dark',
  'folke/tokyonight.nvim',
  'rebelot/kanagawa.nvim',
  'preservim/nerdcommenter',
  'whiteinge/diffconflicts',
  'simrat39/rust-tools.nvim',
  'nvim-lua/plenary.nvim',
  'lambdalisue/suda.vim',
  'numToStr/Navigator.nvim',
  'jakewvincent/mkdnflow.nvim',
  'catppuccin/nvim',
  'echasnovski/mini.icons',
  'romgrk/barbar.nvim',
  'kdheepak/lazygit.nvim',
  'MunifTanjim/nui.nvim',
  'petertriho/nvim-scrollbar',

  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    --version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp"
  },

  { 'VonHeikemen/fine-cmdline.nvim',
    dependencies = {
      { 'MunifTanjim/nui.nvim' },
    },
  },

  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },

  {
    'nvim-telescope/telescope.nvim', version = '0.1.4',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },

  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      {'nvim-telescope/telescope.nvim'},
    }
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },

  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  { 'folke/which-key.nvim',                   -- Keybindings
     config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup {
            auto = true,
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
     end
  },
  { 'akinsho/toggleterm.nvim',
      config = function()
        require("toggleterm").setup({
        close_on_exit = false,
        autochdir = true,
        shell = vim.o.shell,
        size = 20
      })
    end
  },
}

require("lazy").setup(plugins, opts)
