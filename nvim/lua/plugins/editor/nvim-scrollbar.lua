return {
  "petertriho/nvim-scrollbar",
  desc = "scrollbarを表示する",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("scrollbar").setup()
  end,
}
