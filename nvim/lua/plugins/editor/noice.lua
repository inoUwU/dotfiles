return {
  "folke/noice.nvim",
  event = "VeryLazy",

  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },

  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },

    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = true,
    },

    routes = {
      {
        filter = {
          event = "notify",
          any = {
            { find = "No parser" },
            { find = "parser for" },
            { find = "treesitter" },
            { find = "tree%-sitter" },
          },
        },
        opts = { skip = true },
      },
    },
    filter = {
      event = "msg_show",
      any = {
        { find = "No parser" },
        { find = "parser for" },
        { find = "treesitter" },
        { find = "skipping" },
      },
    },
    opts = { skip = true },
  },

  init = function()
    require("notify").setup({
      background_colour = "#000000",
    })
  end,
}
