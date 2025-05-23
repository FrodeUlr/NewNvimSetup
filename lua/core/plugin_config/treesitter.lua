require("nvim-treesitter.configs").setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = {
        "bash",
        "fish",
        "lua",
        "markdown",
        "vim",
        "regex",
        "markdown_inline",
        "json",
        "yaml",
        "toml",
        "html",
        "css",
        "javascript",
        "typescript",
        "angular",
        "c_sharp",
        "cpp",
        "cmake",
        "c",
        "go",
        "java",
        "python",
        "rust",
        "tsx",
        "dockerfile",
        "scss",
        "sql",
        "terraform",
        "xml",
        "git_config",
        "gitignore"
  },

  modules = { },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  ignore_install = { },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  vim.filetype.add({
    extension = {
      overlay = 'devicetree',
    },
  }),

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = { "diff" },
  },
  ident = {
    enable = true,
  }
}
