return {
  "saghen/blink.cmp",
  version = "*",
  event = { "InsertEnter", "CmdLineEnter" },
  dependencies = {
    "rafamadriz/friendly-snippets",
    "L3MON4D3/LuaSnip",
  },
  opts_extend = { "sources.default" },
  opts = {
    keymap = {
      ["<C-j>"] = { "show", "select_next", "fallback" },
      ["<C-k>"] = { "show", "select_prev", "fallback" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<Tab>"] = { "accept", "fallback" },
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<up>"] = { "select_prev", "fallback" },
      ["<down>"] = { "select_next", "fallback" },
      ["<C-]>"] = { "show_documentation", "hide_documentation", "fallback" },
      ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      ["<C-d>"] = { "scroll_documentation_down", "fallback" },
      ["<C-f>"] = { "snippet_forward", "fallback" },
      ["<C-b>"] = { "snippet_backward", "fallback" },
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
