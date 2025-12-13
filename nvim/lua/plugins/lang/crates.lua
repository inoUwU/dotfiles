return {
  "saecki/crates.nvim",
  tag = "stable",
  ft = { "rust" },
  config = function()
    require("crates").setup()
  end,
}
