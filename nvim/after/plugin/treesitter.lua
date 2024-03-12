require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "rust", "haskell", "javascript", "typescript", "java", "go", "c", "dockerfile", "dart", "gomod", "graphql", "html", "htmldjango", "json", "php", "perl", "ruby", "scala", "solidity", "sql", "terraform", "vue", "xml", "swift", "latex", "yaml", "toml", "elixir", "cpp", "bash", "c_sharp", "cmake"},
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,
  -- List of parsers to ignore installing (or "all")

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
