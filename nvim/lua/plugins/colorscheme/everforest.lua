return {
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  -- Optional; default configuration will be used if setup isn't called.
  config = function()
    require("everforest").setup({
      -- Your config here
    })
  end,
}
