return {
  "phaazon/hop.nvim",
  branch = "v2",
  config = function()
    require("hop").setup({
      multi_windows = true,
    })
  end,
  keys = {
    { mode = "n", "<leader>jl", "<cmd>HopLine<CR>", desc = "HopLine" },
    { mode = "n", "<leader>jj", "<cmd>HopWord<CR>", desc = "HopWord" },
    { mode = "n", "<leader>ja", "<cmd>HopAnywhere<CR>", desc = "HopAnywhere" },
  },
}
