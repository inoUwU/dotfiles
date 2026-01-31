-- lua/plugins/which-key.lua
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Help (which-key)",
    },
    {
      "<leader>f",
      function() end,
      desc = "Find/Filer",
    },
    {
      "<leader>h",
      function() end,
      desc = "Hop",
    },
    {
      "<leader>d",
      function() end,
      { name = "Debugger (DAP)" },
      desc = "Debugger (DAP)",
    },
    {
      "<leader>b",
      function() end,
      desc = "Format/Buffer",
    },
    {
      "<leader>l",
      function() end,
      desc = "Lsp",
    },
    {
      "<leader>w",
      function() end,
      desc = "Window",
    },
    {
      "<leader>a",
      function() end,
      desc = "avante",
    },
    {
      "<leader>s",
      function() end,
      desc = "sidekick",
    },
  },
}
