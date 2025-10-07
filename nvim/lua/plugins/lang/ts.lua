return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {},

  config = function()
    require("typescript-tools").setup({
      settings = {
        tsserver = {
          -- tsserver側のdiagnosticsを無効化
          diagnostics = false,
        },
      },
    })
  end,
}
