return {
  "uga-rosa/ccc.nvim",
  cmd = { "CccPick", "CccConvert", "CccHighlighterEnable", "CccHighlighterDisable", "CccHighlighterToggle" },
  keys = {
    { "<leader>cp", "<cmd>CccPick<cr>", desc = "Color picker" },
  },
  config = function()
    require("ccc").setup()
  end,
}
