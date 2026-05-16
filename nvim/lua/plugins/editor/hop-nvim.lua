return {
  "phaazon/hop.nvim",
  branch = "v2",
  config = function()
    require("hop").setup({
      multi_windows = true,
    })
  end,
  keys = {
    {
      "<leader>j",
      "<cmd>HopWord<CR>",
      mode = { "n" },
      desc = "HopWord",
    },
  },
}
