return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  cmd = { "NoNeckPain", "NoNeckPainResize", "NoNeckPainToggleLeftSide", "NoNeckPainToggleRightSide" },
  keys = {
    { "<leader>wn", "<cmd>NoNeckPain<cr>", desc = "Toggle NoNeckPain" },
  },
}
