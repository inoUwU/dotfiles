---@module "lazy"
---@type LazyPluginSpec
return {
  "rachartier/tiny-code-action.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
  keys = {
    {
      "<leader>.",
      function()
        require("tiny-code-action").code_action({})
      end,
      mode = { "n", "v" },
      desc = "Code Actions",
    },
  },
  opts = {
    picker = {
      "snacks",
      opts = {},
    },
  },
}
