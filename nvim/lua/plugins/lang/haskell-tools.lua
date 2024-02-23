return {
  "mrcjkb/haskell-tools.nvim",
  version = "^3", -- Recommended
  ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
  config = function()
    require("haskell-tools").setup()
  end,
}
