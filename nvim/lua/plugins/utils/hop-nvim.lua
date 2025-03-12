return {
  "phaazon/hop.nvim",
  branch = "v2",
  config = function()
    require("hop").setup({
      multi_windows = true,
    })
  end,
  keys = {
    { mode = "n", "<leader>s", "<cmd>HopChar1<CR>", desc = "HopChar" },
  },
}
