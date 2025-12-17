return {
  "saghen/blink.cmp",
  version = "*",
  event = { "InsertEnter", "CmdLineEnter" },
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  opts_extend = { "sources.default" },
  opts = {
    keymap = {
      preset = "super-tab",
      ["<C-j>"] = { "show", "select_next", "fallback" },
      ["<C-k>"] = { "show", "select_prev", "fallback" },
      ["<C-l>"] = { "show", "show_documentation", "hide_documentation" },
    },
    sources = {
      default = { "snippets", "lsp", "path", "buffer" },
      per_filetype = {
        markdown = { "snippets", "lsp", "path" },
        mdx = { "snippets", "lsp", "path" },
      },
    },
    completion = {
      menu = { border = "single" },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
        window = { border = "single" },
      },
      ghost_text = { enabled = true },
    },
    signature = { window = { border = "single" } },
  },
}
