require("mason").setup()
require("mason-nvim-dap").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "bashls",
    "clangd",
    "cmake",
    "cssls",
    "dockerls",
    "jsonls",
    "lua_ls",
    "marksman",
    "pyright",
    "rust_analyzer",
    "yamlls",
    "dockerls",
    "gopls",
    "ruff",
    "omnisharp"
  }
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf, desc = "Go to declaration" })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = "Go to definition" })
    vim.keymap.set('n', 'gk', function()
      vim.lsp.buf.hover()
      vim.api.nvim_command('hi clear Error')
    end, { buffer = ev.buf, desc = "Show tooltip" })
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = ev.buf, desc = "Go to implementation" })
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { buffer = ev.buf, desc = "Show references" })
    vim.keymap.set('n', 'gl', require('telescope.builtin').diagnostics, { buffer = ev.buf, desc = "Show diagnostics" })
    vim.keymap.set('n', 'ge', vim.diagnostic.open_float, { buffer = ev.buf, desc = "Show diagnostics in float" })
    vim.keymap.set('n', 'gK', vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "Show signature help" })
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, { buffer = ev.buf, desc = "Add workspace folder" })
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, { buffer = ev.buf, desc = "Remove workspace folder" })
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { buffer = ev.buf, desc = "List workspace folders" })
    vim.keymap.set('n', '<space>Dd', vim.lsp.buf.type_definition, { buffer = ev.buf, desc = "Go to type definition" })
    vim.keymap.set('n', 'gR', vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename" })
    vim.keymap.set({ 'n', 'v' }, 'ga', vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code action" })
    vim.keymap.set('n', 'gF', function()
      vim.lsp.buf.format { async = true }
    end, { buffer = ev.buf, desc = "Format" })
  end,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").bashls.setup { capabilities = capabilities }
require("lspconfig").clangd.setup { capabilities = capabilities }
require("lspconfig").cmake.setup { capabilities = capabilities }
require("lspconfig").cssls.setup { capabilities = capabilities }
require("lspconfig").dockerls.setup { capabilities = capabilities }
require("lspconfig").jsonls.setup { capabilities = capabilities }
require("lspconfig").lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      }
    }
  },
  capabilities = capabilities
}
require("lspconfig").marksman.setup { capabilities = capabilities,
  cmd = { "D:/lsp/marksman", "server" }
}
require("lspconfig").pyright.setup { capabilities = capabilities }
require("lspconfig").yamlls.setup { capabilities = capabilities }
-- require("lspconfig").csharp_ls.setup { capabilities = capabilities }
require("lspconfig").gopls.setup { capabilities = capabilities }
require("lspconfig").ruff.setup { capabilities = capabilities }
require("lspconfig").omnisharp.setup { capabilities = capabilities,
  cmd = { "dotnet", vim.fn.stdpath "data" .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
  -- Enables support for reading code style, naming convention and analyzer
  -- settings from .editorconfig.
  enable_editorconfig_support = true,
  -- If true, MSBuild project system will only load projects for files that
  -- were opened in the editor. This setting is useful for big C# codebases
  -- and allows for faster initialization of code navigation features only
  -- for projects that are relevant to code that is being edited. With this
  -- setting enabled OmniSharp may load fewer projects and may thus display
  -- incomplete reference lists for symbols.
  enable_ms_build_load_projects_on_demand = false,
  -- Enables support for roslyn analyzers, code fixes and rulesets.
  enable_roslyn_analyzers = false,
  -- Specifies whether 'using' directives should be grouped and sorted during
  -- document formatting.
  organize_imports_on_format = true,
  -- Enables support for showing unimported types and unimported extension
  -- methods in completion lists. When committed, the appropriate using
  -- directive will be added at the top of the current file. This option can
  -- have a negative impact on initial completion responsiveness,
  -- particularly for the first few completion sessions after opening a
  -- solution.
  enable_import_completion = true,
  -- Specifies whether to include preview versions of the .NET SDK when
  -- determining which version to use for project loading.
  sdk_include_prereleases = true,
  -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
  -- true
  analyze_open_documents_only = false,
}

-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").lua_ls.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- ...
