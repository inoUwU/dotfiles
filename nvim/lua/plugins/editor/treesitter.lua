return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      install = { "zig" },
      ensure_installed = {
        "c",
        "cpp",
        "tsx",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "rust",
        "go",
        "ruby",
        "javascript",
        "html",
        "typescript",
        "markdown",
        "markdown_inline",
        "yaml",
        "gleam",
        "elm",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
