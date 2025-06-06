return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- lang
    "mrcjkb/neotest-haskell",
    "lawrence-laz/neotest-zig",
    { "fredrikaverpil/neotest-golang", version = "*" },
  },
  config = function()
    local neotest_golang_opts = {} -- Specify custom configuration
    require("neotest").setup({
      adapters = {
        require("neotest-golang")(neotest_golang_opts), -- Registration
      },
    })
    require("neotest").setup({
      adapters = {
        -- Registration
        require("neotest-zig")({
          dap = {
            adapter = "lldb",
          },
        }),
      },
    })
  end,
}
