return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      sell = "nu",
      open_mapping = [[<c-\>]],
    })
  end,
}
