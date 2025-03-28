return {
  "sindrets/diffview.nvim",
  opts = {},
  lazy = true,
  -- keys = {
  --   { mode = "n", "<leader>wf", "<cmd>DiffviewOpen<CR>", desc = "DiffOpen" },
  -- },
  init = function()
    local snacks = require("snacks")
    snacks
      .toggle({
        name = "Diffview",
        get = function()
          return require("diffview.lib").get_current_view() ~= nil
        end,
        set = function(state)
          vim.cmd("Diffview" .. (state and "Open" or "Close"))
        end,
      })
      :map("<leader>wf")
  end,
}
