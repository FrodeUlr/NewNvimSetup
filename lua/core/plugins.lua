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
  'Mofiqul/adwaita.nvim',
  'navarasu/onedark.nvim',
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
  'github/copilot.vim',
  'nvim-neotest/nvim-nio',
  'Weissle/persistent-breakpoints.nvim',
  'mfussenegger/nvim-dap',
  'leoluz/nvim-dap-go',
  'pocco81/auto-save.nvim',
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
        local mc = require("multicursor-nvim")
        mc.setup()

        local set = vim.keymap.set

        -- Add or skip cursor above/below the main cursor.
        set({"n", "x"}, "<C-up>", function() mc.lineAddCursor(-1) end, { desc = "Add cursor up" })
        set({"n", "x"}, "<C-down>", function() mc.lineAddCursor(1) end, { desc = "Add cursor down" })
        set({"n", "x"}, "<leader><up>", function() mc.lineSkipCursor(-1) end, { desc = "Skip cursor up" })
        set({"n", "x"}, "<leader><down>", function() mc.lineSkipCursor(1) end, { desc = "Skip cursor down" })

        -- Add or skip adding a new cursor by matching word/selection
        set({"n", "x"}, "<leader>n", function() mc.matchAddCursor(1) end, { desc = "Match add cursor 1" })
        set({"n", "x"}, "<leader>s", function() mc.matchSkipCursor(1) end, { desc = "Match skip cursor 1" })
        set({"n", "x"}, "<leader>N", function() mc.matchAddCursor(-1) end, { desc = "Match add cursor -1" })
        set({"n", "x"}, "<leader>S", function() mc.matchSkipCursor(-1) end, { desc = "Match skip cursor -1" })

        -- Add and remove cursors with control + left click.
        set("n", "<c-leftmouse>", mc.handleMouse, { desc = "Add cursor" })
        set("n", "<c-leftdrag>", mc.handleMouseDrag, { desc = "Add cursor" })
        set("n", "<c-leftrelease>", mc.handleMouseRelease, { desc = "Add cursor" })

        -- Disable and enable cursors.
        set({"n", "x"}, "<leader>q", mc.toggleCursor, { desc = "Toggle cursor" })

        -- Mappings defined in a keymap layer only apply when there are
        -- multiple cursors. This lets you have overlapping mappings.
        mc.addKeymapLayer(function(layerSet)

            -- Select a different cursor as the main one.
            layerSet({"n", "x"}, "<left>", mc.prevCursor, { desc = "Previous cursor" })
            layerSet({"n", "x"}, "<right>", mc.nextCursor, { desc = "Next cursor" })

            -- Delete the main cursor.
            layerSet({"n", "x"}, "<leader>x", mc.deleteCursor, { desc = "Delete cursor" })

            -- Enable and clear cursors using escape.
            layerSet("n", "<esc>", function()
                if not mc.cursorsEnabled() then
                    mc.enableCursors()
                else
                    mc.clearCursors()
                end
            end)
        end)

        -- Customize how cursors look.
        local hl = vim.api.nvim_set_hl
        hl(0, "MultiCursorCursor", { link = "Cursor" })
        hl(0, "MultiCursorVisual", { link = "Visual" })
        hl(0, "MultiCursorSign", { link = "SignColumn"})
        hl(0, "MultiCursorMatchPreview", { link = "Search" })
        hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
        hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
        hl(0, "MultiCursorDisabledSign", { link = "SignColumn"})
    end
  },
  {
    'rmagatti/auto-session',
    lazy = false,
    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      -- log_level = 'debug',
    }
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  'hiphish/rainbow-delimiters.nvim',
  {
    "theHamsta/nvim-dap-virtual-text",
    opts = {},
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "nvim-neotest/nvim-nio" },
    -- stylua: ignore
    opts = {},
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup(opts)
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close({})
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close({})
      end
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = "mason.nvim",
    cmd = { "DapInstall", "DapUninstall" },
    opts = {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,
      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},
      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        "cppdbg",
        "codelldb",
        "delve",
        "python"
      },
    },
    -- mason-nvim-dap is loaded when nvim-dap loads
    config = function() end,
  },
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp"
  },

  { 'VonHeikemen/fine-cmdline.nvim',
    dependencies = {
      { 'MunifTanjim/nui.nvim' },
    },
  },

  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

  {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {},
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
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
    opts = {}
  },

  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  { 'folke/which-key.nvim',                   -- Keybindings
     config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup {
            auto = true,
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
  {
    "Isrothy/neominimap.nvim",
    version = "v3.*.*",
    enabled = true,
    lazy = false, -- NOTE: NO NEED to Lazy load
    -- Optional
    init = function()
        -- The following options are recommended when layout == "float"
        vim.opt.wrap = false
        vim.opt.sidescrolloff = 36 -- Set a large value

        --- Put your configuration here
        ---@type Neominimap.UserConfig
        vim.g.neominimap = {
            auto_enable = true,
        }
    end,
  },
}

require("lazy").setup(plugins, opts)
